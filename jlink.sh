jlink --add-modules fr.univtln.bruno \
    --module-path ${JAVA_HOME}/jmods:target/DemoJlinkDocker-1.0-SNAPSHOT.jar \
    --output target/jlink-image \
    --compress=2 \
    --launcher myapp=fr.univtln.bruno/fr.univtln.bruno.App
