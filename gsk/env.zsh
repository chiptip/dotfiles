export USER=sk343407

export PROXY_SERVER="gskproxy.gsk.com"
export PROXY_PORT="800"

export HTTP_PROXY="http://${USER}:${PASS}@${PROXY_SERVER}:${PROXY_PORT}/"
export http_proxy=${HTTP_PROXY}
export HTTPS_PROXY=${HTTP_PROXY}
export https_proxy=${HTTP_PROXY}