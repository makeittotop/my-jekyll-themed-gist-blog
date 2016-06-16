#!/usr/bin/env bash

PROFILE=${AWS_PROFILE:-$DEFAULT}
BUCKET=abhishekpareek.io
DIR=_site/
aws s3 sync $DIR s3://$BUCKET/ 

aws configure set preview.cloudfront true
invalidation_batch="{ \"InvalidationBatch\":{ \"Paths\":{ \"Quantity\":1, \"Items\":[\"/index.html\"]}, \"CallerReference\":\"$(date +%s)\" } }"
aws cloudfront create-invalidation --cli-input-json "$invalidation_batch" --distribution-id=$DISTRIBUTION_ID

