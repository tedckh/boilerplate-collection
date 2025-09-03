#!/bin/bash

# A script to clone the company-customized Next.js boilerplate.

# Check that a project name was provided as an argument.
if [ -z "$1" ]; then
  echo "Error: No project name provided."
  echo "Usage: ./create-nextjs-project.sh <your-new-project-name>"
  exit 1
fi

PROJECT_NAME=$1
REPO_URL="git@github.com:tedckh/nextjs-boilerplate.git"
BRANCH="company-customizations"

echo "Cloning the '$BRANCH' branch into a new project called '$PROJECT_NAME'..."

git clone -b $BRANCH $REPO_URL $PROJECT_NAME

echo ""
echo "Success! Your new project is ready in the '$PROJECT_NAME' directory."
echo ""
echo "Next steps:"
echo "  cd $PROJECT_NAME"
echo "  # (Recommended) Detach from the boilerplate's history"
echo "  rm -rf .git"
echo "  git init"
