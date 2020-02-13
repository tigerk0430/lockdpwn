#!/bin/sh
XSOCK=/tmp/.X11-unix
XAUTH=/home/${USER}/.Xauthority

xhost +local:docker

	# --runtime=nvidia \
docker run \
	--net=host \
	--name lsdslam \
	--rm \
    -it \
	--env="XAUTHORITY=${XAUTH}" \
	--env="DISPLAY=unix${DISPLAY}" \
	--env="XDG_RUNTIME_DIR=/run/user/1000" \
	--privileged  \
	-v /run/user/1000:/run/user/1000 \
	-v /dev/bus/usb:/dev/bus/usb \
	-v ${XSOCK}:${XSOCK}:rw \
	-v ${XAUTH}:${XAUTH}:rw \
	edward0im/starlaw:lsd-slam \
	/root/run_lsdslam.sh