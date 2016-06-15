#!/usr/bin/env bash

PROFILE=${AWS_PROFILE:-$DEFAULT}
BUCKET=abhishekpareek.io
DIR=_site/
aws s3 sync $DIR s3://$BUCKET/ 
aws configure set preview.cloudfront true
aws cloudfront create-invalidation --distribution-id  $DISTRIBUTION_ID --paths "*"
