part of 'widgets.dart';

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
          Overlay.of(context)!.insert(_overlayEntry);
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


