import 'dart:math';

enum BirdType { constant, random }

class Bird {
  final BirdType type;

  const Bird(this.type);
}

class BirdCalc {
  final Random random;

  const BirdCalc(this.random);

  int getTransaction(Bird bird) {
    switch (bird.type) {
      case BirdType.constant:
        return 1;
      case BirdType.random:
        return random.nextInt(50) + 1;
    }
  }
}
