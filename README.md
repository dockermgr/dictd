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
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/config/dictd":/etc/dictd:z \
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/config/dictd.conf":/etc/dictd.conf:z \
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/data/logs":/var/log/dictd:z \
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/data/usr/dict":/usr/share/dict:z \
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/data/usr/dictd":/usr/share/dictd:z \
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/data/var/dictd":/var/lib/share/dictd:z \
  -v "/usr/local/share/CasjaysDev/dockermgr/dictd/system/data/var/dictionaries-common":/var/lib/share/dictionaries-common:z \
  -p 2628:2628 \
  amaccis/dict dictd -dnodetach --verbose --log /var/log/dictd/dictd.log 
```

## Author  

👤 **Jason Hempstead**  
