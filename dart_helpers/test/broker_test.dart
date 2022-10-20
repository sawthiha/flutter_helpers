import 'dart:async';

import 'package:test/test.dart';

import 'package:dart_generics/dart_generics.dart';

import 'mock.dart';

void main()  {
  group('Subscriber test!',
    ()  {
      test('Valid Test',
        ()  {
          var broker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
          var subscriber = NewsSubscriber(broker);
          expect(subscriber.channels.length, 1);
          expect(subscriber.channels.first, 'news');
          expect(subscriber.dynamicMessageSubscribable, broker);
        }
      );
      test('Uniqueness check',
        ()  {
          var broker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
          var subscriber = NewsSubscriber(broker);
          subscriber.subscribe('news');
          expect(subscriber.channels.length, 1);
          expect(subscriber.channels.first, 'news');
        }
      );
      test('Multiple Subscription Test',
        ()  {
          var broker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
          var subscriber = NewsSubscriber(broker);
          subscriber.subscribe('cnn');
          subscriber.subscribe('quahog');
          subscriber.subscribe('bbc');
          expect(subscriber.channels.length, 4);
          expect(subscriber.channels.first, 'news');
          expect(subscriber.channels.last, 'bbc');
          expect(subscriber.dynamicMessageSubscribable, broker);
        }
      );
    }
  );
  group('unsubscribe() test!',
    ()  {
      test('Valid Test',
        ()  {
          var broker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
          var subscriber = NewsSubscriber(broker);
          subscriber.unsubscribe('news');
          expect(subscriber.channels.length, 0);
          subscriber.subscribe('news');
          subscriber.subscribe('bbc');
          expect(subscriber.channels.length, 2);
          expect(subscriber.channels.last, 'bbc');
          subscriber.unsubscribe('bbc');
          expect(subscriber.channels.length, 1);
          expect(subscriber.channels.first, 'news');
        }
      );
      test('Invalid Test',
        ()  {
          var broker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
          var subscriber = NewsSubscriber(broker);
          subscriber.unsubscribe('new');
          expect(subscriber.channels.length, 1);
          expect(subscriber.channels.first, 'news');
        }
      );
      test('Multiple Unsubscription Test',
        ()  {
          var broker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
          var subscriber = NewsSubscriber(broker);
          subscriber.subscribe('cnn');
          subscriber.subscribe('quahog');
          subscriber.subscribe('bbc');
          subscriber.unsubscribe('cnn');
          subscriber.unsubscribe('quahog');
          expect(subscriber.channels.length, 2);
          expect(subscriber.channels.first, 'news');
          expect(subscriber.channels.last, 'bbc');
        }
      );
    }
  );
  group('publish() Test',
    ()  {
      test('Valid Test',
        () async {
          var newsBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;      
          var subscriber = NewsSubscriber(newsBroker);
          subscriber.subscribe('news');
          var publisher = NewsPublisher(newsBroker);
          var message = 'The negotiations were short';
          await publisher.publish(message);
          expect(subscriber.latestNews, message);
        }
      );
      test('After unsubscribe()',
        () async {
          var newsBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;      
          var subscriber = NewsSubscriber(newsBroker);
          var publisher = NewsPublisher(newsBroker);
          var message = 'The negotiations were short';
          await publisher.publish(message);
          expect(subscriber.latestNews, message);
          subscriber.unsubscribe('news');
        }
      );
      test('Multiple Subscription Test',
        ()  {
          var newsBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
          var subscribers = List<NewsSubscriber>.generate(10, (index) => NewsSubscriber(newsBroker));
          var publisher = NewsPublisher(newsBroker);
          var msg = 'The negotiations were short';
          publisher.publish(msg);
          subscribers.forEach((subscriber) { expect(subscriber.latestNews, msg); });
        }
      );
      test('Polymorphism Test',
        ()  {
          // CustomEventRouter eventRouter = CustomEventRouter();
          // ParentSubscriber parentSubscriber = ParentSubscriber(eventRouter);
          // ChildSubscriber childSubscriber = ChildSubscriber(eventRouter);

        }
      );
    }
  );
  group('SpecificMessageBrokerBase Test', ()  {
    test('Qualified Message', ()  {
      final broker = SpecificMessageBroker.base();
      final msg = 'Hello there';
      final subscriber = SpecificMessageSubscriber.base(
        (message) => message is SpecificMessage,
        (dynamic message) {
          expect(message?.msg, msg);
        }
      );
      broker.subscribe(subscriber);
      broker.publish(SpecificMessage(msg));
    });
    test('Disqualified Message', ()  {
      final broker = SpecificMessageBroker.base();
      final msg = 'Hello there';
      final subscriber = SpecificMessageSubscriber<SpecificMessage>.base(
        (message) => message is SpecificMessage,
        (message) {
          expect(message, msg);
        }
      );
      broker.subscribe(subscriber);
      broker.publish(NotSpecificMessage(msg));
    });
    test('Subscriber ByType Test', ()  {
      final msg = 'Hello There';
      final broker = SpecificMessageBroker.base();
      final subscriber1 = SpecificMessageSubscriber<SpecificMessage>.byType(
        (message)  {
          expect(message.msg, msg);
        }
      );
      broker.subscribe(subscriber1);
      broker.publish(SpecificMessage(msg));
    });
  });
  group('SpecificMessageBroker', ()  {
    final broker = SpecificMessageBroker.base();
    final subscriber = MockSpecificMessageSubscriber(
      specification: (msg) => msg is SpecificMessage,
      subscribable: broker
    );
    
    test('Qualified Message Test', ()  {
      final msg = 'Hello there';
      final msgObj = SpecificMessage(msg);
      broker.publish(msgObj);
      expect(subscriber.msg, msg);
    });
    test('Disqualified Message Test', ()  {
      final msg = "It's a trap";
      final msgObj = NotSpecificMessage(msg);
      broker.publish(msgObj);
      expect(subscriber.msg != msg, true);
    });
    test('After unsubscription test', ()  {
      broker.unsubscribe(subscriber);
      final msg = 'General Kenobi';
      final msgObj = SpecificMessage(msg);
      broker.publish(msgObj);
      expect(subscriber.msg != msg, true);
    });
    test('Multiple Subscription Test', ()  {
      final subscriber1 = MockSpecificMessageSubscriber(
        specification: (msg) => msg is SpecificMessage,
        subscribable: broker
      );
      final subscriber2 = MockSpecificMessageSubscriber(
        specification: (msg) => msg is NotSpecificMessage,
        subscribable: broker
      );
      final msg1 = 'Hello there';
      final msg2 = 'General Kenobi';
      
      broker.publish(SpecificMessage(msg1));
      broker.publish(NotSpecificMessage(msg2));

      expect(subscriber1.msg == msg1, true);
      expect(subscriber2.msg == msg2, true);
    });

    test('Publish Stream Test', () async {
      final broker = SpecificMessageBroker.base();
      final subscriber1 = MockSpecificMessageSubscriber(
        specification: (msg) => msg is SpecificMessage,
        subscribable: broker
      );
      final subscriber2 = MockSpecificMessageSubscriber(
        specification: (msg) => msg is NotSpecificMessage,
        subscribable: broker
      );
      final msg1 = SpecificMessage('Hello there');
      final msg2 = NotSpecificMessage('General Kenobi');

      final controller = StreamController(sync: true);
      broker.add(controller.stream);
      
      controller.add(msg1);
      expect(subscriber1.msg, msg1.msg);
      controller.add(msg2);
      expect(subscriber2.msg, msg2.msg);

      await broker.dispose();
      
    });
  });
}