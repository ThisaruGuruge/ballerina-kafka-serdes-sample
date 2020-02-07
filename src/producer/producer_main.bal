import ballerina/io;
import ballerina/kafka;
import thisaru/commons;

PersonSerializer personSerializer = new;

kafka:ProducerConfig configs = {
    bootstrapServers: "localhost:9092",
    clientId: "basic-producer",
    acks: kafka:ACKS_ALL,
    requestTimeoutInMillis: 1000,
    retryCount: 0,
    valueSerializerType: kafka:SER_CUSTOM,
    valueSerializer: personSerializer
};

public function main() {
    commons:Person person = {
        name: "Thisaru Guruge",
        age: 29
    };

     io:println("Sleeping...");

    io:println("Create Producer");
    kafka:Producer producer = new(configs);
    
    io:println("Sending Data");
    var result = producer->send(person, "add-person");

    if (result is error) {
        io:println(result.toString());
    } else {
        io:println("Sent Successfully");
    }
}
