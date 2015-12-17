# workspace-setup

## findLocalMavenRepo
I use this script to find a local maven repo depending on the workspace I'm working in. 
I use it by copy & paste it to /usr/local/bin and customize the last lines of the mvn execution script (e.g /opt/apache-maven-3.3.3/bin/mvn):

Before:

     # Provide a "standardized" way to retrieve the CLI args that will 
     # work with both Windows and non-Windows executions.
     MAVEN_CMD_LINE_ARGS="$MAVEN_CONFIG $@"
     export MAVEN_CMD_LINE_ARGS
     
     exec "$JAVACMD" \
     $MAVEN_OPTS \
     -classpath "${M2_HOME}"/boot/plexus-classworlds-*.jar \
     "-Dclassworlds.conf=${M2_HOME}/bin/m2.conf" \
     "-Dmaven.home=${M2_HOME}" "-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \
     ${CLASSWORLDS_LAUNCHER} "$@"

After:

     # Provide a "standardized" way to retrieve the CLI args that will 
     # work with both Windows and non-Windows executions.
     MAVEN_CMD_LINE_ARGS="$MAVEN_CONFIG $@"
     export MAVEN_CMD_LINE_ARGS
     
     localMavenRepo=$(findRepository.sh)
     echo "Customization: Use $localMavenRepo"
     exec "$JAVACMD" \
     $MAVEN_OPTS \
     -classpath "${M2_HOME}"/boot/plexus-classworlds-*.jar \
     "-Dclassworlds.conf=${M2_HOME}/bin/m2.conf" \
     "-Dmaven.repo.local=$localMavenRepo" \
     "-Dmaven.home=${M2_HOME}" "-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \
     ${CLASSWORLDS_LAUNCHER} "$@"



