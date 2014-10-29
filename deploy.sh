#!/usr/bin/env bash 
set -e

# Variables
title="SeaSponge"
currentCommit=$(git rev-parse --verify HEAD)
if [[ -z "$TRAVIS_BRANCH" ]]; then
    # TRAVIS_BRANCH is not set
    currentBranch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
else
    # TRAVIS_BRANCH is set
    # Must be Travis CI
    currentBranch="$TRAVIS_BRANCH"
fi
stableBranch="master"
deployBranch="gh-pages"
destDir="dist"

echo "=========="
echo "Preparing to Deploy $title!"
echo ""

if [ "$stableBranch" == "$currentBranch" ]; then
    echo "You are on the correct stable branch, ${stableBranch}"
else
    echo "You are on branch ${currentBranch} and not on the stable branch, ${stableBranch}!"
    echo "Only the stable branch can be deployed."
    exit 1;
fi

# Check if working tree is clean
echo "Checking if you have a clean working tree on this branch, ${currentBranch}"

if [[ -z $(git status -s) ]]; then
    echo "Clean, let's continue!";

    # Build to dist/
    echo "Going to building the app into directory ${destDir}/"
    grunt build

    # Temporarily move bower_components/ directory
    mkdir .tmp/ || true
    mv bower_components/ .tmp/bower_components/ || true
    
    # Checkout Deploy branch
    git fetch origin gh-pages:gh-pages
    git checkout "$deployBranch"

    # Clean deploy directory
    echo "Cleaning up deploy branch by removing old build files"
    find . -maxdepth 1 | grep -v "\./README\.md\|\./LICENSE\|\.git\|\./${destDir}\|\./node_modules\|\./bower_components\|\.tmp\|\.$" | xargs rm -r
    
    # Move up dist/ to current directory for deploying
    echo "Move the build files in ${destDir}/ up to the current directory for deploying"
    mv ${destDir}/* .[^.]* . || true

    echo "Remove directory ${destDir}/"
    rm -r "${destDir}/"

    echo "Adding changes to Git staging area"
    git add --all

    echo "Committing changes for build from commit ${currentCommit}"
    git commit -m "Deploy build from branch ${currentBranch} for commit ${currentCommit}"

    echo "Pushing changes"
    if [[ -z "$GH_TOKEN" ]]; then
        # GH_TOKEN is not set
        git push origin "$deployBranch"
    else
        # GH_TOKEN is set
        # Must be in Travis CI
        git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" "${deployBranch}":"${deployBranch}"
    fi

    echo "Checking out original branch, ${currentBranch}"
    git checkout "${currentBranch}"
    
    # Move original bower_components/ back now that we are back in stable branch
    rm -r bower_components/ || true # Remove the dist/bower_components/
    mv .tmp/bower_components/ ./bower_components || true # Restore developer's bower_components/
    
    echo "Done!"
    echo "";
    exit 0;
else
    echo "Not clean! Please commit all uncommitted changes. Thank you.";
    git status
    echo "";
    exit 1;
fi

