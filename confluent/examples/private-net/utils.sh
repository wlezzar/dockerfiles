KAFKA_CMD="docker run -it --net privatenet_default --rm wlezzar/confluent:3.0.0"
# Create topic
$KAFKA_CMD kafka-topics --create --topic test_topic --replication 2 --partitions 5 --zookeeper zookeeper:2181
$KAFKA_CMD kafka-console-producer --topic test_topic --broker-list kafka:9092
$KAFKA_CMD kafka-console-consumer --new-consumer --topic test_topic --bootstrap-server kafka:9092 --from-beginning
