part of techno;

class TechnoGlassyContainer extends StatelessWidget  {

  final double? width;
  final double? height;
  final Color foregroundColor;
  final Color backgroundColor;
  final Widget child;
  final BorderRadius borderRadius;
  final double sigmaX;
  final double sigmaY;

  const TechnoGlassyContainer({Key? key,
    required this.width,
    required this.height,
    required this.foregroundColor, required this.backgroundColor,
    required this.borderRadius,
    required this.child,
    this.sigmaX = 4, this.sigmaY = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: borderRadius,
    child: SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          RepaintBoundary(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: sigmaX,
                sigmaY: sigmaY,
              ),
              child: Container(
                width: width,
                height: height,
                color: Color.alphaBlend(foregroundColor, backgroundColor),
              ),
            ),
          ),
          child,
        ],
      ),
    ),
  );

}

class TechnoFloatingContainer extends StatelessWidget  {

  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final Widget child;

  const TechnoFloatingContainer({Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TechnoGlassyContainer(
    width: width,
    height: height,
    foregroundColor: TechnoColors.primaryOpacity10, backgroundColor: TechnoColors.darkPrimaryOpacity50,
    borderRadius: borderRadius,
    child: child
  );

}

class TechnoDialogContainer extends StatelessWidget {
  final Size size;
  final BorderRadius borderRadius;
  final Widget child;
  final VoidCallback? onClose;
  final double closeButtonSize;
  final double closeButtonIconSize;
  final EdgeInsets closeButtonPadding;
  final double foregroundOpacity;
  final double backgroundOpacity;

  const TechnoDialogContainer({
    Key? key,
    required this.child,
    this.closeButtonSize = 34.0,
    this.closeButtonIconSize = 21.0,
    this.closeButtonPadding = const EdgeInsets.only(
      top: 27.99,
      right: 17.29,
    ),
    this.foregroundOpacity = 0.5,
    this.backgroundOpacity = 0.2,
    
    this.onClose,
    this.size = const Size(889, 633),
    this.borderRadius = const BorderRadius.all(Radius.circular(27.99)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
    backgroundColor: Colors.transparent,
    titlePadding: const EdgeInsets.all(0.0),
    buttonPadding: const EdgeInsets.all(0.0),
    contentPadding: const EdgeInsets.all(0.0),
    insetPadding: const EdgeInsets.all(0.0),
    actionsPadding: const EdgeInsets.all(0.0),
    content: TechnoGlassyContainer(
      width: size.width,
      height: size.height,
      foregroundColor: TechnoColors.darkPrimary.withOpacity(foregroundOpacity),
      backgroundColor: TechnoColors.darkPrimary.withOpacity(backgroundOpacity),
      borderRadius: borderRadius,
      child: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: closeButtonPadding,
              child: Container(
                width: closeButtonSize,
                height: closeButtonSize,
                decoration: BoxDecoration(
                  color: TechnoColors.primary,
                  borderRadius: BorderRadius.circular(closeButtonSize / 2),
                ),
                child: InkWell(
                  onTap: onClose,
                  child: Icon(
                    Icons.close,
                    size: closeButtonIconSize,
                    color: TechnoColors.warning,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      sigmaX: 40,
      sigmaY: 40,
    ),
  );
}
