#!/bin/sh

# Run from the _scripts folder...

DIR=$(dirname "$0")

cd $DIR/..

echo "Deleting old publication"
rm -rf docs

echo "Generating site"
hugo -d docs

echo "lambdastack.io" > docs/CNAME

echo "Updating docs on github"
git add --all && git commit -m "Publishing to docs (publish_to_ghdocs.sh)" && git push origin master
