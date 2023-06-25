part of giz;

class GizGlassyContainer extends StatelessWidget  {

  final double? width;
  final double? height;
  final Color foregroundColor;
  final Color backgroundColor;
  final Widget child;
  final BorderRadius borderRadius;
  final double sigmaX;
  final double sigmaY;

  const GizGlassyContainer({Key? key,
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

class GizFloatingContainer extends StatelessWidget  {

  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final Widget child;

  const GizFloatingContainer({Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GizGlassyContainer(
    width: width,
    height: height,
    foregroundColor: GizColors.primaryOpacity10, backgroundColor: GizColors.darkPrimaryOpacity50,
    borderRadius: borderRadius,
    child: child
  );

}

class GizDialogContainer extends StatelessWidget {
  final Size size;
  final BorderRadius borderRadius;
  final Widget child;
  final VoidCallback? onClose;
  final Widget closeButton;
  final Border border;
  final Color backgroundColor;

  const GizDialogContainer({
    Key? key,
    required this.child,
    this.closeButton = const SizedBox(
        width: 44,
        height: 44,
        child: Center(
          child: Icon(Icons.close,
            size: 21.0,
            color: GizColors.primary,
          ),
        ),
      ),
    this.backgroundColor = GizColors.darkPrimary,
    this.border = const Border.fromBorderSide(
      BorderSide(
        color: GizColors.primaryOpacity50,
        width: 0.5,
      ),
    ),
    
    this.onClose,
    this.size = const Size(500, 500),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
    backgroundColor: Colors.transparent,
    titlePadding: const EdgeInsets.all(0.0),
    buttonPadding: const EdgeInsets.all(0.0),
    contentPadding: const EdgeInsets.all(0.0),
    insetPadding: const EdgeInsets.all(0.0),
    actionsPadding: const EdgeInsets.all(0.0),
    content: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
      ),
      child: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: onClose,
              child: closeButton,
            ),
          ),
        ],
      ),
    ),
  );
}
