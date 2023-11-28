# Vite Sandbox Builder

### Description

This tool creates a React sandbox using Vite and Bash. In addition to React, it will install and set up the following dependencies:

- Typescript
- TailwindCSS
- React Router DOM
- Firebase

In addition, it will create a Git repo and create an initial commit. If you don't want this tool to perform these Git operations, see the [instructions on how to disable Git operations](#disabling-git-operations).

### Requirements

This tool requires **NPM** and is written for use on a **Mac**.

### Setup

Open a console and navigate to the folder containing `sb-builder.sh`. Add execution permissions by running `chmod +x sb-builder.sh`.

##### Disabling Git Operations

Running this tool will create a Git repo and create an initial commit. If you don't want this behavior, comment out Lines 68-71 in `sb-builder.sh`. This will disable the Git operations.

### Usage

Ater completing setup, navigate to the folder containing `sb-builder.sh` (if you aren't there already). Then run:

`./sb-builder.sh [Your in-code project name] [Your public project name]`

Afterward, you need to set up Firebase if you want to use Firebase with your project. To do this, first initialize your Firebase project and any services you may need using the Firebase console. Then navigate to your project root and run `firebase init`.
