#!/bin/sh

set -e

#
# main entry point to run s3cmd
#
S3CMD_PATH=/opt/s3cmd/s3cmd

#
# Check for required parameters
#
if [ -z "${ACCESS_KEY}" ]; then
    echo "ERROR: The environment variable ACCESS_KEY is not set."
    exit 1
fi

if [ -z "${SECRET_KEY}" ]; then
    echo "ERROR: The environment variable SECRET_KEY is not set."
    exit 1
fi

echo "" > /.s3cfg
cat /opt/base_s3cfg >> /.s3cfg
echo "" >> /.s3cfg
echo "access_key=${ACCESS_KEY}" >> /.s3cfg
echo "secret_key=${SECRET_KEY}" >> /.s3cfg

${S3CMD_PATH} --config=/.s3cfg "$@"
