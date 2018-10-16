export SPARK_HOME=/projects/datascience/xyjin/apache_spark

[[ -d $SPARK_CONF_DIR ]] || mkdir -p "$SPARK_CONF_DIR"
# JVM support for Xeon TSX (coarse-grain locking) -XX:+UseRTMLocking
[[ -s $SPARK_CONF_DIR/spark-defaults.conf ]] ||
	cat > "$SPARK_CONF_DIR/spark-defaults.conf" <<'EOF'
spark.task.cpus            1
spark.scheduler.maxRegisteredResourcesWaitingTime            4000s
spark.scheduler.minRegisteredResourcesRatio            1
spark.scheduler.listenerbus.eventqueue.capacity            100000
spark.worker.timeout            24000
spark.executor.heartbeatInterval            4000s
spark.files.fetchTimeout            12000s
spark.network.timeout            24000s
spark.locality.wait            6000s
spark.driver.memory              16g
spark.executor.memory            128g
spark.driver.extraJavaOptions        -XX:+UseParallelGC -XX:ParallelGCThreads=2
spark.executor.extraJavaOptions        -XX:+UseParallelGC -XX:ParallelGCThreads=2
EOF
