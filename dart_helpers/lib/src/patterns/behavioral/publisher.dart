/// PubSub Module
part of patterns;

/// Subscribale Interface
/// 
/// [ChannelTagType], [MessageType] => dynamic
abstract class DynamicMessageSubscribable<ChannelTagType, MessageType> {
  /// Subscribe
  void subscribe(
    {
      required DynamicMessageSubscriber<ChannelTagType, MessageType> subscriber,
      required ChannelTagType channel
    }
  );

  /// Unsubscribe
  void unsubscribe(
    {
      required DynamicMessageSubscriber<ChannelTagType, MessageType> subscriber,
      required ChannelTagType channel
    }
  );
}

/// Subscribale Interface
/// 
/// [ChannelTagType], [MessageType] => dynamic
abstract class DynamicMessagePublishable<ChannelTagType, MessageType> {
  /// Publish
  Future<void> publish(
    {
      required MessageType message,
      required ChannelTagType channel
    }
  );
}

/// Dynamic Message Broker Base
/// 
/// extends [DynamicMessageSubscribable], [DynamicMessagePublishable]
abstract class DynamicMessageBroker<ChannelTagType, MessageType>
implements DynamicMessageSubscribable<ChannelTagType, MessageType>,
DynamicMessagePublishable<ChannelTagType, MessageType> {

  static DynamicMessageBroker base<ChannelTagType, MessageType>()
    => BaseDynamicMessageBroker<ChannelTagType, MessageType>();

}

/// Concrete Dyanmic Message Broker
class BaseDynamicMessageBroker<ChannelTagType, MessageType>
implements DynamicMessageBroker<ChannelTagType, MessageType> {

  /// Channel, Subscriber Map
  final Map<ChannelTagType, DynamicMessageChannel<ChannelTagType, MessageType>>
    _channels = { };

  @override
  void subscribe(
    {
      required DynamicMessageSubscriber<ChannelTagType, MessageType> subscriber,
      required ChannelTagType channel
    }
  ) {
    if (_channels.containsKey(channel)) {
      _channels[channel]!.subscribe(subscriber);
    } else {
      _channels[channel] =
          DynamicMessageChannel.base<ChannelTagType, MessageType>() as DynamicMessageChannel<ChannelTagType, MessageType>
            ..subscribe(subscriber);
    }
  }

  @override
  void unsubscribe(
    {
      required DynamicMessageSubscriber<ChannelTagType, MessageType> subscriber,
      required ChannelTagType channel
    }
  ) {
    _channels[channel]!.unsubscribe(subscriber);
  }

  @override
  Future<void> publish(
    {
      required MessageType message,
      required ChannelTagType channel
    }
  ) async {
    // TODO: Exception Safety
    _channels[channel]!.notifyAllSubscribers(message);
  }
}

/// Dynamic Message Channel Abstraction
abstract class DynamicMessageChannel<ChannelTagType, MessageType> {
  static DynamicMessageChannel base<ChannelTagType, MessageType>() =>
      _BaseDynamicMessageChannel<ChannelTagType, MessageType>();

  /// Subscriber
  Iterable<DynamicMessageSubscriber<ChannelTagType, MessageType>> get subscribers;

  /// Propage the message
  void notifyAllSubscribers(MessageType message);

  /// Subscribe
  void subscribe(
      DynamicMessageSubscriber<ChannelTagType, MessageType> subscriber
  );

  /// Unsubscribe
  void unsubscribe(
      DynamicMessageSubscriber<ChannelTagType, MessageType> subscriber
  );
}

/// Internal Concrete Message Channel
/// 
/// extends [Dynamic Message Channel]
class _BaseDynamicMessageChannel<ChannelTagType, MessageType>
    implements DynamicMessageChannel<ChannelTagType, MessageType> {
  final Set<DynamicMessageSubscriber<ChannelTagType, MessageType>> _subscribers =
      { };

  @override
  List<DynamicMessageSubscriber<ChannelTagType, MessageType>> get subscribers =>
      _subscribers.toList();

  @override
  void notifyAllSubscribers(MessageType message) {
    for (var subscriber in subscribers) {
      subscriber.update(message);
    }
  }

  @override
  void subscribe(
      DynamicMessageSubscriber<ChannelTagType, MessageType> subscriber
  )  {
    _subscribers.add(subscriber);
  }

  @override
  void unsubscribe(
    DynamicMessageSubscriber<ChannelTagType, MessageType> subscriber
  ) {
    _subscribers.remove(subscriber);
  }
}

/// Dynamic Message Subscriber Bridge
/// 
/// extends Observer
abstract class DynamicMessageSubscriber<ChannelTagType, MessageType>
extends Observer<MessageType> {

  /// Subscribale Implementation
  final DynamicMessageSubscribable<ChannelTagType, MessageType>
    dynamicMessageSubscribable;

  DynamicMessageSubscriber(this.dynamicMessageSubscribable);
}

/// Dynamic Message Subscriber Bridge
abstract class DynamicMessagePublisher<ChannelTagType, MessageType> {
  /// Publishable Implementation
  final DynamicMessagePublishable<ChannelTagType, MessageType>
      dynamicMessagePublishable;

  DynamicMessagePublisher(this.dynamicMessagePublishable);
}

/// Specific Message Subscribable Interface
abstract class SpecificMessageSubscribable  {
  /// Subscribe
  void subscribe(SpecificMessageSubscriber subscriber);
  /// Unsubscribe
  void unsubscribe(SpecificMessageSubscriber subscriber);
}

/// Specific Message Subscribable Interface
abstract class SpecificMessagePublishable  {
  /// Publish
  void publish(dynamic message);
  /// Tap to a [Stream]
  void add(Stream stream);

  Future<void> dispose();
}

/// Specific Message Broker Interface
abstract class SpecificMessageBroker
implements SpecificMessageSubscribable, SpecificMessagePublishable  {
  factory SpecificMessageBroker.base() = SpecificMessageBrokerBase;
}

/// Concrete Specific Message Broker
class SpecificMessageBrokerBase implements SpecificMessageBroker  {
  /// Subscribers
  final Set<SpecificMessageSubscriber> _subscribers = {};
  /// [StreamSubscription]s if any
  final List<StreamSubscription> _subscriptions = [];

  @override
  void publish(message) {
    // TODO: toList() is a quick fix to concurrent mod exception
    _subscribers.toList().forEach(
      (subscriber)  {
        if(subscriber.specification.isSatisfiedBy(message))  {
          subscriber.update(message);
        }
      }
    );
  }

  @override
  void subscribe(SpecificMessageSubscriber subscriber) {
    _subscribers.add(subscriber);
  }

  @override
  void unsubscribe(SpecificMessageSubscriber subscriber) {
    _subscribers.remove(subscriber);
  }

  @override
  void add(Stream stream) {
    _subscriptions.add(
      stream.listen(publish)
    );
  }

  @override
  Future<void> dispose() async {
    for (var sub in _subscriptions) {
      await sub.cancel();
    }
  }

}

/// Specific Message Subscriber Interface
abstract class SpecificMessageSubscriber<T> extends Observer<T> {
  /// [Specification]
  final Specification specification;

  SpecificMessageSubscriber(this.specification);

  /// Create generic [SpecificMessageSubscriber]
  factory SpecificMessageSubscriber.base(
    bool Function(dynamic message) specification,
    void Function(T message) onMessage,
  ) = SpecificMessageSubscriberBase;

  /// Create [SpecificMessageSubscriber] by Message Type
  factory SpecificMessageSubscriber.byType(
    void Function(T message) onMessage,
  ) = SpecificMessageSubscriberByType;
}

/// Concrete Specific Message Subscriber
class SpecificMessageSubscriberBase<T> extends SpecificMessageSubscriber<T>  {
  
  /// onMessage callback
  /// 
  /// Called when subscriber receives a message
  final void Function(T message) onMessage;

  SpecificMessageSubscriberBase(
    bool Function(dynamic message) specification,
    this.onMessage,
  ) : super(Specification.base(specification));

  @override
  void update(message) => onMessage(message);

}

/// Convenient generic [SpecificMessageSubscriberByType]
/// 
/// Receives message of Type <T>
class SpecificMessageSubscriberByType<T> extends SpecificMessageSubscriberBase<T>  {
  SpecificMessageSubscriberByType(void Function(T message) onMessage)
  : super((msg) => msg is T, onMessage);
}