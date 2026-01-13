#!/bin/sh

# Checks if the first argument is a common prefix of all the paths in the
# following arguments. If a prefix exactly matches one of the paths, it is not
# considered a prefix.
is_common_prefix() {
  _prefix=$1
  shift 1

  for _path in "$@"; do
    case "${_path}" in
      "${_prefix}") return 1 ;;
      "${_prefix}"*) ;;
      *) return 1 ;;
    esac
  done
}

# Outputs the longest prefix of the path arguments. The length of the computed
# prefix will always be shorter than that of the shortest path. In other words,
# the prefix will never fully match one of the paths.
longest_path_prefix() {
  _path_prefix="$1"

  until is_common_prefix "${_path_prefix}" "$@" || [ "${_path_prefix}" = "/" ]; do
    _path_prefix=$(dirname "${_path_prefix}")
  done

  if [ "${_path_prefix}" = "/" ]; then
    echo ""
  else
    echo "${_path_prefix}/"
  fi
}

if [ -z "${PROJECT_DIRS}" ]; then
  echo "Expected PROJECT_DIRS to contain a list of directories" >&2
  exit 1
fi

for project_dir in ${PROJECT_DIRS}; do
  search_path_opts="${search_path_opts:-}${separator:-}--search-path ${project_dir}"
  separator=" "
done

# shellcheck disable=2086
prefix="$(longest_path_prefix ${PROJECT_DIRS})"

# shellcheck disable=2086
selected_path=$(fd ${search_path_opts} --type dir --exact-depth 1 --absolute-path \
  | cut -c $((${#prefix} + 1))- \
  | fzf --tmux 80% --cycle --color=base16)

if [ -z "${selected_path}" ]; then
  exit 0
fi

selected_path="${prefix}${selected_path}"

window_name=$(basename "${selected_path}")

tmux new-window -n "${window_name}" -c "${selected_path}"
