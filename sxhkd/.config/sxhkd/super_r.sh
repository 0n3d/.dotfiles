#!/usr/bin/env bash

declare -A entries
entries=(
  ["logout"]="~/.config/features/logout"
  ["walltemp"]="~/.config/features/new_tmp_wallpaper"
)

custom_path="$HOME/.config/private/super_r.sh"
[[ -f ${custom_path} ]] && source "${custom_path}"

for key in "${!private[@]}"; do
  entries[$key]=${private[$key]}
done

dmenu_list=$(printf "\n%s" "${!entries[@]}")
result=$(echo "${dmenu_list:1}" | rofi -dmenu)

[ $? -eq 0 ] && bash -c "${entries[$result]}"&
