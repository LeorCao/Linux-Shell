#!/bin/bash

PROXY_URL="socks5://127.0.0.1:1080"

git config --global http.proxy ${PROXY_URL}
git config --global https.proxy ${PROXY_URL}