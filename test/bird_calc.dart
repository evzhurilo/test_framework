import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_framework/logic.dart';

void main() {
  test('when const bird type then then transaction is constant', () {
    final random = Random();
    final calc = BirdCalc(random);

    final result = calc.getTransaction(const Bird(BirdType.constant));

    expect(result, 1);
  });

  //TODO solve the problem with test : "type 'Null' is  not a subtype of type 'int'
  test('when random bird type then transaction is dependant on random', () {
    final random = MockRandom();
    final calc = BirdCalc(random);

    var counter = 1;
    when(random.nextInt(50)).thenAnswer((_) => 1);

    var result = calc.getTransaction(const Bird(BirdType.random));

    expect(result, 1);

    result = calc.getTransaction(const Bird(BirdType.random));

    expect(result, 2);

    verify(random.nextInt(50)).called(2);
  });
}

class MockRandom extends Mock implements Random {}
