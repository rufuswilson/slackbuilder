# Install builder packages
cd /build-deps
echo
echo '#####  Installing Packages  #####'
find /build-deps \( -name "*.txz" -o -name "*.tbz" -o -name "*.tlz" -o -name "*.tgz" \) -exec bash -c 'echo Installing "{}" && installpkg "{}" 2>&1 > /logs/install.log' \;
echo
echo '#####  Running Scripts  #####'
find /build-deps -name "*.sh" -exec bash -c 'echo Running "{}" && /bin/bash "{}" 2>&1 > /logs/scripts.log' \;

# Build package
cd /slackbuild
echo
echo '#####  Running SlackBuild  #####'
find /slackbuild -name "*.SlackBuild" -exec bash -c '/bin/bash "{}" 2>&1 > /logs/build.log' \; -quit
