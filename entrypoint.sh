# Install builder packages
cd /build-deps
echo
echo '#####  Installing Packages  #####'
find /build-deps -name "*.txz" -exec bash -c 'echo Installing "{}" && installpkg "{}" 2>&1 > /dev/null' \;
echo
echo '#####  Running Scripts  #####'
find /build-deps -name "*.sh" -exec bash -c 'echo Running "{}" && /bin/bash "{}"' \;

# Build package
cd /slackbuild
echo
echo '#####  Running SlackBuild  #####'
find /slackbuild -name "*.SlackBuild" -exec bash -c '/bin/bash "{}"' \; -quit
