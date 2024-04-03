import 'dart:io';

void main() {
  // Prompting the user to input name, age, and school
  print('Please enter your name:');
  String name = stdin.readLineSync()!;
  
  print('Please enter your age:');
  String age = stdin.readLineSync()!;
  
  print('Please enter your school:');
  String school = stdin.readLineSync()!;
  
  // Display the information in one logical sentence
  print('Hello $name, you are $age years old, and you attend $school.');
}
