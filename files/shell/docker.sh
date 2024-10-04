# docker
alias dco='docker compose'

# docker
docker_started () {
    if docker ps > /dev/null 2>&1; then
        # docker is running
        return 0;
    else
        # docker is NOT running
        return 1;
    fi
}
# start_docker () {
#     if ! docker_started; then
#         echo "Docker not started. Starting now.";
#         open -a Docker;
#         # open -a Orbstack;
#     fi
#     max_retry=30
#     retry=0
#     while [ ${retry} -lt ${max_retry} ]; do
#         if docker_started; then
#             break
#         else
#             echo "docker not yet started";
#             (( retry = retry + 1 ))
#             sleep 1;
#         fi
#     done
# }
# dcomp () { start_docker; dco $@; }
dcomp () { dco $@; }
dcou () { dcomp up $@; }
dcob () { dcomp build $@; }
dcod () { dcomp down $@; }
dcodd () { dcod --volumes --rmi all --remove-orphans; }
dcoub () { dcou --build; }
dcor () { dcomp restart $@; }
# dlimages () { docker image ls --all --format json | jtbl -f; }
dlimages () { docker image ls --all --format table; }
# dlcontainers () { docker container ls --all --format json | jtbl -f; }
dlcontainers () { docker container ls --all --format table; }
# dlvolumes () { docker volume ls --format json | jtbl -f; }
dlvolumes () { docker volume ls --format table; }
# dlnetworks () { docker network ls --format json | jtbl -f; }
dlnetworks () { docker network ls --format table; }
dls () {
  echo "--- images ---"
  dlimages;
  echo "\n"

  echo "--- containers ---"
  dlcontainers;
  echo "\n"

  echo "--- volumes ---"
  dlvolumes;
  echo "\n"

  echo "--- networks ---"
  dlnetworks;
  echo "\n"
}
# dps () { start_docker; docker ps; }
# dps () { docker ps; }
# dbash () { start_docker; docker exec -it $1 bash; }
dcorun () { docker compose run $@; }
dcobash () { dcorun $@ /bin/bash; }
dbash () { docker exec -it $1 bash; }
dreset () {
    echo "--- docker compose down --volumes ---"
    docker compose down -v;
    echo "--- pruning containers ---"
    docker container prune -f;
    echo "--- pruning images ---"
    docker image prune -a -f;
    echo "--- pruning volumes ---"
    docker volume prune -f;
    echo "--- pruning networks ---"
    docker network prune -f;
    echo "--- docker system prune -a --volumes -f ---"
    docker system prune -a --volumes -f;
    echo "--- images ---"
    docker image ls -a;
    echo "--- containers ---"
    docker container ls -a;
    echo "--- volumes ---"
    docker volume ls;
    echo "--- networks ---"
    docker network ls;
}
