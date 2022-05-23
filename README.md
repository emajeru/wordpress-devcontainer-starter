# Dev Containers Wordpress Starter
The goal of this project is to encourage more developers to take advantage of the ability to work within a stable development environment facilitated by Visual Studio Code and Docker.

## Requirements
This starter requires that you have the following application dependencies installed on your machine:
* Docker
* [ms-vscode-remote.remote-containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Getting Started
1. Navigate to the `setup_devcontainer.sh` script within `.devcontainer/scripts/`.
2. Modify the variables to your preference and then run the script to generate the dev container files.
3. Once the files have been created, use the **Remote-Containers > Reopen in Container** option and wait for the devcontainer to complete building.
4. Once the build has completed, select 'Open Workspace'
    * If this option is not immediately available, you will need to first open the `*.code-workspace` file in the `/workspace/ directory.
5. Navigate to the site url (http://localhost by default) to access and configure your new local wordpress site.