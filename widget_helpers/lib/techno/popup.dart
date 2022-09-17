part of techno;

enum PopupMenuAlignment
{
  top,
  bottom,
  left,
  right
}

extension PopupMenuAlignmentRect on PopupMenuAlignment {
  
  Rect toRect(Rect targetRect, Size size, Offset offset, double triangleHeight)  {
    Offset center;
    switch (this) {
      case PopupMenuAlignment.top:
        center = Offset(targetRect.center.dx, targetRect.top - (size.height / 2) - triangleHeight);
        break;
      case PopupMenuAlignment.bottom:
        center = Offset(targetRect.center.dx, targetRect.bottom + (size.height / 2) + triangleHeight);
        break;
      case PopupMenuAlignment.left:
        center = Offset(targetRect.left - (size.width / 2) - triangleHeight, targetRect.center.dy);
        break;
      default:
        center = Offset(targetRect.right + (size.width / 2) + triangleHeight, targetRect.center.dy);
    }
    return Rect.fromCenter(
      center: center + offset,
      width: size.width,
      height: size.height,
    );
  }

}

class PopupMenuController extends GetxController  {

  final targetKey = GlobalKey();

  final double arrowTriangleBase;
  final double arrowTriangleHeight;

  PopupMenuController({
    this.arrowTriangleBase = 15,
    this.arrowTriangleHeight = 10,
  });

  final Rx<RRect> _rect = RRect.zero.obs;
  RRect get rect => _rect.value;
  set rect(RRect rect)  {
    _rect.value = rect;
  }
  void translate(Offset offset)  {
    _rect.value = _rect.value.shift(offset);
    _isAttached.value = false;
  }
  final RxBool _isAttached = true.obs;
  bool get isAttached => _isAttached.value;

  Rect get targetRect  {
    final box = targetKey.currentContext?.findRenderObject() as RenderBox?;
    final translation = box?.getTransformTo(null).getTranslation();
    final traslationOffset = Offset(translation?.x ?? 0.0, translation?.y ?? 0.0);
    return box?.paintBounds.shift(traslationOffset) ?? Rect.zero;
  }

  WidgetBuilder getPopup(Widget child, {
    required Size size,
    required Offset offset,
    required Radius radius,
    PopupMenuAlignment alignment = PopupMenuAlignment.bottom,
    Color? color,
    List<BoxShadow> shadows = const <BoxShadow>[],
    bool isAttached = true,
  })  {
    rect = RRect.fromRectAndRadius(
      alignment.toRect(targetRect, size, offset, arrowTriangleHeight),
        radius
    );
    _isAttached.value = true;
    return (context) => PopupMenu(
      controller: this,
      child: child,
      color: color,
      shadows: shadows,
    );
  }
  WidgetBuilder getDraggablePopup(Widget child, {
    required Size size,
    required Offset offset,
    required Radius radius,
    Size draggableSize = const Size(56, 5),
    Size draggableArea = const Size(70, 44),
    PopupMenuAlignment alignment = PopupMenuAlignment.bottom,
    Color? color,
    bool isAttached = true,
    VoidCallback? onClose,
    List<BoxShadow> shadows = const <BoxShadow>[],
  })  {
    return getPopup(
      DraggablePopupMenu(
        controller: this,
        child: child,
        onClose: onClose,
        draggableSize: draggableSize,
        draggableArea: draggableArea,
      ),
      size: size,
      offset: offset,
      radius: radius,
      alignment: alignment,
      color: color,
      isAttached: isAttached,
      shadows: shadows,
    );
  }
  
}

class PopupMenuTarget extends StatelessWidget  {

  final PopupMenuController controller;
  final Widget child;

  const PopupMenuTarget({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) => Container(
    key: controller.targetKey,
    child: child,
  );

}

class PopupMenu extends StatelessWidget  {

  final Widget child;
  final PopupMenuController controller;
  final Color? color;
  final List<BoxShadow> shadows;

  const PopupMenu({super.key,
    required this.controller,
    required this.child,
    this.color,
    this.shadows = const <BoxShadow>[],
  });

  @override
  Widget build(BuildContext context) => Obx(
    () =>  Positioned.fromRect(
      rect: controller.rect.outerRect,
      child: Container(
        decoration: ShapeDecoration(
          color: color,
          shadows: shadows,
          shape: PopupMenuShape(controller, controller.isAttached)
        ),
        child: child
      ),
    ),
  );

}

/// I'm using [RoundedRectangleBorder] as my reference...
class PopupMenuShape extends ShapeBorder {

  final PopupMenuController controller;
  final bool isAttached;

  const PopupMenuShape(this.controller, this.isAttached);

  final BorderSide _side = BorderSide.none;
  final BorderRadiusGeometry _borderRadius = BorderRadius.zero;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_side.width);

  @override
  Path getInnerPath(
    Rect rect, {
    TextDirection? textDirection,
  }) {
    final Path path = Path();

    path.addRRect(
      _borderRadius.resolve(textDirection).toRRect(rect).deflate(_side.width),
    );

    return path;
  }

  @override
  Path getOuterPath(Rect _, {TextDirection? textDirection}) {
    Path path = Path();
    final rect = controller.rect;
    final target = controller.targetRect;
    path.addRRect(rect);
    if(rect.outerRect.overlaps(target) || !isAttached)  {
      return path;
    }

    double base = controller.arrowTriangleBase;
    double height = controller.arrowTriangleHeight;
    double dx1, dx2, dx3, dy1, dy2, dy3;

    if(target.center.dx < rect.left)  {
      // left
      dx1 = dx2 = rect.left;
      dx3 = dx1 - height;
      
      dy1 = (target.center.dy - base / 2).clamp(rect.top, rect.bottom - base);
      dy2 = dy1 + base;
      dy3 = dy1 + (base / 2);
    } else if(target.center.dx > rect.right)  {
      //right
      dx1 = dx2 = rect.right;
      dx3 = dx1 + height;

      dy1 = (target.center.dy - base / 2).clamp(rect.top, rect.bottom - base);
      dy2 = dy1 + base;
      dy3 = dy1 + (base / 2);
    } else if(target.center.dy < rect.top)  {
      // top
      dy1 = dy2 = rect.top;
      dy3 = dy1 - height;

      dx1 = (target.center.dx - base / 2).clamp(rect.left, rect.right - base);
      dx2 = dx1 + base;
      dx3 = dx1 + (base / 2);
    } else  {
      // bottom
      dy1 = dy2 = rect.bottom;
      dy3 = dy1 + height;

      dx1 = (target.center.dx - base / 2).clamp(rect.left, rect.right - base);
      dx2 = dx1 + base;
      dx3 = dx1 + (base / 2);
    }

    path.addPolygon([Offset(dx1, dy1), Offset(dx2, dy2), Offset(dx3, dy3)], true);
    
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => RoundedRectangleBorder(
    side: _side.scale(t),
    borderRadius: _borderRadius * t,
  );
}

class DraggablePopupMenu extends StatelessWidget  {

  final Widget child;
  final PopupMenuController controller;
  final Size draggableSize;
  final Size draggableArea;
  final VoidCallback? onClose;

  const DraggablePopupMenu({super.key,
    required this.controller,
    required this.child,
    this.onClose,
    this.draggableSize = const Size(56, 5),
    this.draggableArea = const Size(70, 44)
  });

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      child,
      Align(
        alignment: Alignment.topCenter,
        child: PopupMenuDragger(
          controller: controller,
          size: draggableSize,
          touchArea: draggableArea,
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Obx(
            () => controller.isAttached ? Container()
            : InkWell(
              onTap: onClose,
              child: const Icon(Icons.close,
                color: TechnoColors.primary,
                size: 17,
              ),
            ),
          ),
        ),
      )
    ],
  );

}

class PopupMenuDragger extends StatelessWidget  {

  final PopupMenuController controller;
  final Size size;
  final Size touchArea;

  const PopupMenuDragger({super.key,
    required this.controller,
    this.size = const Size(56, 5),
    this.touchArea = const Size(70, 44)
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    kSlop: 0.0,
    behavior: HitTestBehavior.translucent,
    onPanUpdate: (details)  {
      controller.translate(details.delta);
    },
    child: SizedBox.fromSize(
      size: touchArea,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: TechnoColors.primaryOpacity50,
              borderRadius: BorderRadius.all(Radius.circular(size.height))
            ),
          ),
        ),
      ),
    ),
  );

}
