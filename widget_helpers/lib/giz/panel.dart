part of giz;

class Panel extends StatelessWidget  {

  final Axis? direction;
  final double spacing;
  final List<Widget> children;
  final Alignment animAlignment;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final BoxBorder? border;

  const Panel({super.key,
    this.direction = Axis.vertical,
    this.spacing = 5.0,
    required this.children,
    this.animAlignment = Alignment.center,
    this.backgroundColor,
    this.borderRadius,
    this.border,
  });

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    elevation: 8.0,
    child: AnimatedSize(
      alignment: animAlignment,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      child: Container(
        width: direction == Axis.vertical || direction == null ? 44.0: null,
        height: direction == Axis.horizontal || direction == null ? 44.0: null,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          border: border ?? Border.all(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: direction == Axis.vertical ? 8.0: 0.0,
            horizontal: direction == Axis.horizontal ? 8.0: 0.0,
          ),
          child: Wrap(
            direction: direction ?? Axis.horizontal,
            runAlignment: WrapAlignment.center,
            alignment: direction == null ? WrapAlignment.center: WrapAlignment.start,
            spacing: spacing,
            children: children,
          ),
        ),
      ),
    ),
  );

}

class PanelEntry extends HookWidget  {

  final PopupMenuController popupController;
  final Widget child;
  final bool isToggled;
  final void Function(PopupMenuController controller)? onTap;
  final void Function(PopupMenuController controller)? onLongPressed;
  final Axis axis;
  final double axisAlignment;

  final double width;

  final Color? splashColor;
  final Color? highlightColor;
  final Color? toggledColor;

  PanelEntry({super.key,
    required this.child,
    PopupMenuController? popupController,
    this.onTap,
    this.onLongPressed,
    this.isToggled = false,
    this.axis = Axis.horizontal,
    this.axisAlignment = -1.0,

    this.width = 34.0,
    
    this.splashColor,
    this.highlightColor,
    this.toggledColor,

  }): popupController = popupController ?? PopupMenuController();

  @override
  Widget build(BuildContext context) {
    final animController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final sizeAnim = CurvedAnimation(
      parent: animController,
      curve: Curves.easeInOutCubic,
    );
    useEffect(()  {
      animController.forward();
      return null;
    });
    return SizeTransition(
      sizeFactor: sizeAnim,
      axis: axis,
      axisAlignment: axisAlignment,
      child: SizedBox.fromSize(
        size: Size(width, 34.0),
        child: PopupMenuTarget(
          controller: popupController,
          child: Material(
            color: isToggled ? (toggledColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.3)): Colors.transparent,
            child: InkWell(
              splashColor: splashColor,
              highlightColor: highlightColor,
              onTap: () { onTap?.call(popupController); },
              onLongPress: () { onLongPressed?.call(popupController); },
              child: Stack(
                children: [
                  if(onLongPressed != null)
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: ExpansionIndicator(),
                      ),
                    ),
                  Center(
                    child: child,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class ExpansionIndicator extends StatelessWidget  {

  const ExpansionIndicator({super.key});

  @override
  Widget build(BuildContext context) => SizedBox.fromSize(
    size: const Size(6, 6),
    child: CustomPaint(
      painter: _ExpansionIndicatorPainter(),
      child: Container(),
    )
  );

}

class _ExpansionIndicatorPainter extends CustomPainter   {

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    canvas.drawPath(
      Path()
        ..moveTo(size.width, 0.0)
        ..lineTo(size.width, size.height)
        ..lineTo(0.0, size.height)
        ..close(),
      Paint()
        ..style = PaintingStyle.fill
        ..color = GizColors.primary,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}

