# Playonlinux

Docker Image with Playonlinux

## Sound Requirement

1. Install paprefson your host system, e.g. using sudo apt-get install paprefs on an Ubuntu machine.
2. Launch PulseAudio Preferences, go to the "Network Server" tab, and check the "Enable network access to local sound devices" checkbox (https://github.com/jlund/docker-chrome-pulseaudio)
3. Restart your computer. (Only restarting Pulseaudio didn't work for me on Ubuntu 14.10)
4. Set the env PULSE_SERVER=tcp:<docker0 bridge IP>:4713

Reference: http://stackoverflow.com/a/28995539 thanks citize

## Usage:
```
docker run -it --privileged -e DISPLAY=$DISPLAY \
--device /dev/dri/card0:/dev/dri/card0 \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
[-v $HOME/.playonlinux:/home/pol/.PlayOnLinux:rw] \
[-e PULSE_SERVER=tcp:localhost:4713 --net host] \
--name playonlinux ch3lo/playonlinux
```

`-v $HOME/.playonlinux:/home/pol/.PlayOnLinux:rw` is optional if you want to store your Playonlinux profile

`--device /dev/dri/card0:/dev/dri/card0` is for hardware acceleration, you should have the correct drivers.

