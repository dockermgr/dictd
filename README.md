# Welcome to dockermgr dictd installer 👋

## To install

```shell
dockermgr install dictd
```  

### Manual install

```shell
      --name="dictd" \
      --hostname "dictd" \
      --restart=unless-stopped \
      --privileged \
      -e TZ="${TZ:-${TIMEZONE:-America/New_York}}" \
      -v "/usr/local/share/CasjaysDev/scripts/dfmgr/dictd/system/config/dictd":/etc/dictd:z \
      -v "/usr/local/share/CasjaysDev/scripts/dfmgr/dictd/system/config/dictd.conf":/etc/dictd.conf:z \
      -v "/usr/local/share/CasjaysDev/scripts/dfmgr/dictd/system/data/logs":/var/log/dictd:z \
      -v "/usr/local/share/CasjaysDev/scripts/dfmgr/dictd/system/data/usr/dict":/usr/share/dict:z \
      -v "/usr/local/share/CasjaysDev/scripts/dfmgr/dictd/system/data/usr/dictd":/usr/share/dictd:z \
      -v "/usr/local/share/CasjaysDev/scripts/dfmgr/dictd/system/data/var/dictd":/var/lib/share/dictd:z \
      -v "/usr/local/share/CasjaysDev/scripts/dfmgr/dictd/system/data/var/dictionaries-common":/var/lib/share/dictionaries-common:z \
      -p 2628:2628 \
      amaccis/dict --verbose --log /var/log/dictd/dictd.log &>/dev/null
```

## Author  

👤 **Jason Hempstead**  
