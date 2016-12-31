# Keybase in a Docker container
* The container:
    * does have the /keybase filesystem working
    * is configured to be transient, you'll have to login and decom
     your session each time.

## USAGE

1. `git clone https://github.com/jhazelwo/docker-keybase.git`
2. `./container.sh build`
3. `./container.sh run`
4. `run_keybase`
5. `keybase login`
6. _Do whatever keybase work you need_
7. `keybase deprovision`
