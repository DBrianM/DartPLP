import 'dart:io';

// Interface for shape
abstract class Shape {
  double calculateArea();
}

// Base class for shapes
class BaseShape implements Shape {
  @override
  double calculateArea() {
    return 0.0;
  }
}

// Rectangle class implementing Shape interface
class Rectangle extends BaseShape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }

  // Overriding toString() method
  @override
  String toString() {
    return 'Rectangle - Width: $width, Height: $height, Area: ${calculateArea()}';
  }
}

// Circle class implementing Shape interface
class Circle extends BaseShape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }

  // Overriding toString() method
  @override
  String toString() {
    return 'Circle - Radius: $radius, Area: ${calculateArea()}';
  }
}

// Class to read data from file and create shapes
class ShapeInitializer {
  List<BaseShape> initializeShapes(String filename) {
    List<BaseShape> shapes = [];

    try {
      File file = File(filename);
      List<String> lines = file.readAsLinesSync();

      for (var line in lines) {
        var parts = line.split(',');
        if (parts.length == 3 && parts[0] == 'rectangle') {
          double width = double.parse(parts[1]);
          double height = double.parse(parts[2]);
          shapes.add(Rectangle(width, height));
        } else if (parts.length == 2 && parts[0] == 'circle') {
          double radius = double.parse(parts[1]);
          shapes.add(Circle(radius));
        }
      }
    } catch (e) {
      print("Error reading file: $e");
    }

    return shapes;
  }
}

void main() {
  // Initializing shapes from file
  ShapeInitializer initializer = ShapeInitializer();
  List<BaseShape> shapes = initializer.initializeShapes('shapes.txt');

  // Printing initialized shapes
  print('Initialized Shapes:');
  for (var shape in shapes) {
    print(shape);
  }

  // Demonstration of loop
  print('\nDemonstration of Loop:');
  for (int i = 1; i <= 5; i++) {
    print('Square of $i is ${i * i}');
  }
}
