xhost +local:docker
docker run -it --rm                         \
   -e DISPLAY=$DISPLAY                      \
   -v "$(pwd)/layouts":/home/ubuntu/layouts \
   -v /tmp/.X11-unix:/tmp/.X11-unix:ro      \
   --device=/dev/snd                        \
   --device=/dev/ttyACM0                    \
   lumatone-editor:latest
