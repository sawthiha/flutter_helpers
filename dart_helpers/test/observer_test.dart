import 'package:test/test.dart';

import 'mock.dart';

void main()  {
  group('Observer Test',
    ()  {
      group('registerObserver() Test',
        ()  {
          var counter = Counter();
          var pump = NumberPump();
          test('Valid Test',
            ()   {
              pump.registerObserver(counter);
              expect(pump.observers.length, 1);
              expect(pump.observers.first, counter);
            }
          );
          test('Uniqueness Test',
            ()  {
              pump.registerObserver(counter);
              expect(pump.observers.length, 1);
              expect(pump.observers.first, counter);
            }
          );
        }
      );
      group('deregisterObserver() Test', 
        ()  {
          var counter = Counter();
          var pump = NumberPump();
          pump.registerObserver(counter);
          test('Valid Test',
            ()  {
              pump.deregisterObserver(counter);
              expect(pump.observers.length, 0);
              expect(pump.observers.contains(counter), false);
            }
          );
        }
      );
      group('notifyAllObservers() Test',
        ()  {
          var counter = Counter();
          var pump = NumberPump();
          pump.registerObserver(counter);
          test('Valid Test', 
            ()  {
              pump.pump(10);
              expect(counter.count, 10);
              pump.pump(-10);
              expect(counter.count, 0);
            }
          );
          test('After deregister test',
            ()  {
              pump.deregisterObserver(counter);
              pump.pump(10);
              expect(counter.count, 0);
            }
          );
        }
      );
    }
  );
  
}