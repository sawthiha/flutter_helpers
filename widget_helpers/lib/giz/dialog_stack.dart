part of giz;

class DialogStackEntry extends GetxController  {

  final bool isAlwaysClosable;

  final RxBool _isDetached;
  bool get isDetached => _isDetached.value;
  set isDetached(bool isDetached)  {
    _isDetached.value = isDetached;
  }
  final Rx<Offset> _offset;
  Offset get offset => _offset.value;
  set offset(Offset offset)  {
    _offset.value = offset;
  }
  
  final Rx<Size> _size;
  Size get size => _size.value;
  set size(Size size)  {
    _size.value = size;
  }

  final Widget _widget;
  final EdgeInsets boundPadding;
  Widget _buildDialog(BoxConstraints constraints)  {
    if(isBounded)  {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          offset = Offset(
            offset.dx.clamp(boundPadding.left, constraints.maxWidth - size.width - boundPadding.right),
            offset.dy.clamp(boundPadding.top, constraints.maxHeight - size.height - boundPadding.right),
          );
          onBoundUpdate?.call(this);
        }
      );
    }
    return Positioned.fromRect(
      rect: offset & size,
      child: isDraggable ? DraggableDialogEntry(
        child: _widget,
        isAlwaysClosable: isAlwaysClosable,
        entry: this,
        onDragStart: onDragStart,
        onDragEnd: onDragEnd,
        onClose: onDialogClose,
      ):_widget,
    );
  }

  final bool isBounded;

  final void Function(DialogStackEntry entry)? onBoundUpdate;

  final bool isDraggable;
  final void Function(DialogStackEntry entry)? onDragStart;
  final void Function(DialogStackEntry entry)? onDragEnd;
  final void Function(DialogStackEntry entry)? onDialogClose;

  DialogStackEntry({
    Offset offset = Offset.zero,
    Size size = Size.zero,
    bool isDetached = false,
    required Widget widget,
    this.isAlwaysClosable = false,
    this.isBounded = true,
    this.onBoundUpdate,
    this.isDraggable = false,
    this.onDragStart,
    this.onDragEnd,
    this.onDialogClose,
    this.boundPadding = EdgeInsets.zero,
  }): _isDetached = isDetached.obs,
    _offset = offset.obs,
    _size = size.obs,
    _widget = widget;


}

class DialogStackController extends GetxController  {

  final _entries = RxMap<int, DialogStackEntry>();
  void registerEntry(int index, DialogStackEntry entry)  {
    _entries[index] = entry;
  }
  DialogStackEntry? getEntry(int index) => _entries[index];
  DialogStackEntry? deregisterEntry(int index)  => _entries.remove(index);
  void deregisterAllEntries()  {
    _entries.clear();
  }
  Iterable<DialogStackEntry> get entries => _entries.values.toList();
  bool containsKey(int idx) => _entries.containsKey(idx);

  void onOutOfBoundGesture(DialogStackEntry entry)  {
    _entries.removeWhere((key, value) => value == entry);
  }
  
}

class DialogStack extends StatelessWidget  {

  final DialogStackController controller;

  const DialogStack({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => Obx(
      () => Stack(
        children: [
          for(var i = 0; i < controller.entries.length; i++)
            ...[
              if(!controller.entries.elementAt(i).isDetached)
                GestureDetector(
                  onTapDown: (_) => controller.onOutOfBoundGesture(controller.entries.elementAt(i)),
                  onDoubleTapDown: (_) => controller.onOutOfBoundGesture(controller.entries.elementAt(i)),
                  onForcePressStart: (_) => controller.onOutOfBoundGesture(controller.entries.elementAt(i)),
                  onScaleStart: (_) => controller.onOutOfBoundGesture(controller.entries.elementAt(i)),
                  behavior: HitTestBehavior.translucent,
                  kSlop: 1.0,
                ),
              controller.entries.elementAt(i)._buildDialog(constraints),
            ],
        ],
      ),
    ),
  );

}

class DraggableDialogEntry extends StatelessWidget  {

  final Widget child;
  final Size draggableSize;
  final Size draggableArea;
  final DialogStackEntry entry;
  final bool isAlwaysClosable;
  final void Function(DialogStackEntry entry)? onClose;
  final void Function(DialogStackEntry entry)? onDragStart;
  final void Function(DialogStackEntry entry)? onDragEnd;

  const DraggableDialogEntry({super.key,
    required this.child,
    this.onClose,
    this.onDragStart,
    this.onDragEnd,
    this.isAlwaysClosable = false,
    this.draggableSize = const Size(56, 5),
    this.draggableArea = const Size(70, 44), required this.entry
  });

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      child,
      Align(
        alignment: Alignment.topCenter,
        child: DialogEntryDragger(
          entry: entry,
          size: draggableSize,
          touchArea: draggableArea,
          onDragStart: onDragStart,
          onDragEnd: onDragEnd,
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Obx(
            () => (!entry.isDetached && !isAlwaysClosable) ? Container()
              : InkWell(
                onTap: () => onClose?.call(entry),
                child: const Icon(Icons.close,
                  color: GizColors.primary,
                  size: 17,
                ),
              ),
          ),
        ),
      )
    ],
  );

}

class DialogEntryDragger extends StatelessWidget  {

  final DialogStackEntry entry;
  final Size size;
  final Size touchArea;
  final void Function(DialogStackEntry entry)? onDragStart;
  final void Function(DialogStackEntry entry)? onDragEnd;

  const DialogEntryDragger({super.key,
    required this.entry,
    this.size = const Size(56, 5),
    this.touchArea = const Size(70, 44),
    this.onDragStart, this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    kSlop: 0.0,
    behavior: HitTestBehavior.translucent,
    onPanStart: (details) {
      onDragStart?.call(entry);
    },
    onPanUpdate: (details)  {
      entry.offset += details.delta;
    },
    onPanEnd: (details) {
      onDragEnd?.call(entry);
      entry.isDetached = true;
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
              color: GizColors.primaryOpacity50,
              borderRadius: BorderRadius.all(Radius.circular(size.height))
            ),
          ),
        ),
      ),
    ),
  );

}
