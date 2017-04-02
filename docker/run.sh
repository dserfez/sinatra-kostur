#!/bin/bash

: "${C_NAME:=myapp}"
: "${RACK_ENV:=production}"

WD="$( cd "$(dirname "$( dirname "$0" )")/.." && pwd )"

first_run() {
  FIRSTRUN=true
  echo "this is app first run and will be started in RW mode"
}

[[ -e Gemfile.lock ]] || first_run

[[ -z "${FIRSTRUN}" ]] && APP_RO=":ro"

run_container() {
  docker run --rm -ti \
    --name "${C_NAME}" \
    --hostname "${C_NAME}" \
    -v "${WD}/app":/opt/app"${APP_RO}" \
    -e RACK_ENV="${RACK_ENV}" \
    sinatra-kostur:onbuild "${@}"
}

docker start "${C_NAME}" || run_container
