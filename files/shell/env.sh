# loadDotEnv () { export $(cat .env | xargs); }
loadDotEnv () { loadEnvFile .env; }


# alphabetize env vars and print
pe () { print_env_vars | less; }

envs () { printenv | rg -i $1; }
