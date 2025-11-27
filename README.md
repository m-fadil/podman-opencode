# Project Documentation

This document outlines how to set up and run this project using Podman.

## Prerequisites

- Podman installed on your system.
- The `opencode:latest` image available locally. You might need to build it or pull it from a registry.

## Running the Project

Follow these steps to set up and run the project:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/m-fadil/podman-opencode.git
    cd podman-opencode
    ```

2.  **Build the Podman image:**
    ```bash
    podman build -t opencode:latest .
    ```

3.  **Run the Podman container:**
    ```bash
    podman run --name opencode-container --rm -it \
      -v ./:/workspace:z \
      -v ~/Projects/opencode/share:/root/.local/share/opencode:z \
      opencode:latest opencode
    ```

### Command Breakdown:

- `--name opencode-container`: Assigns the name `opencode-container` to the running container for easier management.
- `--rm`: Automatically remove the container when it exits.
- `-it`: Run in interactive mode and allocate a pseudo-TTY.
- `-v ./:/workspace:z`: Mount the current directory on your host machine to `/workspace` inside the container. The `:z` option is for SELinux relabeling.
- `-v ~/Projects/opencode/share:/root/.local/share/opencode:z`: Mount your local `~/Projects/opencode/share` directory to `/root/.local/share/opencode` inside the container. This is likely for sharing data or configurations with the `opencode` environment.
- `opencode:latest`: The name and tag of the Podman image to use.
- `opencode`: The command to execute inside the container, which starts the opencode application.

## Git Ignore

A `.gitignore` file has been created to exclude the `share` directory from version control, as requested.