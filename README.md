# SlackBuilder

A Docker image for building packages for slackware.  
Using [aclemons/slackware:15.0](https://hub.docker.com/r/aclemons/slackware) as baseimage.  

Uses 3 different pre-defined paths, and things will be execured in listed order.  
`/packages` - any `.txz` here will be installed, then any `.sh` will be executed. Will travel subdirectories.  
`/slackbuild` - executes the first `.SlackBuild` found.  
`/output` - optional directory for outputs.  

Environment-variables can be passed to both `.sh`and `.SlackBuild`.  

#### Example docker run:
```bash
docker run --rm \
  -v /mnt/user/data/slackpkg/pass/packages:/packages \
  -v /mnt/user/data/slackpkg/pass/build:/slackbuild \
  -v /mnt/user/data/slackpkg/pass/output:/output \
  -e OUTPUT=/output \
  -e TMP=/tmp \
  ghcr.io/lanjelin/slackbuilder:latest
```
