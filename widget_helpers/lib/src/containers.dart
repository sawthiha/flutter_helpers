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

  final _rotation = vmath.Vector3(0.0, 0.0, 0.0).obs;
  double get rotationX => _rotation.value.storage[0];
  set rotationX(double rotation)  {
    _rotation.value = _rotation.value.clone()
      ..storage[0] = rotation;
    _updateRotation();
  }
  double get rotationY => _rotation.value.storage[1];
  set rotationY(double rotation)  {
    _rotation.value = _rotation.value.clone()
      ..storage[1] = rotation;
    _updateRotation();
  }
  double get rotationZ => _rotation.value.storage[2];
  set rotationZ(double rotation)  {
    _rotation.value = _rotation.value.clone()
      ..storage[2] = rotation;
    _updateRotation();
  }
  void setRotation(double x, double y, double z)  {
    _rotation.value = _rotation.value.clone()
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
