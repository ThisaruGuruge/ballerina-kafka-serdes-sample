import ballerina/io;
import ballerina/kafka;
import ballerina/lang.'array;
import ballerina/lang.'string;
import ballerina/lang.'int;
import thisaru/commons;

public type PersonDeserializer object {
    *kafka:Deserializer;

    public function deserialize(byte[] data) returns any {
        int age = checkpanic 'int:fromString(checkpanic 'string:fromBytes('array:slice(data, 0, 2)));
        string name = checkpanic 'string:fromBytes('array:slice(data, 2));

        commons:Person result = { name: name, age: age };
        return result;
    }

    public function close() {
        io:println("closing");
    }
};