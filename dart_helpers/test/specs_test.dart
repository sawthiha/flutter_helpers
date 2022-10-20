import 'package:test/test.dart';

import 'package:dart_generics/dart_generics.dart';

import 'mock.dart';

void main() {
  const valid = Container(20, -5.0);
  const invalid_capacity = Container(15, -5.0);
  const invalid_temp = Container(20, 15.0);
  final food = Food(20, -2.5);
  final containers = List.generate(
    10, 
    (index) => Container(15 + index, 5.0)
  );
  group('Terminal Specification Tests',
    ()  {
      test('Value-Bound', ()  {
        final spec = const TempLowerBoundSpec(15);
        expect(spec.isSatisfiedBy(const Container(20, -5)), false);
        expect(spec.isSatisfiedBy(const Container(20, 16)), true);
      });
      test('NegationSpecification', ()  {
        final spec = TempLowerBoundSpec(10).not();
        expect(spec.isSatisfiedBy(const Container(20, -5)), true);
        expect(spec.isSatisfiedBy(const Container(20, 16)), false);
      });
    }
  );

  group('Composite Specification Tests',
    ()  {
      test('and()', ()  {
        final dogCat = DogCat();
        final dog = Dog();
        final cat = Cat();
        final specs = TypeSpecification<Dog>().and(TypeSpecification<Cat>());
        expect(specs.isSatisfiedBy(dogCat), true);
        expect(specs.isSatisfiedBy(dog), false);
        expect(specs.isSatisfiedBy(cat), false);
      });
      test('or()', ()  {
        final dogCat = DogCat();
        final dog = Dog();
        final cat = Cat();
        final specs = TypeSpecification<Dog>().or(TypeSpecification<Cat>());
        expect(specs.isSatisfiedBy(dogCat), true);
        expect(specs.isSatisfiedBy(dog), true);
        expect(specs.isSatisfiedBy(cat), true);
      });
      test('Food and Container test', ()  {
        expect(food.isContainableBy(valid), true);
        expect(food.isContainableBy(invalid_temp), false);
        expect(food.isContainableBy(invalid_capacity), false);
      });
      test('Iteration Test',()  {
        final containables = containers.where(food.isContainableBy);
        expect(containables.length, 5);
      });
    }
  );
}