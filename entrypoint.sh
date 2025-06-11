#!/bin/bash

# Handle loging
log_output() {
  local logfile="$1"
  if [[ -n "$LOGONLY" ]]; then
    cat >> "/logs/$logfile"
  else
    tee -a "/logs/$logfile"
  fi
}

# Install builder packages
cd /build-deps
echo | log_output install.log
echo '#####  Installing Packages  #####' | log_output install.log

find /build-deps -type f \( -name "*.txz" -o -name "*.tgz" -o -name "*.tlz" -o -name "*.tbz" \) | while read -r pkg; do
  echo | log_output install.log
  echo Installing "$pkg" | log_output install.log
  installpkg "$pkg" 2>&1 | log_output install.log
done

# Run scripts
echo | log_output scripts.log
echo '#####  Running Scripts  #####' | log_output scripts.log
find /build-deps -type f -name "*.sh" | while read -r script; do
  echo | log_output scripts.log
  echo Running "$script" | log_output scripts.log
  /bin/bash "$script" 2>&1 | log_output scripts.log
done

# Run SlackBuild
cd /slackbuild
echo | log_output build.log
echo '#####  Running SlackBuild  #####' | log_output build.log
find /slackbuild -type f -name "*.SlackBuild" | while read -r sb; do
  echo | log_output build.log
  echo Running "$sb" | log_output build.log
  /bin/bash "$sb" 2>&1 | log_output build.log
  break
done
