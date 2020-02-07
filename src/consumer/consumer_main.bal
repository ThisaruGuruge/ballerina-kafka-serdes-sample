import ballerina/kafka;
import thisaru/commons;
import ballerina/io;

PersonDeserializer personDeserializer = new;

kafka:ConsumerConfig configs = {
    bootstrapServers: "localhost:9092",
    groupId: "test-group",
    clientId: "person-consumer",
    offsetReset: "earliest",
    autoCommit: true,
    topics: ["add-person"],
    valueDeserializerType: kafka:DES_CUSTOM,
    valueDeserializer: personDeserializer
};

listener kafka:Consumer consumer = new(configs);

service KafkaService on consumer {
    resource function onMessage(kafka:Consumer consumer, kafka:ConsumerRecord[] records) {
        io:println("Records received");
        foreach var kafkaRecord in records {
            var value = kafkaRecord.value;
            if (value is commons:Person) {
                io:println("Name: " + value.name);
                io:println("Age: " + value.age.toString());
            } else {
                io:println("Invalid record type");
            }
        }
    }
}

