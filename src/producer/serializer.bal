import ballerina/io;
import ballerina/kafka;
import thisaru/commons;

public type PersonSerializer object {
    *kafka:Serializer;

    public function serialize(any data) returns byte[] {
        commons:Person person = <commons:Person> data;
        byte[] result = person.age.toString().toBytes();
        byte[] nameBytes = person.name.toBytes();
        result.push(...nameBytes);

        return result;
    }

    public function close() {
        io:println("closing");
    }
};