
public_ip_address_v4 () { echo "$(curl -4s icanhazip.com)"; }
alias ip=public_ip_address_v4

private_ip_address_v4 () {
  # if ipconfig is not available, use ifconfig
  if command -v ipconfig &> /dev/null; then
    echo $(ipconfig getifaddr en0)
  else
    echo $(hostname -I | awk '{print $1}')
  fi
}
alias ipp=private_ip_address_v4
