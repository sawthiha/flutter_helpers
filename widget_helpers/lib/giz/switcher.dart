part of giz;

class Switcher<T> extends StatelessWidget  {

  final Map<T, Widget> items;
  final T currentValue;
  final Duration duration;
  final Duration? reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  const Switcher({super.key,
    required this.currentValue,
    required this.items,
    required this.duration,
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  });

  @override
  Widget build(BuildContext context)  => AnimatedSwitcher(
    child: items[currentValue],
    duration: duration,
    reverseDuration: reverseDuration,
    switchInCurve: switchInCurve,
    switchOutCurve: switchOutCurve,
    transitionBuilder: transitionBuilder,
    layoutBuilder: layoutBuilder,
  );

}


