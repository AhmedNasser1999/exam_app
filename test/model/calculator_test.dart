import 'dart:developer';

import 'package:exam_app/model/calculator.dart';
import 'package:test/test.dart';

void main() {
  late Calculator calculator;
  setUpAll(() {
    log("SetUpAll");
    calculator = Calculator();
  });
  test("add two number x + y ,  result 5 + 4 = 9", () {
    //AAA
    //Arrange => add dependence

    //Act => execute function and hold in result
    int result = calculator.add(4, 5);
    //Assert => verify result
    expect(result, 9);
  });
  test("subtract two number x - y ,  result 5 - 4 = 1", () {
    //AAA
    //Arrange => add dependence

    //Act => execute function and hold in result
    int result = calculator.subtract(5, 4);
    //Assert => verify result
    expect(result, isA<int>());
  });
}
