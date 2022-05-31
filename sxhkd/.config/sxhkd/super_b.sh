result=$(ls -1 ~/fastpaste | rofi -dmenu)

if [ $? -eq 0 ]; then
  content=$(cat ~/fastpaste/$result)
  trimmed="${content#"${content%%[![:newline:]]*}"}"
  echo -n $trimmed | xsel -ib
fi
