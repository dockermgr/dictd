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
  -e TZ="${TZ:-${TIMEZONE:-America/New_York}}" \
  -p 2628:2628 \
  casjaysdev/dictd
```

## Author  

👤 **Jason Hempstead**  
