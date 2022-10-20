import 'package:dart_generics/dart_generics.dart';

class Counter extends Observer<int>   {
  int count = 0;
  
  @override
  void update(int event) {
    count += event;
  }

}

class NumberPump extends Observable  {
  void pump(int no)  {
    notifyAllObservers(no);
  }
}

class CounterCommand extends Command  {
  Counter counter = Counter();
  
  @override
  void execute() {
    counter.update(10);
  }

  @override
  void rollback() {
    counter.update(-10);
  }

}

abstract class AbstractMockSubscriber<ChannelTagType, MessageType> extends DynamicMessageSubscriber<ChannelTagType, MessageType>  {
  
  final Set<ChannelTagType> _channels = {};

  AbstractMockSubscriber(DynamicMessageSubscribable<ChannelTagType, MessageType> dynamicMessageSubscribable) : super(dynamicMessageSubscribable);

  void subscribe(ChannelTagType channel)  {
    if(_channels.add(channel)) {
      dynamicMessageSubscribable.subscribe(subscriber: this, channel: channel);
    }
  }

  void unsubscribe(ChannelTagType channel)  {
    if(_channels.remove(channel)) {
      dynamicMessageSubscribable.unsubscribe(subscriber: this, channel: channel);
    }
  }

  List<ChannelTagType> get channels => _channels.toList();

}

class NewsSubscriber extends AbstractMockSubscriber<String, String>  {
  
  String latestNews = '';

  NewsSubscriber(DynamicMessageSubscribable<String, String> dynamicMessageSubscribable): super(dynamicMessageSubscribable)  {
    subscribe('news');
  }

  @override
  void update(String event) {
    latestNews = event;
  }

}

class NewsPublisher extends DynamicMessagePublisher<String, String>  {

  final String channel = 'news';

  NewsPublisher(DynamicMessagePublishable<String, String> dynamicMessagePublishable) : super(dynamicMessagePublishable);

  Future<void> publish(String message) async {
    await dynamicMessagePublishable.publish(message: message, channel: channel);
  }

}

enum EventType  {
  ChildEvent,
  OtherChildEvent
}

abstract class ParentEvent  {
  final EventType eventType;

  ParentEvent(this.eventType);

  factory ParentEvent.childEvent() => ChildEvent();
  factory ParentEvent.otherChildEvent() => OtherChildEvent();

}

class CustomEventRouter<T extends ParentEvent> extends BaseDynamicMessageBroker<String, T>  {}

class ChildEvent extends ParentEvent {
  ChildEvent() : super(EventType.ChildEvent);

  final String property = 'ChildEvent\'s Property';

}

class OtherChildEvent extends ParentEvent {
  OtherChildEvent() : super(EventType.OtherChildEvent);

  final String property = 'OtherChildEvent\'s Property';

}

class ParentSubscriber extends AbstractMockSubscriber<String, ParentEvent>  {
  
  int hits = 0;
  
  ParentSubscriber(DynamicMessageSubscribable<String, ParentEvent> dynamicMessageSubscribable) : super(dynamicMessageSubscribable)  {
    subscribe('poly');    
  }

  @override
  void update(ParentEvent event) {
    ++hits;
  }

}

class ChildSubscriber extends AbstractMockSubscriber<String, ChildEvent>  {

  int hits = 0;

  ChildSubscriber(DynamicMessageSubscribable<String, ChildEvent> dynamicMessageSubscribable) : super(dynamicMessageSubscribable)  {
    subscribe('poly');
  }

  @override
  void update(ChildEvent event) {
    ++hits;
  }

}

class OtherSubscriber extends AbstractMockSubscriber<String, OtherChildEvent>  {
  
  int hits = 0;

  OtherSubscriber(DynamicMessageSubscribable<String, OtherChildEvent> dynamicMessageSubscribable) : super(dynamicMessageSubscribable)  {
    subscribe('poly');
  }

  @override
  void update(OtherChildEvent event) {
    ++hits;
  }

}

class ParentPublisher extends DynamicMessagePublisher<String, ParentEvent>  {
  ParentPublisher(DynamicMessagePublishable<String, ParentEvent> dynamicMessagePublishable) : super(dynamicMessagePublishable);
}

class ChildPublisher extends DynamicMessagePublisher<String, ChildEvent>  {
  ChildPublisher(DynamicMessagePublishable<String, ChildEvent> dynamicMessagePublishable) : super(dynamicMessagePublishable);
}

class OtherPublisher extends DynamicMessagePublisher<String, OtherChildEvent>  {
  OtherPublisher(DynamicMessagePublishable<String, OtherChildEvent> dynamicMessagePublishable) : super(dynamicMessagePublishable);
}

class Container  {
  final int capacity;
  final double avgTemp;

  const Container(this.capacity, this.avgTemp);
}

class Food  {
  final int stocks;
  final double temp;

  final Specification<Container> containerConstraints;

  Food(this.stocks, this.temp)
  : containerConstraints =  TempLowerBoundSpec(temp - 5)
    .and(TempUpperBoundSpec(temp + 10))
    .and(CapacitySpec(stocks));

  bool isContainableBy(Container container) => containerConstraints.isSatisfiedBy(container);

}

class TempLowerBoundSpec implements Specification<Container>  {
  final double lowerBound;
  
  const TempLowerBoundSpec(this.lowerBound);
  
  @override
  bool isSatisfiedBy(Container obj) => obj.avgTemp > lowerBound;

}

class TempUpperBoundSpec implements Specification<Container>  {
  final double upperBound;
  
  const TempUpperBoundSpec(this.upperBound);
  
  @override
  bool isSatisfiedBy(Container obj) => obj.avgTemp <= upperBound;

}

class CapacitySpec implements Specification<Container>  {
  final int capacity;
  
  const CapacitySpec(this.capacity);
  
  @override
  bool isSatisfiedBy(Container obj) => obj.capacity >= capacity;

}

class Cat  {

}

class Dog  {

}

class DogCat implements Cat, Dog  {

}

class DynamicSpecification implements Specification {
  final bool Function(dynamic obj) check;
  
  DynamicSpecification(this.check);

  @override
  bool isSatisfiedBy(obj) => check(obj);

}

class SpecificMessage  {
  final String msg;

  SpecificMessage(this.msg);

}

class NotSpecificMessage  {
  final String msg;

  NotSpecificMessage(this.msg);
}

class MockSpecificMessageSubscriber extends SpecificMessageSubscriber  {
  String? msg;
  SpecificMessageSubscribable? subscribable;

  MockSpecificMessageSubscriber(
    {
      required bool Function(dynamic) specification,
      this.subscribable
    }
  ) : super(Specification.base(specification))  {
    subscribable?.subscribe(this);
  }

  @override
  void update(event) {
    msg = event.msg;
  }

}

class ListOne  {
  final List<ListTwo> _list;
  final FlexibleIterator<ListTwo> _iter;

  ListOne(this._list, {int checkpoint = -1})
  : _iter = FlexibleIterator.base(_list)..move(checkpoint);

  FlexibleIterator<ListTwo> get iterator => _iter;

}

class ListTwo  {
  final List<ListThree> _list;
  final FlexibleIterator<ListThree> _iter;

  ListTwo(this._list, {int checkpoint = -1})
  : _iter = FlexibleIterator.base(_list)..move(checkpoint);
  
  FlexibleIterator<ListThree> get iterator => _iter;
}

class ListThree  {
  final List<int> _list;
  final FlexibleIterator<int> _iter;

  ListThree(this._list, {int checkpoint = -1})
  : _iter = FlexibleIterator.base(_list)..move(checkpoint);
  
  FlexibleIterator<int> get iterator => _iter;
}
