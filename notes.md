# Notes on docker

## The running containers can be checked by:

display only running containers

``` 
    docker ps 
```

or if you want all containers displayed
``` 
    docker ps -a 
```

## Cleanup
- Stop all containers
```
docker stop $(docker ps -a -q)
```

- Remove all containers
```
docker rm $(docker ps -a -q)

```
- Remove orphaned volumes
```
docker volume ls -qf dangling=true | xargs -r docker volume rm
```

