import ballerina/io;

public function main() {
  string name = "Thisaru";
  string age = "29";

  byte[] nameBytes = name.toBytes();
  byte[] ageBytes = age.toBytes();

  int ageLength = ageBytes.length();
  int nameLength = nameBytes.length();

  io:println(ageLength.toString());
  io:println(nameLength.toString());

  ageBytes.push(...nameBytes);
  io:println(ageBytes.length().toString());
}
