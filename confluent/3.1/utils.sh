# create a topic
docker run --net host -it --rm wlezzar/confluent:3.1.1 kafka-topics --create --topic test_topic --partitions 10 --zookeeper zookeeper:2181 --replication-factor 3

# create a schema for a topic
curl -X POST -i -H "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/test_topic-value/versions

# spawn a kafka avro producer
docker run --net host -it --rm wlezzar/confluent:3.0.1 kafka-avro-console-producer --topic test_topic --broker-list localhost:9092 --property value.schema='{"type": "string"}'

# spawn a kafka consumer
docker run --net host -it --rm wlezzar/confluent:3.0.1 kafka-console-consumer --topic test_topic --new-consumer --bootstrap-server localhost:9092

# check consumers with burrow
curl -XGET http://localhost:8000/v2/kafka