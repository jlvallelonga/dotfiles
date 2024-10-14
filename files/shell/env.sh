loadDotEnv () { export $(cat .env | xargs); }

# alphabetize env vars and print
pe () { print_env_vars; }

envs () { printenv | rg -i $1; }
