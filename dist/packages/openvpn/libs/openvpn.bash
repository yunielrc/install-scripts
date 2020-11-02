# shellcheck shell=bash
set -euEo pipefail

#
# Configure openvpn server defined in sudo docker-compose.yml
#
# Parameters
#   openvpn_client_name
#   openvpn_host
#   openvpn_port
#   openvpn_protocol
#
configure_openvpn() {
  # Dependencies
  type -P dos2unix >/dev/null || {
    sudo apt-get update -y
    sudo apt-get install -y dos2unix
  }
  # parameters
  local -r openvpn_client_name="$1"
  local -r openvpn_host="$2"
  local -r openvpn_port="$3"
  local -r openvpn_protocol="$4"
  # Initialize the configuration files
  echo -e "\n>> Initializing configuration files"
  sudo docker-compose run --rm openvpn \
    ovpn_genconfig -u "${openvpn_protocol}://${openvpn_host}"
  # Add 'duplicate-cn' option to vpn config
  sudo docker-compose run --rm --entrypoint /bin/sh \
    openvpn \
    -c 'echo duplicate-cn >> /etc/openvpn/openvpn.conf'
  echo ">> DONE. Initializing configuration files"

  # Initialize certificates
  echo -e "\n>> Initializing certificates"
  echo "$openvpn_host" |
    sudo docker-compose run --rm openvpn \
      ovpn_initpki nopass
  echo ">> DONE. Initializing certificates"

  # Generate a client certificate without a passphrase
  echo -e "\n>> Generating a client certificate without a passphrase"
  sudo docker-compose run --rm openvpn \
    easyrsa build-client-full "${openvpn_client_name}" nopass
  echo ">> DONE. Generating a client certificate without a passphrase"

  # Client configuration

  ## Retrieve the client configuration with embedded certificates
  echo -e "\n>> Retrieving the client configuration with embedded certificates"
  sudo docker-compose run --rm openvpn \
    ovpn_getclient "${openvpn_client_name}" | sudo tee "${openvpn_client_name}.ovpn"

  dos2unix "${openvpn_client_name}.ovpn"

  ## Replaces vpn host port on vpn client profile
  sed -i "s/1194 ${openvpn_protocol}/${openvpn_port} ${openvpn_protocol}/" \
    "${openvpn_client_name}.ovpn"
  echo ">> DONE. Retrieving the client configuration with embedded certificates"

}

# if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
#   echo ">> Doesn't execute this script, include it" >&2
#   exit 1
# fi
