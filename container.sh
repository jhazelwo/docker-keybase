#!/bin/sh
image_name="jhazelwo/keybase:0.2"
contname="keybase"
nodename="--hostname=${contname}"
runname="--name=${contname}"
run_rm="--rm=true"
build_rm="--force-rm=true"
# volumes="-v /home/human:/home/human"
with_tty="--tty"
with_interact="--interactive"
build_context=$(dirname $0)
fuse_opts="--cap-add=SYS_ADMIN --cap-add=MKNOD --security-opt apparmor:unconfined --device=/dev/fuse"

usage() {
    echo ""
    echo "$0 build [clean]"
    echo ""
    echo "$0 run"
    echo ""
}

do_build() {
    echo "build $1"
    docker build $build_rm --tag=${image_name} $build_context
    [ $? -eq 0 -a please_$1 = please_clean ] && {
        for this in `/usr/bin/docker images |grep '<none>'|awk '{print $3}'`; do
            /usr/bin/docker rmi $this
        done
    }
}

do_run() {
    docker run $nodename $runname $run_rm $ports $volumes $with_tty $with_interact $fuse_opts $image_name $@
}

do_kill() {
    docker kill $contname
}

case "$1" in
    build)
        do_build "$2"
        ;;
    run)
        shift
        do_run "$@"
        ;;
    kill)
        do_kill
        ;;
    *)
        usage
        ;;
esac
