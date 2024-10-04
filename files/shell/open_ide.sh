# open IDE with args
oide () { code $@; }
oph () { oide ~; }
# open working directory in IDE
opwd () { oide `pwd`; }
