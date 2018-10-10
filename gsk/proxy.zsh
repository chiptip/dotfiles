# configure proxy for git while on corporate network

# this information is configured in cntlm.conf
# source ~/Workspaces/dotfiles/gsk/secret.zsh
# export PROXY_SERVER="gskproxy.gsk.com"
# export PROXY_PORT="800"
# export USER=sk343407
# export HTTP_PROXY="http://${USER}:${PASS}@${PROXY_SERVER}:${PROXY_PORT}/"

# From https://gist.github.com/garystafford/8196920
function proxy_on(){
   # assumes $USERDOMAIN, $USERNAME, $USERDNSDOMAIN
   # are existing Windows system-level environment variables

   # assumes $PASSWORD, $PROXY_SERVER, $PROXY_PORT
   # are existing Windows current user-level environment variables (your user)

   # environment variables are UPPERCASE even in git bash
   export HTTP_PROXY="http://127.0.0.1:3128"
   export HTTPS_PROXY=$HTTP_PROXY
   export http_proxy=$HTTP_PROXY
   export https_proxy=$HTTP_PROXY
   export FTP_PROXY=$HTTP_PROXY
   export SOCKS_PROXY=$HTTP_PROXY

   export NO_PROXY="localhost,127.0.0.1"

   # Update git and npm to use the proxy
   # git config --global http.proxy $HTTP_PROXY
   # git config --system http.sslcainfo /bin/curl-ca-bundle.crt
   # git config --global http.sslcainfo /bin/curl-ca-bundle.crt
   # npm config set proxy $HTTP_PROXY
   # npm config set https-proxy $HTTP_PROXY
   # npm config set strict-ssl false
   # npm config set registry "http://registry.npmjs.org/"

   # optional for debugging
   export GIT_CURL_VERBOSE=1

   # optional Self Signed SSL certs and
   # internal CA certificate in an corporate environment
   export GIT_SSL_NO_VERIFY=1


   env | grep -e _PROXY -e GIT_ -e proxy | sort
   echo -e "\nProxy-related environment variables set."

   # clear
}

# Disable proxy settings
function proxy_off(){
   variables=( \
      "HTTP_PROXY" "HTTPS_PROXY" "FTP_PROXY" "SOCKS_PROXY" \
      "NO_PROXY" "GIT_CURL_VERBOSE" "GIT_SSL_NO_VERIFY" \
      "http_proxy" "https_proxy"
   )

   for i in "${variables[@]}"
   do
      unset $i
   done

   env | grep -e _PROXY -e GIT_ | sort
   echo -e "\nProxy-related environment variables removed."
}


# determine if proxy should be on or off
# obtain network location
location=$(networksetup -getcurrentlocation)

if [ "$location" = "GSK" ]; then
   proxy_on
else
   proxy_off
fi