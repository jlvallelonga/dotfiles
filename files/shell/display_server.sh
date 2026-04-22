print_display_server () {
  echo "current display server:"
  echo $XDG_SESSION_TYPE
}

switch_display_server () {
  # echo "To switch to X11, log out and select the X11 session from the login screen."
  echo "current display server:"
  echo $XDG_SESSION_TYPE
  echo ""
  echo "look for WaylandEnable=false"
  echo ""
  echo "contents of /etc/gdm3/custom.conf:"
  cat /etc/gdm3/custom.conf

  # echo "Disable Wayland by editing /etc/gdm3/custom.conf and uncommenting the line:"
  # echo "WaylandEnable=false"
  # sudo vim /etc/gdm3/custom.conf
}

# switch_to_x11 () {
#   sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/custom.conf
# }

# switch_to_wayland () {
#   sudo sed -i 's/^WaylandEnable=false/#WaylandEnable=false/' /etc/gdm3/custom.conf
# }
