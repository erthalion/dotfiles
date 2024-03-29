function fish_prompt
  set -g RETVAL $status
  set_color --bold white
  printf "\n"
  printf '┌('

  set_color normal
  set_color green
  printf '%s' (whoami)
  set_color normal

  set_color magenta
  printf '@'
  printf '%s' (hostname|cut -d . -f 1)
  set_color --bold white
  printf ')'

  printf '─('
  if test -n "$RETVAL" -a "$RETVAL" -ne 0
    set_color red
    printf "✘"
  else
    set_color green
    printf "✔"
  end
  set_color --bold white
  printf ")"

  printf '─('
  set_color normal
  set_color 77ECF2
  printf (date "+%H:%M %a %b %d")
  set_color --bold white
  printf ")"

  # Line 2
  echo
  printf "└─("
  set_color --bold 74FF52
  printf (prompt_pwd)
  set_color --bold white
  printf ")"

  printf '─('
  set_color --bold 58FC92
  printf '%s files, ' (ls -1 | wc -l | sed 's: ::g')
  set_color --bold FAF734
  printf "total "
  set_color normal
  set_color white
  printf '%s' (ls -lah | grep -m 1 total | sed 's/total //')
  set_color --bold white
  printf ")"

  switch $fish_bind_mode
    case default
      set_color --bold A6A6A6
      printf "─(☯)"
    case insert
      set_color --bold BCFA93 
      printf "─(✎)"
    case visual
      set_color --bold FAA693
      printf "─(↔)"
  end
  printf '⊳ '
end
