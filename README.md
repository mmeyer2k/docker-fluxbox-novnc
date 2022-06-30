# 🖥️ docker-fluxbox-novnc
A minimalist docker image that provides a linux desktop environment in the browser.
Uses novnc, fluxbox, and supervisor (to keep everything running).

![](https://img.shields.io/docker/pulls/mmeyer2k/docker-fluxbox-novnc.svg?cacheSeconds=3600)

## Run it
```bash
docker run --rm -ti -p 6900:6900 mmeyer2k/docker-fluxbox-novnc
```

## View it
Access the container on port `5900` with a VNC viewer.

## Configure it
Currently, only the `VNC_RESOLUTION` environment variable is supported.
```bash
docker run --rm -ti -e VNC_RESOLUTION=1024x768 -p 6900:6900 mmeyer2k/docker-fluxbox-novnc
```

## Extend it
Add/remove supervisor configurations to control how applications start and persist.
Config files are stored in `/etc/supervisor/conf.d`.

An example supervisor config to keep firefox running:
```ini
[program:xterm]
command=xterm
autorestart=true
```

By default, xterm stays on the desktop. To stop this behavior in your image/container, delete `/etc/supervisor/conf.d/xterm.conf`
