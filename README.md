# Welcome to dockermgr dictd installer 👋

## To install

```shell
dockermgr install dictd
```  

### Manual install

```shell
git clone "https://github.com/dockermgr/dictd "/usr/local/share/CasjaysDev/dockermgr/dictd"

docker run -d \
  --name="dictd" \
  --hostname "dictd" \
  --restart=unless-stopped \
  --privileged \
  -e TZ="${TZ:-${TIMEZONE:-America/New_York}}" \
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/config/dictd.conf":/etc/dictd.conf:z \
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/var/dictd/db.list":/var/lib/dictd/db.list:z \
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/data/usr/dictd":/usr/share/dictd:z \
  -p 2628:2628 \
  amaccis/dict
```

## Author  

👤 **Jason Hempstead**  
