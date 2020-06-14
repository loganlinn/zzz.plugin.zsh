#!/bin/zsh
#
# @file zzz.plugin.zsh
# @brief Plugin to put your system to sleep

# @description initiate system catnap
# @arg n integer delay in seconds (default: 5)
zzz() {
  n="$((${1:-5}))"
  local UPLINE=$(tput cuu1)
  local ERASELINE=$(tput el)

  cat << EOF
  　　　∧__∧
  　　 (　･ω･)　<( ʏᴀᴡɴ )
  　 ＿|　⊃／(＿＿
  ／　└-(＿＿＿_／
  ￣￣￣￣￣￣￣
EOF

  for ((i=n; i>=1; i--)); do
    printf "\rSleeping in %s... " $i
    sleep 1
  done

  cat << EOF

  　＜⌒／ヽ-､_＿_
  ／＜_/＿＿＿＿／
  ￣￣￣￣￣￣￣

EOF

  sleep 1

  case "$(uname -s)" in
    'Linux')
      systemctl suspend
      ;;
    'Darwin')
      pmset sleepnow
      ;;
  esac
}

