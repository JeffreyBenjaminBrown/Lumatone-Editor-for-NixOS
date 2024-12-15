# Usage

Unzip everything from the Lumatone Editor download for Linux here.
This passage from the `.gitignore` file lists what should end up in the root folder:
```
# Things that come in the Lumatone Editor download.
Presets/
INSTALL
LICENSE
Lumatone_Editor
Readme.rtf
install.sh
```

Load all the necessary libraries for Nix by running `nix-shell`. (This will refer to the file `shell.nix`.)

Build the Docker image by running `./docker-build`.

Connect the Lumatone via USB. Figure out how to edit the line from `./docker-run` that mounts it to the Docker container, which currently looks like this:
```
--device=/dev/ttyACM0
```

Run the docker container by executing `./docker-run.sh` (from the command line). A GUI interface should open.

In the Editor, find your `./layouts` folder by navigating to `/home/ubuntu/layouts`.
