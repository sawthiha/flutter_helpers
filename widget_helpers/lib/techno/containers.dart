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

