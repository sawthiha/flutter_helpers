/// Observer module
part of patterns;

/// Observer Interface
abstract class Observer<T>  {
  /// Update callback that [Observable] calls on update events.
  void update(T event);
}

/// Observable interface
abstract class Observable<T>  {

  /// Registered Observers
  final Set<Observer<T>> _observers = {};

  /// Observer getter
  Iterable<Observer<T>> get observers => _observers;

  /// Register observers
  void registerObserver(Observer<T> observer)  {
    _observers.add(observer);
  }

  /// Deregister observers
  void deregisterObserver(Observer<T> observer)  {
    _observers.remove(observer);
  }

  /// Nofify all observer with update information
  void notifyAllObservers(T update)  {
    for(var observer in _observers.toList())  {
      observer.update(update);
    }
  }
}