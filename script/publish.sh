#!/usr/bin/env bash

PROFILE=${AWS_PROFILE:-$DEFAULT}
BUCKET=abhishekpareek.io
DIR=_site/
aws s3 sync $DIR s3://$BUCKET/ 
