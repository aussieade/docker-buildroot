## docker-buildroot-x86_64

Use this image to build really small docker images.


To use it clone the buildroot system somewhere on your machine

```
$ git clone git://git.buildroot.net/buildroot
```

Run the container with

```
$ docker run -t -i -v ~/buildroot:/buildroot aussieade/docker-buildroot-x86_64
```

This will drop you into a bash shell ready to build your image.


For an example of how to use this to build something see
[Even Smaller Docker OpenVPN Container](http://web.jellyade.org/posts/evensmallervpn.html)

The included .config is set for x86_64 and presumes there is a /buildroot/docker/post.sh
file to fix up the generated image present containing

```
#!/bin/bash

if [ "$TARGET_DIR" = "" ]; then
echo "POST: TARGET_DIR not set"
exit 1
fi

rm $TARGET_DIR/etc/resolv.conf $TARGET_DIR/sbin/init
touch $TARGET_DIR/etc/resolv.conf $TARGET_DIR/sbin/init
```

Note: if you are using this with virtualbox builds will fail as symlinking is not
allowed on shared volumes (see [this ticket](https://www.virtualbox.org/ticket/10085)).

Allegedly for a vm called default and share called /Users you can fix this with

```
$ VBoxManage getextradata default enumerate | grep Symlinks
Key: VBoxInternal2/SharedFoldersEnableSymlinksCreate/Users, Value: 0

$ VBoxManage setextradata default VBoxInternal2/SharedFoldersEnableSymlinksCreate/Users 1
```

you will need to restart the guest before this takes effect. This didn't seem to work
for me with virtualbox 5.0.4, ymmv.
