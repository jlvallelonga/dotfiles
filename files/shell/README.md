files in this directory should only add aliases, functions, or env vars to the shell.

They should not change the directory of the shell session or anything like that. Unless there are collisions with the names of the functions, aliases, or env vars, the files in this directory should not cause any side effects.

so don't run code or print anything in these files. just create functions and aliases and env vars. I think that's all I want to be done here.

This directory is sym linked in the home directory as ~/.shell so you can source anything in this directory with `source ~/.shell/<file>`.
