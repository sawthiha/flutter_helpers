part of widget_helpers;

class DialogWithTextFieldWrapper extends StatelessWidget  {

  final Widget child;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final TextStyle textStyle;
  final Color cursorColor;
  final Color barrierColor;
  final void Function(String)? onSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;

  const DialogWithTextFieldWrapper({Key? key,
    required this.child,
    this.textController,
    this.focusNode,
    this.textStyle = const TextStyle(
      fontSize: 21.0,
      color: const Color(0xfffafafa),
    ),
    this.cursorColor = const Color(0xfffafafa),
    this.barrierColor = const Color(0x66303030),
    this.onSubmitted,
    this.onTapOutside,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () async {
      final focusNode = this.focusNode ?? FocusNode();
      focusNode.requestFocus();
      await Get.dialog<String>(
        Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(
                builder: (context, constraints) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 21.0,
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: 44.0,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        controller: textController,
                        focusNode: focusNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: textStyle,
                        cursorColor: cursorColor,
                        textAlign: TextAlign.center,
                        onSubmitted: onSubmitted,
                        onTapOutside: onTapOutside,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        barrierDismissible: true,
        barrierColor: barrierColor,
      );
    },
    child: child,
  );

}
