part of giz;

class GizFloatingButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final double? width;
  final double? height;
  final bool isSelected;

  const GizFloatingButton({
    Key? key,
    this.onPressed,
    this.onLongPressed,
    required this.child,
    this.width = 55.0,
    this.height = 55.0,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onLongPress: onLongPressed,
      onTap: onPressed,
      customBorder: const CircleBorder(),
      borderRadius: BorderRadius.circular(55.0),
      child: GizFloatingContainer(
        width: width,
        height: height,
        borderRadius: BorderRadius.circular(55.0),
        child: Stack(
          children: [
            Center(
              child: child,
            ),
            Container(
              color: isSelected ? GizColors.primaryOpacity40
                : Colors.transparent,
            ),
          ],
        ),
      ),
    ),
  );
}

class ToggleButtonGroupItem<T>  {

  final T value;
  final Widget child;

  ToggleButtonGroupItem({
    required this.value,
    required this.child,
  });

}

class ToggleButtonGroup<T> extends StatelessWidget   {

  final double spacing;
  final Size itemSize;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final Iterable<ToggleButtonGroupItem<T>> items;

  const ToggleButtonGroup({super.key, required this.groupValue, required this.onChanged, required this.items, required this.itemSize, required this.spacing});

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: spacing,
    children: [
      for(var item in items)
        ToggleButton(
          size: itemSize,
          isToggled: groupValue == item.value,
          child: item.child,
          onTap: ()  {
            onChanged(item.value);
          },
        ),
    ],
  );

}

class ToggleButton extends StatelessWidget  {

  final bool isToggled;
  final Widget child;
  final Size size;
  final VoidCallback onTap;

  const ToggleButton({super.key,
    required this.size,
    required this.isToggled,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      child: SizedBox.fromSize(
        size: size,
        child: Container(
          color: isToggled ? GizColors.primaryOpacity30: Colors.transparent,
          child: Center(
            child: child,
          ),
        ),
      ),
    ),
  );

}

class TextButtonBar extends StatelessWidget  {

  final String currentValue;
  final Iterable<String> values;
  final ValueChanged<String> onChanged;
  final Color? selectedTextColor;
  final Color? textColor;

  const TextButtonBar({super.key,
    required this.currentValue,
    required this.values,
    required this.onChanged,
    this.selectedTextColor,
    this.textColor,
  });
  
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Wrap(
        spacing: 13.0,
        children: [
          for(var value in values)
            InkWell(
              child: Text(value,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: value == currentValue ? FontWeight.w600: FontWeight.w400,
                  color: value == currentValue ? textColor: selectedTextColor,
                ),
              ),
              onTap: ()  {
                onChanged(value);
              },
            ),
        ],
      ),
    ],
  );
  
}


