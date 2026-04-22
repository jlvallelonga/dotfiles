IDE=code

# open IDE with args
oide () { deprecated "ide" $@; }
ide () { $IDE $@; }

oph () { deprecated "eh"; }
eh () { ide ~; }

# open working directory in IDE
opwd () { deprecated "ewd"; }
ewd () { ide `pwd`; }
