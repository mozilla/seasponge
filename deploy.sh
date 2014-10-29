#!/usr/bin/env bash 
set -e

# Variables
title="SeaSponge"
currentCommit=$(git rev-parse --verify HEAD)
currentBranch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
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

    # Checkout Deploy branch
    echo "Checking out branch, ${deployBranch}"
    git checkout "$deployBranch"

    # Clean deploy directory
    echo "Cleaning up deploy branch by removing old build files"
    find . -maxdepth 1 | grep -v "\./README\.md\|\./LICENSE\|\.git\|\./${destDir}\|\.$" | xargs rm -r

    # Move up dist/ to current directory for deploying
    echo "Move the build files in ${destDir}/ up to the current directory for deploying"
    mv ${destDir}/* .[^.]* .
    
    echo "Remove directory ${destDir}/"
    rm -r "${destDir}/"

    echo "Adding changes to Git staging area"
    git add --all

    echo "Committing changes for build from commit ${currentCommit}"
    git commit -m "Deploy build from branch ${currentBranch} for commit ${currentCommit}"

    echo "Pushing changes"
    git push origin "$deployBranch"
    
    echo "Checking out original branch, ${currentBranch}"
    git checkout "${currentBranch}"
    
    echo "Done!"
    echo "";
    exit 0;
else
    echo "Not clean! Please commit all uncommitted changes. Thank you.";
    echo "";
    exit 1;
fi

