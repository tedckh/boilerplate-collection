# boilerplate-collection

This repository serves as a collection of various project boilerplates, designed to kickstart development with different technologies. Each boilerplate is maintained as a Git submodule, allowing for independent development and easy integration into new projects.

## Quick Start: Create a New Project

To create a new project from the customized Next.js boilerplate, run this command in your terminal:

```bash
bash <(curl -sSL https://gist.github.com/tedckh/3deb662527fd5ab8eb22383642342a23/raw) my-new-app
```

Replace `my-new-app` with your desired project name. This script will clone the customized boilerplate for you.

## Available Boilerplates

*   **Next.js Boilerplate**: A Next.js project set up with TypeScript, ESLint, the App Router, and a `src/` directory (without Tailwind CSS).
    *   **Repository**: `git@github.com:tedckh/nextjs-boilerplate.git`

*   **React Native Boilerplate**: A React Native project initialized with default settings.
    *   **Repository**: `git@github.com:tedckh/react-native-boilerplate.git`

## How to Use

### Cloning the Entire Collection (with Submodules)

To clone this repository and all its boilerplates (submodules), use the `--recurse-submodules` flag:

```bash
git clone --recurse-submodules git@github.com:tedckh/boilerplate-collection.git
```

If you've already cloned the repository without the submodules, you can initialize and update them with:

```bash
git submodule update --init --recursive
```

### Cloning an Individual Boilerplate

Each boilerplate is its own independent Git repository. If you only need a specific boilerplate, you can clone it directly:

```bash
# Example for Next.js Boilerplate
git clone git@github.com:tedckh/nextjs-boilerplate.git my-new-nextjs-project
```

You can then rename the `my-new-nextjs-project` directory and start your new project.

### Contributing to a Boilerplate

If you want to make changes to a boilerplate and contribute them back:

1.  Clone the main `boilerplate-collection` repository (with submodules).
2.  Navigate into the specific boilerplate's directory: `cd nextjs-boilerplate`
3.  Make your changes and commit them within the submodule:
    ```bash
    git add .
    git commit -m "feat: descriptive message"
    git push origin main # Or your branch name
    ```
4.  Navigate back to the main `boilerplate-collection` directory: `cd ..`
5.  Update the submodule reference in the main repository and commit:
    ```bash
    git add nextjs-boilerplate # Or the name of the submodule
    git commit -m "Update nextjs-boilerplate submodule to latest"
    git push
    ```
