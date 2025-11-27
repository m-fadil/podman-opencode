# Project Documentation

This document outlines how to set up and run this project using Podman.

## Prerequisites

- Podman installed on your system.
- The `opencode:latest` image available locally. You might need to build it or pull it from a registry.

## Running the Project

To run the project in an interactive bash session within a Podman container, use the following command:

```bash
podman run --rm -it \
  -v ./:/workspace:z \
  -v ~/Projects/opencode/share:/root/.local/share/opencode:z \
  opencode:latest bash
```

### Command Breakdown:

- `--rm`: Automatically remove the container when it exits.
- `-it`: Run in interactive mode and allocate a pseudo-TTY.
- `-v ./:/workspace:z`: Mount the current directory on your host machine to `/workspace` inside the container. The `:z` option is for SELinux relabeling.
- `-v ~/Projects/opencode/share:/root/.local/share/opencode:z`: Mount your local `~/Projects/opencode/share` directory to `/root/.local/share/opencode` inside the container. This is likely for sharing data or configurations with the `opencode` environment.
- `opencode:latest`: The name and tag of the Podman image to use.
- `bash`: The command to execute inside the container, which starts a bash shell.

Once inside the container, you will be in the `/workspace` directory, which mirrors your project directory on the host. You can then execute your project-specific commands.

## Git Ignore

A `.gitignore` file has been created to exclude the `share` directory from version control, as requested.