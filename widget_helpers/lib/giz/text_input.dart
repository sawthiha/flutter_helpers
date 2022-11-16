part of giz;

class TextBox extends StatefulWidget  {

  final int? minLines;
  final int? maxLines;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const TextBox({super.key,
    required this.initialValue,
    required this.onChanged,
    this.minLines,
    this.maxLines,
  });

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {

  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) => TextField(
    minLines: widget.minLines,
    maxLines: widget.maxLines,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
        borderSide: const BorderSide(
          width: 1,
          color: GizColors.primaryOpacity50,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
        borderSide: const BorderSide(
          width: 1,
          color: GizColors.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
        borderSide: const BorderSide(
          width: 1,
          color: GizColors.warning,
        ),
      ),
    ),
    style: Theme.of(context).textTheme.bodyMedium,
    controller: controller,
    onChanged: widget.onChanged,
  );
}