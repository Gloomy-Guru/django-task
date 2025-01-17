# dockerizing django app

```sh
#first make the volume
docker volume create db

#build
docker build -t [image name] .

#run
docker run -p 80:8000 -v db:/app -d [image name]
```
