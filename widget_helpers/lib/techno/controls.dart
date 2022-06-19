part of techno;

class TechnoSlidingSegmentedControl<T extends Object> extends StatelessWidget  {

  final Map<T, Widget> children;
  final Size tabSize;
  final void Function(T?) onValueChanged;
  final T value;

  const TechnoSlidingSegmentedControl({
    Key? key,
    required this.onValueChanged,
    required this.children,
    required this.tabSize,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoSlidingSegmentedControl<T>(
    groupValue: value,
    children: children.map(
      (value, widget) => MapEntry<T, Widget>(
        value,
        SizedBox.fromSize(
          size: tabSize,
          child: Center(child: widget),
        ),
      ),
    ),
    backgroundColor: Color.alphaBlend(
      TechnoColors.primary.withOpacity(0.1), TechnoColors.darkPrimary.withOpacity(0.5),
    ),
    thumbColor: Color.alphaBlend(
      TechnoColors.primary.withOpacity(0.3), TechnoColors.darkPrimary.withOpacity(0.1),
    ),
    onValueChanged: onValueChanged,
  );

}

