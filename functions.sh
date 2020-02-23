

# navigation
nsrc () { cd ~/src/; }
nssh () { cd ~/.ssh/; }
ndown () { cd ~/Downloads; }
ndesk () { cd ~/Desktop; }
nca () { nsrc; cd chalk_api/; }
nsing () { nsrc; cd singularity/; }
nec () { nsing; cd everycampus-api/; }
nnb () { nsing; cd nestjs-boilerplate/; }
ndt () { cd ~/.dotfiles/; }

# git
gdni () { git diff --no-index $@; }

# docker
docker_started () { if ! docker ps; then return 0; else return 1; fi }
dco () { docker-compose $@; }
dcou () { dco up $@; }
dcob () { dco build $@; }
dcod () { dco down $@; }
dcoub () { dcou --build; }
dre () { kbp; dcod; dcoub; }
dcobash () { dco run $1 bash; }
dcor () { dco restart $@; }
dps () { docker ps; }

# other
kmps () { ps aux | grep 'mix phx.server' | grep -v grep | awk '{print "kill -9 " $2}' | bash; }
kism () { ps aux | grep 'iex -S mix' | grep -v grep | awk '{print "kill -9 " $2}' | bash; }
ke () { pkill psql; kmps; kism; }
kbp () { brew services stop postgres; }
sbp () { brew services start postgres; }

# elixir/phoenix
mps () { mix phx.server; }
mpr () { mix phx.routes; }
mprg () { mix phx.routes | grep $1; }
mdg () { mix deps.get; }
mfix () { mdg; mix deps.clean --unused --unlock; }
# an example of how to pass in all following arguments with $@
mt () { mix test $@; }
mtw () { mix test.watch; }
ism () { iex -S mix; }
tmem () { MIX_ENV=test mix ecto.migrate; }
tmer () { MIX_ENV=test mix ecto.rollback; }
tmere () { MIX_ENV=test mix ecto.drop; MIX_ENV=test mix ecto.create; MIX_ENV=test mix ecto.migrate; }
mem () { mix ecto.migrate; tmem; }
mer () { mix ecto.rollback; tmer; }
mere () { ke; mix ecto.reset; tmere; }
mpsg () { mix compile; mix phx.swagger.generate; }
mf () { mix format; }
mc () { mix compile; }

# jekyll
bejs () { bundle exec jekyll serve; }

# singularity
rdb () { npx knex-migrate down --to=0; npx knex migrate:latest; dropdb everycampus_test_1; dropdb everycampus_test_2; dropdb everycampus_test_3; dropdb everycampus_test_4; dropdb everycampus_test_5; dropdb everycampus_test_6; dropdb everycampus_test_7; }
yc () { yarn console; }
ys () { yarn serve; }
dcora () { dco run api $@; }
dbash () { dcora bash; }
dyc () { dcora yarn console; }
dyt () { dco run -e NODE_ENV=test api yarn jest $@; }
dytd () { dco run --service-ports api yarn test:debug:remote $@; }
boomboom () { dcod -v; dcob; }
boomtown () { dcod -v; dcob; dco run api yarn migrations; dcou; }
lf () { yarn eslint --fix "./**/*.js"; }
kpgc () { psql -c "select pg_terminate_backend(pid) from pg_stat_activity where pid <> pg_backend_pid() and datname = '$@'"; }
dbd () { kpgc everycampus_development; dropdb everycampus_development; createdb everycampus_development; psql -c "create role postgres with login createdb"; }
devinit () { docker-compose run api ./bin/dev_init.sh; }
