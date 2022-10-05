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

class PerspectiveController extends GetxController  {

  final _transform = (Matrix4.identity()
    ..setEntry(3, 2, 0.001)).obs;
  Matrix4 get transform => _transform.value;

  bool isGyro = false;

  void reset()  {
    setRotation(0.0, 0.0, 0.0);
  }

  final _rotationScale = vmath.Vector3(1.0, 1.0, 1.0).obs;
  double get rotationScaleX => _rotationScale.value.storage[0];
  set rotationScaleX(double rotation)  {
    _rotationScale.value = _rotationScale.value.clone()
      ..storage[0] = rotation;
    _updateRotation();
  }
  double get rotationScaleY => _rotationScale.value.storage[1];
  set rotationScaleY(double rotation)  {
    _rotationScale.value = _rotationScale.value.clone()
      ..storage[1] = rotation;
    _updateRotation();
  }
  double get rotationScaleZ => _rotationScale.value.storage[2];
  set rotationScaleZ(double rotation)  {
    _rotationScale.value = _rotationScale.value.clone()
      ..storage[2] = rotation;
    _updateRotation();
  }
  void setRotationScale(double x, double y, double z)  {
    _rotationScale.value = _rotationScale.value.clone()
      ..storage[0] = x
      ..storage[1] = y
      ..storage[2] = z;
    _updateRotation();
  }

  final rotationRx = vmath.Vector3(0.0, 0.0, 0.0).obs;
  double get rotationX => rotationRx.value.storage[0];
  set rotationX(double rotation)  {
    rotationRx.value = rotationRx.value.clone()
      ..storage[0] = rotation;
    _updateRotation();
  }
  double get rotationY => rotationRx.value.storage[1];
  set rotationY(double rotation)  {
    rotationRx.value = rotationRx.value.clone()
      ..storage[1] = rotation;
    _updateRotation();
  }
  double get rotationZ => rotationRx.value.storage[2];
  set rotationZ(double rotation)  {
    rotationRx.value = rotationRx.value.clone()
      ..storage[2] = rotation;
    _updateRotation();
  }
  void setRotation(double x, double y, double z)  {
    rotationRx.value = rotationRx.value.clone()
      ..storage[0] = x
      ..storage[1] = y
      ..storage[2] = z;
    _updateRotation();
  }
  void _updateRotation()  {
    _transform.value = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateX(rotationScaleX * rotationX)
      ..rotateY(rotationScaleY * rotationY)
      ..rotateZ(rotationScaleZ * rotationZ);
  }

  StreamSubscription<GyroscopeEvent>? _gyroSub;
  void startGyro()  {
    _gyroSub = gyroscopeEvents.listen(
      (event) {
        if(isGyro)  {
          if(event.x.abs() > 0.1)  {
            rotationY += -event.x / 100;
          }
        }
      }
    );
  }

  void stopGyro()  {
    _gyroSub?.cancel();
    _gyroSub = null;
  }

}

class PerspectiveContainer extends StatefulWidget  {

  final PerspectiveController controller;
  final Widget child;

  const PerspectiveContainer({Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  @override
  State<PerspectiveContainer> createState() => _PerspectiveContainerState();

}

class _PerspectiveContainerState extends State<PerspectiveContainer> {

  @override
  void initState() {
    super.initState();
    widget.controller.startGyro();
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.stopGyro();
  }

  @override
  Widget build(BuildContext context) => Obx(
    () => Transform(
      origin: Offset.zero,
      alignment: Alignment.center,
      transform: widget.controller.transform,
      child: widget.child,
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
