#!/bin/bash

WD="$( cd "$(dirname "$( dirname "$0" )")/.." && pwd )"

: "${C_IMAGE:=sinatra-kostur}"

#echo "${C_IMAGE}"

#CWD=$(pwd)


docker build --rm -t "${C_IMAGE}:onbuild" "${WD}/docker"
