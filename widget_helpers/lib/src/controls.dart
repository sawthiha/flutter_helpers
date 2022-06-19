part of widget_helpers;

class SelectableWidgetController extends ValueNotifier  {
  
  final List values;

  SelectableWidgetController(value, this.values)
  : assert(values.contains(value)),
    super(value);

  @override
  void addListener(listener) {
    listener();
    super.addListener(listener);
  }

}

class SelectableWidgetSelector  {
  final dynamic _widgetValue;
  final SelectableWidgetController _controller;

  SelectableWidgetSelector(SelectableWidgetController controller, value)
  : _controller = controller, _widgetValue = value;

  get value => _controller.value;

  void select()  {
    assert(_controller.values.contains(_widgetValue));
    _controller.value = _widgetValue;
  }

  void unselect()  {
    if(value == _widgetValue)  {
      _controller.value = null;
    }
  }

  bool get isSelected => _controller.value == _widgetValue;

}

typedef SelectableWidgetCallback = void Function(SelectableWidgetSelector selector);

class SelectableWidget extends StatefulWidget   {
  
  final SelectableWidgetController controller;
  final Widget Function(
    BuildContext context,
    SelectableWidgetSelector selector
  ) builder;
  final SelectableWidgetCallback? onSelectionChanged;
  final dynamic value;
  
  SelectableWidget(
    {
      Key? key,
      required this.value,
      required this.controller,
      required this.builder,
      this.onSelectionChanged
    }
  ): assert(controller.values.contains(value)), super(key: key);

  @override
  State<StatefulWidget> createState()
    => SelectableWidgetState();
}

class SelectableWidgetState extends State<SelectableWidget>  {
  late SelectableWidgetSelector _selector;

  @override
  void initState() {
    _selector = SelectableWidgetSelector(widget.controller, widget.value);
    widget.controller.addListener(_onSelect);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onSelect);
    super.dispose();
  }

  void _onSelect()  {
    widget.onSelectionChanged?.call(
      _selector
    );
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
    value: widget.controller,
    child: widget.builder(context, _selector)
  );

}

class HighlightableWidgetHighlighter extends ValueNotifier<bool>  {
  
  HighlightableWidgetHighlighter(bool value) : super(value);

  void highlight()  {
    value = true;
  }

  void unhighlight()  {
    value = false;
  }

  void toggle()  {
    value = !value;
  }

}

typedef HighlightableWidgetCallback = void Function(HighlightableWidgetHighlighter highlighter);

class HighlightableWidget extends StatefulWidget  {
  final Widget Function(BuildContext context, HighlightableWidgetHighlighter highlighter)
      builder;
  final HighlightableWidgetCallback? onHighlightChanged;

  const HighlightableWidget(
    {
      Key? key,
      required this.builder,
      this.onHighlightChanged
    }
  ): super(key: key);
  
  @override
  State<StatefulWidget> createState() => _HighlightableWidgetState();
  
}

class _HighlightableWidgetState extends State<HighlightableWidget>
  with SingleTickerProviderStateMixin {
  
  late AnimationController _animationController;
  late Animation<double> _animation;
  final HighlightableWidgetHighlighter _highlighter = HighlightableWidgetHighlighter(false);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30)
    );
    _animation = Tween(
      begin: 0.0,
      end: 5.0 // **Control
    ).animate(_animationController);
    _highlighter.addListener(_onHighlight);
    
    super.initState();
  }

  void _onHighlight()  {
    if(_highlighter.value)  {
      _animationController.forward();
    }  
    else {
      _animationController.reverse();
    }
    widget.onHighlightChanged?.call(_highlighter);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _highlighter.removeListener(_onHighlight);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.blue, // **control
    child: AnimatedBuilder(
      animation: _animation,
      child: Container(
        child: widget.builder(context, _highlighter),
        color: Colors.white, // **control
      ),
      builder: (context, child) => Padding(
        child: child,
        padding: EdgeInsets.only(bottom:_animation.value),
      ),
    ),
  );
}
