# Welcome to dockermgr dictd installer 👋
  
## A dictionary database server  
  
### Requires scripts to be installed

```shell
 sudo bash -c "$(curl -LSs <https://github.com/dockermgr/installer/raw/main/install.sh>)"
 dockermgr --config && dockermgr install scripts  
```

#### Automatic install/update  

```shell
dockermgr install dictd
```


#### Manual install

```shell
git clone https://github.com/dockermgr/dictd "$HOME/.local/share/CasjaysDev/dockermgr/dictd"
bash -c "$HOME/.local/share/CasjaysDev/dockermgr/dictd/install.sh"
```
  
#### Just run it

```shell
mkdir -p "$HOME/.local/share/srv/docker/dictd/"

git clone <https://github.com/dockermgr/dictd> "$HOME/.local/share/CasjaysDev/dockermgr/dictd"

cp -Rfva "$HOME/.local/share/srv/docker/dictd/dataDir/." "$HOME/.local/share/srv/docker/dictd/"

sudo docker run -d \
--name="dictd" \
--hostname "GEN_SCRIPT_REPLACE_APPNAME" \
--restart=unless-stopped \
--privileged \
-e TZ="${TZ:-${TIMEZONE:-America/New_York}}" \
-p 2628:2628 \
casjaysdev/dictd 1>/dev/null
```

## Author  

👤 **Jason Hempstead**  
