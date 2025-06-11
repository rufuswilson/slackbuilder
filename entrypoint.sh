#!/bin/bash

# Install builder packages
cd /build-deps
echo
echo '#####  Installing Packages  #####'
find /build-deps \( -name "*.txz" -o -name "*.tgz" -o -name "*.tlz" -o -name "*.tbz" \) -exec bash -c '
  echo | tee -a /logs/install.log
  echo Installing "{}" | tee -a /logs/install.log
  installpkg "{}" 2>&1 | tee -a /logs/install.log
' \;

# Run scripts
echo
echo '#####  Running Scripts  #####'
find /build-deps -name "*.sh" -exec bash -c '
  echo | tee -a /logs/scripts.log
  echo Running "{}" | tee -a /logs/scripts.log
  /bin/bash "{}" 2>&1 | tee -a /logs/scripts.log
' \;

# Run SlackBuild
cd /slackbuild
echo
echo '#####  Running SlackBuild  #####'
find /slackbuild -name "*.SlackBuild" -exec bash -c '
  echo Running "{}" | tee -a /logs/build.log
  /bin/bash "{}" 2>&1 | tee -a /logs/build.log
' \; -quit
