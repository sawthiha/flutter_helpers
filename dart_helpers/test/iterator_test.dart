import 'package:test/test.dart';

import 'package:dart_generics/dart_generics.dart';

void main()  {
  group('FlexibleIterator Test', () {
    test('hasNext/hasPrevious Test', ()  {
      final list = [1, 2, 3, 4];
      final emptyList = [];

      final forward = FlexibleIterator.base(list);
      final reverse = FlexibleIterator.base(list, isReverse: true);
      final empty = FlexibleIterator.base(emptyList);

      expect(forward.hasNext, true);
      expect(forward.hasPrev, false);
      expect(reverse.hasNext, false);
      expect(reverse.hasPrev, true);
      expect(empty.hasNext, false);
      expect(empty.hasPrev, false);

      while (forward.moveNext())  {}
      while (reverse.movePrevious())  {}

      expect(forward.hasNext, false);
      expect(forward.hasPrev, true);
      expect(reverse.hasNext, true);
      expect(reverse.hasPrev, false);

    });
    test('isLast/isFirst Test', ()  {
      final list = [1, 2, 3, 4];
      final emptyList = [];

      final forward = FlexibleIterator.base(list);
      final reverse = FlexibleIterator.base(list, isReverse: true);
      final empty = FlexibleIterator.base(emptyList);

      expect(forward.isFirst, false);
      expect(forward.isLast, false);
      expect(reverse.isFirst, false);
      expect(reverse.isLast, false);
      expect(empty.isFirst, false);
      expect(empty.isLast, false);

      forward.moveNext();
      expect(forward.isFirst, true);
      expect(forward.isLast, false);
      reverse.movePrevious();
      expect(reverse.isLast, true);
      expect(reverse.isFirst, false);

      for (var i = 0; i < 3; i++) {
        forward.moveNext();
        reverse.movePrevious();
      }
      expect(forward.isLast, true);
      expect(forward.isFirst, false);
      expect(reverse.isFirst, true);
      expect(reverse.isLast, false);
    });
    test('forward', ()  {
      final list = [1, 2, 3, 4];
      var idx = 0;
      final iter = FlexibleIterator.base(list);
      while (iter.moveNext()) {
        expect(iter.current, list[idx]);
        idx++;
      }
    });
    test('backward', ()  {
      final list = [1, 2, 3, 4];
      var idx = list.length - 1;
      final iter = FlexibleIterator.base(list, isReverse: true);
      while (iter.movePrevious()) {
        expect(iter.current, list[idx]);
        idx--;
      }
    });
    test('Roundtrip', ()  {
      final list = [1, 2, 3, 4, 5];
      final iter = FlexibleIterator.base(list);
      var idx = 0;
      while (iter.moveNext()) {
        expect(iter.current, list[idx]);
        idx++;
      }
      idx = idx - 1;
      while (iter.movePrevious()) {
        expect(iter.current, list[idx]);
        idx--;
      }
    });
    test('Middle reverse', ()  {
      final list = [1, 2, 3, 4, 5];
      final iter = FlexibleIterator.base(list);
      for (var i = 0; i < 4; i++) {
        iter.moveNext();
        expect(iter.current, list[i]);
      }
      for (var i = 2; i >= 0; i--) {
        iter.movePrevious();
        expect(iter.current, list[i]);
      }
    });
    test('begin/end/move', ()  {
      final list = [1, 2, 3, 4, 5];
      final iter = FlexibleIterator.base(list);
      iter..end()..movePrevious();
      expect(iter.current, list.last);
      iter..begin()..moveNext();
      expect(iter.current, list.first);
      iter.move(2);
      expect(iter.current, list[2]);
    });
    test('empty iterable', ()  {
      final list = [];
      final iter = FlexibleIterator.base(list);
      expect(iter.hasNext, false);
      expect(iter.hasPrev, false);
      expect(iter.moveNext(), false);
      expect(iter.movePrevious(), false);
    });
    test('step', ()  {
      final list = [1, 2, 3, 4, 5];
      final iter = FlexibleIterator.base(list);
      iter.step();
      expect(iter.current, list[0]);
      iter.step();
      expect(iter.current, list[1]);
      iter.step(isReverse: true);
      expect(iter.current, list[0]);
    });
    test('isBegin/isEnd Test', ()  {
      final list = [1, 2, 3, 4];
      final emptyList = [];

      final forward = FlexibleIterator.base(list);
      final reverse = FlexibleIterator.base(list, isReverse: true);
      final empty = FlexibleIterator.base(emptyList);
      
      expect(forward.isBegin, true);
      expect(forward.isEnd, false);
      expect(reverse.isBegin, false);
      expect(reverse.isEnd, true);
      expect(empty.isBegin, true);
      expect(empty.isEnd, true);

      while (forward.moveNext())  {}
      while (reverse.movePrevious())  {}

      expect(forward.isBegin, false);
      expect(forward.isEnd, true);
      expect(reverse.isEnd, false);
      expect(reverse.isBegin, true);
    });
    test('Index Test', ()  {
      final list = [1, 2, 3, 4, 5, 6, 7];
      final iter = FlexibleIterator.base(list);
      expect(iter.idx, -1);
      var idx = -1;
      while (iter.moveNext()) {
        expect(iter.idx, ++idx);
      }
      iter.begin();
      expect(iter.idx, -1);
      iter.end();
      expect(iter.idx, list.length);
    });
    test('hasSuccessor Test', ()  {
      final list = List.generate(10, (index) => index);
      final iter = FlexibleIterator.base(list);
      expect(iter.hasSuccessor(inReverse: true), false);
      expect(iter.hasSuccessor(), true);
      iter.end();
      expect(iter.hasSuccessor(inReverse: true), true);
      expect(iter.hasSuccessor(), false);
    });
  });
  test('length test', ()  {
    final list = <int> [1, 2, 3, 4, 5];
    final iter = FlexibleIterator.base(list);
    expect(iter.length, 5);
    list.add(6);
    expect(iter.length, 6);
  });
  group('Listener Test',
    ()  {
      test('Validity',
        ()  {
          var idx = -1;
          final list = <int> [1, 2, 3, 4, 5];
          final iter = FlexibleIterator.base(list);
          iter.addListener(
            (i) {
              idx = i;
            }
          );
          iter.moveNext();
          expect(idx, 0);
          iter.moveNext();
          expect(idx, 1);
          iter.movePrevious();
          expect(idx, 0);
        }
      );
    },
  );
}