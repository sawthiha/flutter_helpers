import 'package:test/test.dart';

import 'package:dart_generics/dart_generics.dart';

import 'mock.dart';

void main()   {
  group('Channel Test',
    ()  {
      final dynamicMessageBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
      final subscribers = List.generate(10, (index) => NewsSubscriber(dynamicMessageBroker));
      group('subscribe() Test',
        ()  {
          test('Valid Test',
            ()  {
              final dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              final dynamicMessageBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
              final subscriber = NewsSubscriber(dynamicMessageBroker);
              dynamicMessageChannel.subscribe(subscriber);
              expect(dynamicMessageChannel.subscribers.length, 1);
              expect(dynamicMessageChannel.subscribers.contains(subscriber), true);
            }
          );
          test('Multiple Subscribers Test',
            ()  {
              final dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              
              for (var subscriber in subscribers) {
                dynamicMessageChannel.subscribe(subscriber);
              }
              
              expect(dynamicMessageChannel.subscribers.length, subscribers.length);
              for (var subscriber in subscribers) {
                expect(dynamicMessageChannel.subscribers.contains(subscriber), true);
              }
            }
          );

          test('Uniqueness Test',
            ()  {
              var dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              var dynamicMessageBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
              var subscriber = NewsSubscriber(dynamicMessageBroker);
              dynamicMessageChannel.subscribe(subscriber);
              dynamicMessageChannel.subscribe(subscriber);
              expect(dynamicMessageChannel.subscribers.length, 1);
              expect(dynamicMessageChannel.subscribers.contains(subscriber), true);
            }
          );
        }
      );
      group('unsubscribe() Test',
        ()  {
          test('Valid Test',
            ()  {
              var dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              var dynamicMessageBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
              var subscriber = NewsSubscriber(dynamicMessageBroker);
              dynamicMessageChannel.subscribe(subscriber);
              dynamicMessageChannel.unsubscribe(subscriber);
              expect(dynamicMessageChannel.subscribers.length, 0);
              expect(dynamicMessageChannel.subscribers.contains(subscriber), false);
            }
          );
          test('Invalid Test',
            ()  {
              var dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              var dynamicMessageBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
              var subscriber = NewsSubscriber(dynamicMessageBroker);
              dynamicMessageChannel.subscribe(subscriber);
              dynamicMessageChannel.unsubscribe(NewsSubscriber(dynamicMessageBroker));
              expect(dynamicMessageChannel.subscribers.length, 1);
              expect(dynamicMessageChannel.subscribers.contains(subscriber), true);
            }
          );
          test('Empty Test',
            ()  {
              var dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              var dynamicMessageBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
              var subscriber = NewsSubscriber(dynamicMessageBroker);
              dynamicMessageChannel.unsubscribe(subscriber);
              expect(dynamicMessageChannel.subscribers.length, 0);
              expect(dynamicMessageChannel.subscribers.contains(subscriber), false);
            }
          );
          test('Multipe Test',
            ()  {
              var dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              
              for (var subscriber in subscribers) {
                dynamicMessageChannel.subscribe(subscriber);
              }

              dynamicMessageChannel.unsubscribe(subscribers[5]);
              expect(dynamicMessageChannel.subscribers.contains(subscribers[5]), false);

              for (var subscriber in subscribers) {
                dynamicMessageChannel.unsubscribe(subscriber);
              }
              expect(dynamicMessageChannel.subscribers.length, 0);
              for (var subscriber in subscribers) {
                expect(dynamicMessageChannel.subscribers.contains(subscriber), false);
              }
            }
          );
        }
      );
      group('notifyAllSubscribers() Test',
        ()  {
          test('Valid Test',
            ()  {
              var dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              var dynamicMessageBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
              var subscriber = NewsSubscriber(dynamicMessageBroker);
              var str = 'Hello there';
              dynamicMessageChannel.subscribe(subscriber);
              dynamicMessageChannel.notifyAllSubscribers(str);
              expect(subscriber.latestNews, str);
            }
          );
          test('Multiple Test',
            ()  {
              var dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              var str = 'General Kenobi';

              for (var subscriber in subscribers) {
                dynamicMessageChannel.subscribe(subscriber);
              }

              dynamicMessageChannel.notifyAllSubscribers(str);
              for (var subscriber in subscribers) {
                expect(subscriber.latestNews, str);
              }
            }
          );
          test('After unsubscribe',
            ()  {
              var dynamicMessageChannel = DynamicMessageChannel.base<String, String>();
              var dynamicMessageBroker = DynamicMessageBroker.base<String, String>() as DynamicMessageBroker<String, String>;
              var subscriber = NewsSubscriber(dynamicMessageBroker);
              var str1 = 'General Kenobi';
              var str2 = 'Hello there';
              dynamicMessageChannel.subscribe(subscriber);
              dynamicMessageChannel.notifyAllSubscribers(str2);
              dynamicMessageChannel.unsubscribe(subscriber);
              dynamicMessageChannel.notifyAllSubscribers(str1);
              expect(subscriber.latestNews, str2);
            }
          );
        }
      );
    }
  );
}