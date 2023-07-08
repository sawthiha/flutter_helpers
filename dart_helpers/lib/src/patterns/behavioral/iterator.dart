part of patterns;

/// FlexibleIterationCallback Alias
typedef FlexibleIterationCallback = void Function(int idx);

/// [FlexibleIterator] interface
/// 
/// extends [BidirectionalIterator]
abstract class FlexibleIterator<T> {

  FlexibleIterator();

  /// Index getter
  int get idx;
  /// Length getter
  int get length;

  /// Take a step
  /// 
  /// Backward if [isReverse] is true
  bool step({bool isReverse = false});

  /// Check if a step can be take
  /// 
  /// Backward if [isReverse] is true
  bool hasSuccessor({bool inReverse = false});
  /// Check if has successor next
  bool get hasNext;
  /// Check if has successor previous
  bool get hasPrev;

  /// Move the cursor to the beginning
  void begin();
  /// Move the cursor to the end
  void end();

  /// Check if cursor is at the beginning
  bool get isBegin;
  /// Check if cursor is at the end
  bool get isEnd;

  /// Check if cursor is at the first valid element
  bool get isFirst;
  /// Check if cursor is at the last valid element
  bool get isLast;

  /// Move to cursor to specific index
  void move(int to);

  T get current;
  bool moveNext();
  bool movePrevious();

  /// Add Listener to the cursor changes
  void addListener(FlexibleIterationCallback callback);

  /// Factory
  factory FlexibleIterator.base(Iterable<T> iterable, {bool isReverse}) = FlexibleIteratorBase;

}

/// Concrete FlexibleIterator
class FlexibleIteratorBase<T> extends FlexibleIterator<T>  {
  /// Iterable
  final Iterable<T> _iterable;
  /// Cursor
  int _idx;

  FlexibleIteratorBase(Iterable<T> iterable, {bool isReverse = false})
  : _iterable = iterable
  , _idx = isReverse ? iterable.length: -1;

  @override
  T get current => _iterable.elementAt(_idx);

  @override
  bool moveNext() {
    if(hasNext)  {
      _idx++;
      _notifyListeners();
      return hasNext;
    }
    return false;
  }

  @override
  bool movePrevious()  {
    if(hasPrev)  {
      _idx--;
      _notifyListeners();
      return hasPrev;
    }
    return false;
  }

  @override
  bool get hasNext => _iterable.isNotEmpty && _idx < _iterable.length;

  @override
  bool get hasPrev => _iterable.isNotEmpty && _idx > -1;

  @override
  void begin() {
    _idx = -1;
    _notifyListeners();
  }

  @override
  void end() {
    _idx = _iterable.isNotEmpty ? _iterable.length: -1;
    _notifyListeners();
  }

  @override
  void move(int to) {
    if(to >= -1 && to <= _iterable.length)  {
      _idx = to;
      _notifyListeners();
    }
  }

  @override
  bool step({bool isReverse = false}) {
    return isReverse ? movePrevious(): moveNext();
  }

  @override
  bool get isBegin => _idx == -1; 

  @override
  bool get isEnd => _iterable.isEmpty || _idx == _iterable.length;

  @override
  bool get isFirst => _idx == 0;

  @override
  bool get isLast => _iterable.isNotEmpty && _idx == _iterable.length - 1;

  @override
  int get idx => _idx;

  @override
  bool hasSuccessor({bool inReverse = false}) => inReverse ? hasPrev: hasNext;

  @override
  int get length => _iterable.length;

  /// Listeners
  List<FlexibleIterationCallback> callbacks = [];

  @override
  void addListener(FlexibleIterationCallback callback) {
    callbacks.add(callback);
  }

  /// Notify Listeners
  void _notifyListeners()  {
    callbacks.forEach(
      (callback) {
        callback(_idx);
      },
    );
  }

}
