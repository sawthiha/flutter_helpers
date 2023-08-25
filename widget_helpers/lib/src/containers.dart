part of widget_helpers;

enum OverlayedContainerPosition  {
  top,
  bottom,
  left,
  right
}

Map<OverlayedContainerPosition,
    Widget Function(
      Widget child, LayerLink link, Size parentSize, Offset offset
    )>  _followerBuilders = {
  
  OverlayedContainerPosition.top:
    (child, link, parentSize, offset) => CompositedTransformFollower(
      followerAnchor: Alignment.bottomLeft,
      offset: offset,
      link: link,
      child: child,
    ),

  OverlayedContainerPosition.bottom:
    (child, link, parentSize, offset) => CompositedTransformFollower(
      offset: Offset(0, parentSize.height) + offset,
      link: link,
      child: child,
    ),
  
  OverlayedContainerPosition.left:
    (child, link, parentSize, offset) => CompositedTransformFollower(
      offset: Offset(parentSize.width, 0) + offset,
      link: link,
      child: child,
    ),
  
  OverlayedContainerPosition.right:
    (child, link, parentSize, offset) => CompositedTransformFollower(
      followerAnchor: Alignment.topRight,
      offset: offset,
      link: link,
      child: child,
    ),

};

class OverlayedContainer extends StatefulWidget {
  final Widget Function(BuildContext context, ValueNotifier<bool> overlaySwitch)
      builder;
  final Widget Function(BuildContext context, ValueNotifier<bool> overlaySwitch)
      overlayBuilder;
  final OverlayedContainerPosition position;
  final Offset offset;
  final ValueNotifier<bool> overlaySwitch;

  OverlayedContainer(
    {
      Key? key,
      required this.builder,
      required this.overlayBuilder,
      ValueNotifier<bool>? overlaySwitch,
      this.position = OverlayedContainerPosition.bottom,
      this.offset = const Offset(0.0, 0.0)
    }
  ): overlaySwitch = overlaySwitch ?? ValueNotifier<bool>(false),
    super(key: key);

  @override
  State<StatefulWidget> createState() => _OverlayedContainerState();
}

class _OverlayedContainerState extends State<OverlayedContainer> {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    widget.overlaySwitch.addListener(
      () {
        if (widget.overlaySwitch.value) {
          _overlayEntry = _overlayWidget;
          Overlay.of(context).insert(_overlayEntry);
        } else {
          _overlayEntry.remove();
        }
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => CompositedTransformTarget(
    link: _layerLink,
    child: widget.builder(context, widget.overlaySwitch)
  );

  OverlayEntry get _overlayWidget  {
    Size parentSize = (context.findRenderObject() as RenderBox).size;
    
    return OverlayEntry(
      builder: (context) => Positioned(
        left: Offset.zero.dx,           // To constraint the follower
        child: _followerBuilders[widget.position]!(
          widget.overlayBuilder(context, widget.overlaySwitch),
          _layerLink,
          parentSize,
          widget.offset,
        ),
      ),
    );
  }
}

class PerspectiveContainer extends StatelessWidget  {

  final double rotationX;
  final double rotationY;
  final double rotationZ;
  final Widget child;

  const PerspectiveContainer({Key? key,
    required this.child,
    this.rotationX = 0.0,
    this.rotationY = 0.0,
    this.rotationZ = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
    () => Transform(
      origin: Offset.zero,
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(rotationX)
        ..rotateY(rotationY)
        ..rotateZ(rotationZ),
      child: child,
    ),
  );

}

class ElapsingOpacityContainer extends HookWidget   {

  final Duration timeout;
  final Duration duration;
  final Widget child;
  final double minOpacity, maxOpacity;

  const ElapsingOpacityContainer({super.key,
    required this.child,
    this.timeout = const Duration(seconds: 2, milliseconds: 500),
    this.duration = const Duration(milliseconds: 300),
    this.minOpacity = 0.3,
    this.maxOpacity = 1.0,
  });

  @override
  Widget build(BuildContext context)  {
    final isElapsedNoti = useState(false);
    void elapse()  {
      isElapsedNoti.value = true;
    }
    Timer timer = Timer(timeout, elapse);
    void activate()  {
      timer.cancel();
      isElapsedNoti.value = false;
      timer = Timer(timeout, elapse);
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: activate,
      onPanStart: (details) {
        activate();
      },
      onPanUpdate: (details) {
        activate();
      },
      onPanEnd: (details)  {
        activate();
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: isElapsedNoti,
        builder: (context, isElapsed, _) => AnimatedOpacity(
          opacity: isElapsed ? minOpacity: maxOpacity,
          duration: duration,
          child: child,
        ),
      ),
    );
  }

}

class ResponsiveWidget extends StatelessWidget  {

  final Widget Function(BuildContext, BoxConstraints) mobileWidgetBuilder;
  final Widget Function(BuildContext, BoxConstraints) tabletWidgetBuilder;
  final Widget Function(BuildContext, BoxConstraints) desktopWidgetBuilder;

  const ResponsiveWidget({super.key,
    required this.mobileWidgetBuilder,
    required this.tabletWidgetBuilder,
    required this.desktopWidgetBuilder,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => isMobile ? mobileWidgetBuilder(context, constraints)
      : isTablet ? tabletWidgetBuilder(context, constraints)
      : desktopWidgetBuilder(context, constraints),
  );

  static bool get isMobile => Get.size.width < 850;
  static bool get isTablet => Get.size.width < 1100 &&
    Get.size.width >= 850;
  static bool get isDesktop => Get.size.width >= 1100;
  static bool get isPortrait => Get.size.aspectRatio < 1.0;

}
