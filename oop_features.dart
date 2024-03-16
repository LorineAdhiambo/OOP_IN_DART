import 'dart:io';

// Interface definition
abstract class Drivable {
  void start();
  void stop();
}

// Base class
class Car implements Drivable {
  String brand;
  String model;
  double speed = 0;

  Car(this.brand, this.model);

  @override
  void start() {
    print('$brand $model is starting.');
  }

  @override
  void stop() {
    print('$brand $model is stopping.');
  }

  void accelerate() {
    speed += 10;
    print('$brand $model is accelerating. Current speed: $speed km/h');
  }

  void brake() {
    speed -= 10;
    if (speed < 0) speed = 0;
    print('$brand $model is braking. Current speed: $speed km/h');
  }
}

// Derived class
class ElectricCar extends Car {
  ElectricCar(String brand, String model) : super(brand, model);

  @override
  void start() {
    super.start();
    print('(Electric)');
  }

  @override
  void stop() {
    super.stop();
    print('(Electric)');
  }

  @override
  void accelerate() {
    speed += 20; // Electric cars accelerate faster
    print('$brand $model (Electric) is accelerating. Current speed: $speed km/h');
  }
}

// Method to read data from a file and initialize Car instances
List<Car> readCarsFromFile(String filePath) {
  List<Car> cars = [];
  var file = File(filePath);
  List<String> lines = file.readAsLinesSync();
  for (var line in lines) {
    var parts = line.split(',');
    if (parts.length >= 2) {
      var brand = parts[0];
      var model = parts[1];
      var car = Car(brand, model);
      cars.add(car);
    }
  }
  return cars;
}

void main() {
  // Creating instances of Car initialized with data from a file
  var cars = readCarsFromFile('cars.txt');

  // Demonstrating the use of a loop
  for (var car in cars) {
    car.start();
    car.accelerate();
    car.brake();
    car.stop();
  }

  // Creating an instance of ElectricCar
  var electricCar = ElectricCar('Tesla', 'Model S');
  electricCar.start();
  electricCar.accelerate();
  electricCar.stop();
}

