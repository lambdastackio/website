#!/bin/sh

DIR=$(dirname "$0")

cd $DIR/..

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out gh-pages branch into public"
# Don't do '-B' if you use custom domain. It will remove the domain every time. '-b' will create it the first only.
git worktree add public gh-pages

echo "Removing existing files - removes what worktree adds!"
rm -rf public/*

echo "Generating site"
hugo

echo "Updating gh-pages branch"
cd public && git add --all && git commit -m "Publishing to gh-pages (publish_to_ghpages.sh)" && git push origin gh-pages -f
