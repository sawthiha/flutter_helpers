part of giz;

class GizFloatingButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isSelected;

  const GizFloatingButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width = 55.0,
    this.height = 55.0,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
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

