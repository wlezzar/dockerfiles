# Dockerized JMXTrans
Inspired from [fvigotti/docker-jmxtrans](https://github.com/fvigotti/docker-jmxtrans.).

# Configuration
You may use these environment variables to customise the jmxtrans run :
- JMX trans configuration :
    - FILENAME `default empty` , if configured run this file configuration instead of JSON_DIR files
    - JSON_DIR `default /var/lib/jmxtrans`
    - SECONDS_BETWEEN_RUNS `default 60`
    - LOG_LEVEL `default info`
    - CONTINUE_ON_ERROR `default false`
- JVM options :
    - JAVA_OPTS `default -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true`
    - HEAP_SIZE `default 512`
    - PERM_SIZE `default 384`
    - MAX_PERM_SIZE `default 384`
    - JMX_PORT `default 9999`