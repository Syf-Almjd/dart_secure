import 'package:dart_secure/dart_secure.dart';
import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   test('adds one to input values', () {
//     final calculator = Calculator();
//     expect(calculator.addOne(2), 3);
//     expect(calculator.addOne(-7), -6);
//     expect(calculator.addOne(0), 1);
//   });
// }

void main() {
  group('Auth', () {
    test('Auth', () {
      return inAppEncrypt(text: "asdasdsad", key: "m.....");
    });
    // test('usermon', () async {
    //   countdownPage(20, "asd");
    //   await Future.delayed(Duration(seconds: 25)); // Adjust the delay as needed
    // });
    test('deauth', () {
      return inAppDecrypt(
          cipherText: "hbV+0c2GGultNzN0KFJ+Cg==", key: "m.....");
    });
  });
}
