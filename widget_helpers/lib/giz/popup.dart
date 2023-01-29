part of giz;

DialogStackEntry showPopupOnDialogStack({
  required Widget widget,
  required PopupMenuController? controller,
  required PopupMenuAlignment alignment,
  required Size size,
  required Offset offset,
  required DialogStackController dialogController,
  Color? color,
  BorderRadius borderRadius = BorderRadius.zero,
  BorderSide side = BorderSide.none,
  List<BoxShadow> shadows = const <BoxShadow>[],
  final double triangleBase = 10.0,
  final double triangleHeight = 15.0,
  bool isDraggable = false,
  bool isBounded = true,
  bool isDetached = false,
  bool isAlwaysClosable = false,
  EdgeInsets boundPadding = EdgeInsets.zero,
  void Function(DialogStackEntry)? onClose,
  void Function(DialogStackEntry)? onDragStart,
  void Function(DialogStackEntry)? onDragEnd,
  void Function(DialogStackEntry)? onBoundUpdate,
  int? index,
}) {
  final alignmentRx = Rx<PopupMenuAlignment>(alignment);
  final rect = controller?.calculateRect(alignment: alignmentRx.value, size: size, offset: offset, triangleHeight: 15);
  final popupOffsetRx = Rx<double>(controller?.calculateOffset(alignment: alignmentRx.value, rect: rect!) ?? 0.0);
  final entry = DialogStackEntry(
    isBounded: isBounded,
    isDetached: isDetached,
    isAlwaysClosable: isAlwaysClosable,
    boundPadding: boundPadding,
    isDraggable: isDraggable,
    offset: rect?.topLeft ?? offset,
    size: rect?.size ?? size,
    onBoundUpdate: (entry) {
      if(controller != null)  {
        popupOffsetRx.value = controller.calculateOffset(alignment: alignmentRx.value, rect: entry.offset & entry.size) ?? popupOffsetRx.value;
      }
      onBoundUpdate?.call(entry);
    },
    onDragEnd: onDragEnd,
    onDragStart: (entry) {
      alignmentRx.value = PopupMenuAlignment.none;
      onDragStart?.call(entry);
    },
    onDialogClose: (entry)  {
      dialogController.onOutOfBoundGesture(entry);
      onClose?.call(entry);
    },
    widget: Obx(
      () => PopupMenu(
        child: widget,
        offset: popupOffsetRx.value,
        alignment: alignmentRx.value,
        color: color,
        side: side,
        borderRadius: borderRadius,
        shadows: shadows,
        triangleBase: triangleBase,
        triangleHeight: triangleHeight,
      ),
    ),
  );
  dialogController.registerEntry(
    index ?? controller.hashCode,
    entry,
  );
  return entry;
}

enum PopupMenuAlignment
{
  top,
  bottom,
  left,
  right,
  none
}

extension PopupMenuAlignmentRect on PopupMenuAlignment {
  
  Rect toRect(Rect targetRect, Size size, Offset offset, double triangleHeight)  {
    Offset center;
    switch (this) {
      case PopupMenuAlignment.top:
        center = Offset(targetRect.center.dx, targetRect.top - (size.height / 2) - triangleHeight) + offset;
        break;
      case PopupMenuAlignment.bottom:
        center = Offset(targetRect.center.dx, targetRect.bottom + (size.height / 2) + triangleHeight) + offset;
        break;
      case PopupMenuAlignment.left:
        center = Offset(targetRect.left - (size.width / 2) - triangleHeight, targetRect.center.dy) + offset;
        break;
      default:
        center = Offset(targetRect.right + (size.width / 2) + triangleHeight, targetRect.center.dy) + offset;
    }
    return Rect.fromCenter(
      center: center,
      width: size.width,
      height: size.height,
    ).shift(offset);
  }

}

class PopupMenuController extends GetxController  {

  final targetKey = GlobalKey();

  final void Function(PopupMenuController)? onDetach;

  PopupMenuController({
    this.onDetach,
  });

  Rect get targetRect  {
    final box = targetKey.currentContext?.findRenderObject() as RenderBox?;
    final translation = box?.getTransformTo(null).getTranslation();
    final traslationOffset = Offset(translation?.x ?? 0.0, translation?.y ?? 0.0);
    return box?.paintBounds.shift(traslationOffset) ?? Rect.zero;
  }

  Rect calculateRect({
    required PopupMenuAlignment alignment,
    required Size size,
    required Offset offset,
    required double triangleHeight,
  }) => alignment.toRect(targetRect, size, offset, triangleHeight);

  double? calculateOffset({
    required PopupMenuAlignment alignment,
    required Rect rect,
  })  {
    switch(alignment)  {

      case PopupMenuAlignment.top:
      case PopupMenuAlignment.bottom:
        return (targetRect.bottomCenter.dx - rect.left) / rect.width;

      case PopupMenuAlignment.left:
      case PopupMenuAlignment.right:
        return (targetRect.centerLeft.dy - rect.top) / rect.height;

      default:
        return null;
    }
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
  final PopupMenuAlignment alignment;
  final Color? color;
  final List<BoxShadow> shadows;
  final BorderSide side;
  final BorderRadius borderRadius;
  final double offset;
  final double triangleBase;
  final double triangleHeight;

  const PopupMenu({super.key,
    required this.child,
    required this.alignment,
    required this.side,
    required this.borderRadius,
    required this.offset,
    required this.triangleBase,
    required this.triangleHeight,
    this.color,
    this.shadows = const <BoxShadow>[],
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: ShapeDecoration(
      color: color,
      shadows: shadows,
      shape: PopupMenuShape(
        alignment: alignment,
        borderRadius: borderRadius,
        offset: offset,
        side: side,
        triangleBase: triangleBase,
        triangleHeight: triangleHeight,
      ),
    ),
    child: child
  );

}

class PopupMenuShape extends ShapeBorder {

  final BorderRadius borderRadius;
  final BorderSide side;
  final double triangleBase;
  final double triangleHeight;
  final double offset;
  final PopupMenuAlignment alignment;
  
  const PopupMenuShape({
    required this.borderRadius,
    required this.side,
    required this.triangleBase,
    required this.triangleHeight,
    required this.offset,
    required this.alignment,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  Path _getPopupPath(RRect rect)  {
    final path = Path()
      ..moveTo(rect.right - rect.trRadiusX, rect.top)
      ..quadraticBezierTo(rect.right, rect.top, rect.right, rect.top + borderRadius.topRight.y);

    if(alignment == PopupMenuAlignment.left)  {
      final centerOffset = (rect.top + rect.height * offset).clamp(
        rect.top + rect.trRadiusY + triangleBase / 2,
        rect.bottom - rect.brRadiusY - triangleBase / 2,
      );
      final startOffset = centerOffset - triangleBase / 2;
      final endOffset = centerOffset + triangleBase / 2;
      path..lineTo(rect.right, startOffset)
        ..lineTo(rect.right + triangleHeight, centerOffset)
        ..lineTo(rect.right, endOffset);
    }

    path..lineTo(rect.right, rect.bottom - borderRadius.bottomRight.y)
      ..quadraticBezierTo(rect.right, rect.bottom, rect.right - borderRadius.bottomRight.x, rect.bottom);

    if(alignment == PopupMenuAlignment.top)  {
      final centerOffset = (rect.left + rect.width * offset).clamp(
        rect.left + rect.blRadiusX + triangleBase / 2,
        rect.right - rect.brRadiusX - triangleBase / 2,
      );
      final startOffset = centerOffset - triangleBase / 2;
      final endOffset = centerOffset + triangleBase / 2;
      path..lineTo(endOffset, rect.bottom)
        ..lineTo(centerOffset, rect.bottom + triangleHeight)
        ..lineTo(startOffset, rect.bottom);
    }

      path..lineTo(rect.left + borderRadius.bottomLeft.x, rect.bottom)
      ..quadraticBezierTo(rect.left, rect.bottom, rect.left, rect.bottom - borderRadius.bottomLeft.y);
    
    if(alignment == PopupMenuAlignment.right)  {
      final centerOffset = (rect.top + rect.height * offset).clamp(
        rect.top + rect.tlRadiusY + triangleBase / 2,
        rect.bottom - rect.blRadiusY - triangleBase / 2,
      );
      final startOffset = centerOffset - triangleBase / 2;
      final endOffset = centerOffset + triangleBase / 2;
      path..lineTo(rect.left, endOffset)
        ..lineTo(rect.left - triangleHeight, centerOffset)
        ..lineTo(rect.left, startOffset);
    }

    path..lineTo(rect.left, rect.top + borderRadius.topLeft.y)
      ..quadraticBezierTo(rect.left, rect.top, rect.left + borderRadius.topLeft.x, rect.top);

    if(alignment == PopupMenuAlignment.bottom)  {
      final centerOffset = (rect.left + rect.width * offset).clamp(
        rect.left + rect.tlRadiusX + triangleBase / 2,
        rect.right - rect.trRadiusX - triangleBase / 2,
      );
      final startOffset = centerOffset - triangleBase / 2;
      final endOffset = centerOffset + triangleBase / 2;
      path..lineTo(startOffset, rect.top)
        ..lineTo(centerOffset, rect.top - triangleHeight)
        ..lineTo(endOffset, rect.top);
    }

    path.close();

    return path;
  }

  @override
  Path getInnerPath(
    Rect rect, {
    TextDirection? textDirection,
  }) {
    return _getPopupPath(
      borderRadius.resolve(textDirection).toRRect(rect).deflate(side.strokeInset),
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPopupPath(
      borderRadius.resolve(textDirection).toRRect(rect).inflate(side.strokeOutset)
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection})  {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        if (side.width == 0.0) {
          final outerRRectPath = getOuterPath(rect, textDirection: textDirection);
          canvas.drawPath(outerRRectPath, side.toPaint());
        } else {
          final path = _getPopupPath(borderRadius.resolve(textDirection).toRRect(rect));
          final Paint paint = Paint()
            ..color = side.color
            ..style = PaintingStyle.stroke
            ..strokeWidth = side.width;
          // final RRect borderRect = borderRadius.resolve(textDirection).toRRect(rect);
          // final RRect inner = borderRect.deflate(side.strokeInset);
          // final RRect outer = borderRect.inflate(side.strokeOutset);
          // canvas.drawDRRect(outer, inner, paint);
          canvas.drawPath(path, paint);
        }
        break;
    }
  }

  @override
  ShapeBorder scale(double t) => PopupMenuShape(
    side: side.scale(t),
    borderRadius: borderRadius * t,
    triangleBase: triangleBase * t,
    triangleHeight: triangleHeight * t,
    offset: offset * t,
    alignment: alignment,
  );
}
