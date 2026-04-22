# loadDotEnv () { export $(cat .env | xargs); }
loadDotEnv () { loadEnvFile .env; }


# alphabetize env vars and print
pe () { print_env_vars | less; }
peg () { print_env_vars | rg -i $1; }

envs () { printenv | rg -i $1; }
