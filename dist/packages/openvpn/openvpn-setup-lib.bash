# shellcheck shell=bash
set -euEo pipefail

sudo apt-get update -y && sudo apt-get install -y dos2unix

#
# Configure openvpn server defined in docker-compose.yml
#
# Arguments
#   openvpn_client_name
#   openvpn_host
#   openvpn_port
#   openvpn_protocol
#
configure_openvpn() {
  local -r openvpn_client_name="$1"
  local -r openvpn_host="$2"
  local -r openvpn_port="$3"
  local -r openvpn_protocol="$4"
  # Initialize the configuration files
  echo ">> Initializing configuration files"
  docker-compose run --rm openvpn \
    ovpn_genconfig -u "${openvpn_protocol}://${openvpn_host}"
  # Add 'duplicate-cn' option to vpn config
  docker-compose run --rm --entrypoint /bin/sh \
    openvpn \
    -c 'echo duplicate-cn >> /etc/openvpn/openvpn.conf'
  echo ">> DONE. Initializing configuration files"

  # Initialize certificates
  echo ">> Initializing certificates"
  echo "$openvpn_host" |
    docker-compose run --rm openvpn \
      ovpn_initpki nopass
  echo ">> DONE. Initializing certificates"

  # Generate a client certificate without a passphrase
  echo ">> Generating a client certificate without a passphrase"
  docker-compose run --rm openvpn \
    easyrsa build-client-full "${openvpn_client_name}" nopass
  echo ">> DONE. Generating a client certificate without a passphrase"

  # Client configuration

  ## Retrieve the client configuration with embedded certificates
  echo ">> Retrieving the client configuration with embedded certificates"
  docker-compose run --rm openvpn \
    ovpn_getclient "${openvpn_client_name}" >"${openvpn_client_name}.ovpn"

  dos2unix "${openvpn_client_name}.ovpn"

  ## Replaces vpn host port on vpn client profile
  sed -i "s/1194 ${openvpn_protocol}/${openvpn_port} ${openvpn_protocol}/" \
    "${openvpn_client_name}.ovpn"
  echo ">> DONE. Retrieving the client configuration with embedded certificates"

}

if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
  echo "Doesn't execute this script, include it" >&2
  exit 1
fi