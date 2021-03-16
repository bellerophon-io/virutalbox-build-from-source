# Virtual Box Build from source

This recipe builds VirtualBox from source, for the Debian GNU/Linux distributions

I started this work on the 16th of March 2021

Primary information source I used : https://www.virtualbox.org/wiki/Linux%20build%20instructions

## How

Using docker containers :

```bash
export WHERE_I_WORK=$(mktemp -d -t vbox-build-from-source_XXXXXX)

git clone git@github.com:bellerophon-io/virutalbox-build-from-source.git "${WHERE_I_WORK}"
cd "${WHERE_I_WORK}"

export FEATURE_ALIAS='dev-compose'
export DESIRED_VERSION="feature/${FEATURE_ALIAS}"
export DESIRED_VERSION="0.0.1"
export DESIRED_VERSION="develop"

git checkout "${DESIRED_VERSION}"

docker-compose build
# docker-compose up -d

```
