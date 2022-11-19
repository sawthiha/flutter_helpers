part of giz;

class GizSlidingSegmentedControl<T extends Object> extends StatelessWidget  {

  final Map<T, Widget> children;
  final Size tabSize;
  final void Function(T?) onValueChanged;
  final T value;
  final Color? backgroundColor;
  final Color? thumbColor;

  const GizSlidingSegmentedControl({
    Key? key,
    required this.onValueChanged,
    required this.children,
    required this.tabSize,
    required this.value,
    this.backgroundColor,
    this.thumbColor,
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
    backgroundColor: backgroundColor ?? Color.alphaBlend(
      GizColors.primary.withOpacity(0.1), GizColors.darkPrimary.withOpacity(0.5),
    ),
    thumbColor: thumbColor ?? Color.alphaBlend(
      GizColors.primary.withOpacity(0.3), GizColors.darkPrimary.withOpacity(0.1),
    ),
    onValueChanged: onValueChanged,
  );

}

