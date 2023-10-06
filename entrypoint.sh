# Install builder packages
cd /packages
echo
echo '#####  Installing Packages  #####'
find /packages -name "*.txz" -exec bash -c 'echo Installing "{}" && installpkg "{}" 2>&1 > /dev/null' \;
echo
echo '#####  Running Scripts  #####'
find /packages -name "*.sh" -exec bash -c 'echo Running "{}" && /bin/bash "{}"' \;

# Build package
cd /slackbuild
echo
echo '#####  Running SlackBuild  #####'
find /slackbuild -name "*.SlackBuild" -exec bash -c '/bin/bash "{}"' \; -quit
