active_interface () {
  ip route get 8.8.8.8 | grep -oP 'dev \K\S+'
}


mac_address () {
  local active_interface=$(active_interface)
  if [[ -z "$active_interface" ]]; then
    echo "No active network interface found"
    return 1
  fi
  nmcli device show "$active_interface" | grep -i 'GENERAL.HWADDR' | awk '{print $2}'
}
