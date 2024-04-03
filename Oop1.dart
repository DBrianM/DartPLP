import 'dart:io';

// Interface for reading data from a file
abstract class FileReader {
  void readFromFile(String filePath);
}

// Base class
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('Generic animal sound');
  }
}

// Dog class that extends Animal and implements FileReader
class Dog extends Animal implements FileReader {
  String breed;
  
  Dog(String name, this.breed) : super(name);
  
  @override
  void makeSound() {
    print('Woof!');
  }
  
  @override
  void readFromFile(String filePath) {
    File file = File(filePath);
    List<String> lines = file.readAsLinesSync();
    if (lines.isNotEmpty && lines.length >= 2) {
      this.name = lines[0];
      this.breed = lines[1];
    } else {
      print('Error: Invalid file format.');
    }
  }
  
  void printDogInfo() {
    print('Name: $name, Breed: $breed');
  }
}

void main() {
  Dog myDog = Dog('Buddy', 'Labrador');
  myDog.makeSound(); // Woof!

  // Initialize dog from a file
  myDog.readFromFile(r'C:\Users\User\Desktop\DART\dog_data.txt');
  myDog.printDogInfo(); // Prints name and breed read from file

  // Demonstrate loop
  for (int i = 0; i < 3; i++) {
    print('Loop iteration: $i');
  }
}
