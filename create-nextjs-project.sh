#!/bin/bash

# A script to clone the monorepo boilerplate and initialize it as a new project.

# Check that a project name was provided as an argument.
if [ -z "$1" ]; then
  echo "Error: No project name provided."
  echo "Usage: ./create-nextjs-project.sh <your-new-project-name>"
  exit 1
fi

PROJECT_NAME=$1
REPO_URL="https://github.com/tedckh/nextjs-boilerplate.git"
BRANCH="main"

echo "Cloning the monorepo boilerplate into '$PROJECT_NAME'..."
git clone -b $BRANCH --depth 1 $REPO_URL $PROJECT_NAME

cd $PROJECT_NAME

ROOT_PKG_NAME="$PROJECT_NAME-monorepo"
WEB_PKG_NAME="@$PROJECT_NAME/web"

echo "Updating package names to '$ROOT_PKG_NAME' and '$WEB_PKG_NAME'..."

# Update root package.json
node -e "const fs = require('fs'); const pkg = require('./package.json'); pkg.name = '$ROOT_PKG_NAME'; fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));"

# Update web app package.json
node -e "const fs = require('fs'); const pkg = require('./apps/web/package.json'); pkg.name = '$WEB_PKG_NAME'; fs.writeFileSync('./apps/web/package.json', JSON.stringify(pkg, null, 2));"

# Update Dockerfile with new web package name
sed -i '' "s|@tedckh/web|$WEB_PKG_NAME|g" apps/web/Dockerfile

echo "Installing dependencies..."
npm install

echo "Initializing a new git repository..."
rm -rf .git
git init
git add .
git commit -m "Initial commit"


echo ""
echo "Success! Your new project is ready in the '$PROJECT_NAME' directory."
echo ""
echo "Next steps:"
echo "  cd $PROJECT_NAME"
echo "  turbo dev"