#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db786d7caada300138e10eb/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db786d7caada300138e10eb
curl -s -X POST https://api.stackbit.com/project/5db786d7caada300138e10eb/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db786d7caada300138e10eb/webhook/build/publish > /dev/null
