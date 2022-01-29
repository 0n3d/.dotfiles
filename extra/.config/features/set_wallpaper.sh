function set_day_wallpaper() {
  feh --bg-scale ~/Pictures/Wallpapers/mon1.jpg --bg-scale ~/Pictures/Wallpapers/mon2.jpg
}

function set_night_wallpaper() {
  feh --bg-scale ~/Pictures/Wallpapers/night.jpg
}

hours=$(date +"%H")

if [ $hours -ge 9 -a $hours -lt 21 ]
then
  set_day_wallpaper
else
  set_night_wallpaper
fi
