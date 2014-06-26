function parse_git_branch
  if test -d .git
    set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
    set -l git_diff (git diff)

    if test -n "$git_diff"
      printf ' (%s%s%s)' (set_color $fish_git_dirty_color) $branch (set_color normal)
    else
      printf ' (%s%s%s)' (set_color $fish_git_not_dirty_color) $branch (set_color normal)
    end
  end
end

function fish_prompt
  printf '%s%s%s%s\n$ ' (set_color $fish_color_cwd) (pwd) (set_color normal) (parse_git_branch)
end
