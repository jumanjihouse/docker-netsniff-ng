netsniff-ng
===========

[![](https://badge.imagelayers.io/jumanjiman/netsniff-ng.svg)](https://imagelayers.io/?images=jumanjiman/netsniff-ng:latest 'View image size and layers')&nbsp;
[![Circle CI](https://circleci.com/gh/jumanjihouse/docker-netsniff-ng.png?circle-token=0a4981e526ec3e7a4afa10ab2dddc25ca5a04038)](https://circleci.com/gh/jumanjihouse/docker-netsniff-ng/tree/master 'View CI builds')

Project: [https://github.com/jumanjihouse/docker-netsniff-ng]
(https://github.com/jumanjihouse/docker-netsniff-ng)

Image: [https://registry.hub.docker.com/u/jumanjiman/netsniff-ng/]
(https://registry.hub.docker.com/u/jumanjiman/netsniff-ng/)


About
-----

This git repo puts [netsniff-ng](https://github.com/netsniff-ng/netsniff-ng)
in a tiny Docker container with Alpine Linux userspace.


How-to
------

### Build

    docker build --rm -t jumanjiman/netsniff-ng .


### Run

Add the following to `~/.bashrc`:

    netsniff-ng() {
      docker run --rm -it \
      --privileged \
      --net host \
      -v /tmp:/tmp \
      jumanjiman/netsniff-ng $*
    }

Confirm your settings:

    user@devenv:~$ source ~/.bashrc
    user@devenv:~$ type netsniff-ng
    netsniff-ng is a function
    netsniff-ng ()
    {
        docker run --rm -it --privileged --net host -v /tmp:/tmp jumanjiman/netsniff-ng $*
    }

Run netsniff-ng with options, such as:

    user@devenv:~$ netsniff-ng --in eth0 --out dump.pcap -s -T 0xa1b2c3d4 --b 0 tcp or udp
    Running! Hang up with ^C!

               9  packets incoming (2 unread on exit)
              11  packets passed filter
               0  packets failed filter (out of space)
          0.0000% packet droprate
              13  sec, 104553 usec in total


### Tag

It is useful to provide an informative tag similar to
`0.5.8-r0-20150627T1306-git-56f20fd`.
The tag indicates:

* version-release of netsniff-ng package in the image
* date/time when the image is built
* git hash of this repo at the time of build

Run these commands to tag the image:

    version=$(awk '/^ENV VERSION/ {print $NF}' Dockerfile)
    now=$(date +%Y%m%dT%H%M)
    hash=$(git rev-parse HEAD | cut -b1-7)
    tag="${version}-${now}-git-${hash}"
    docker tag jumanjiman/netsniff-ng jumanjiman/netsniff-ng:${tag}
