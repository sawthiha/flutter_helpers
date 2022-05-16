part of json_helpers;

/// Color Json Converter
class ColorConverter extends JsonConverter<Color, int>  {

  /// Const Constructor (Necessary for Annotation)
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;

}

/// Nullable Color Json Converter
class NullableColorConverter extends JsonConverter<Color?, int>  {

  static const colorConverter = ColorConverter();

  /// const constructor
  const NullableColorConverter();

  @override
  Color? fromJson(int json) => json < 0 ? null
    : colorConverter.fromJson(json);

  @override
  int toJson(Color? object) => object == null ? -1: colorConverter.toJson(object);

}

/// Size Json Converter
class SizeConverter extends JsonConverter<Size, Map<String, dynamic>>  {

  /// Const Constructor (Necessary for Annotation)
  const SizeConverter();

  @override
  Size fromJson(Map<String, dynamic> json) => Size(
    json['width'], json['height']
  );

  @override
  Map<String, dynamic> toJson(Size object) => {
    'width': object.width,
    'height': object.height,
  };

}

/// Nullable Size Json Converter
class NullableSizeConverter extends JsonConverter<Size?, Map<String, dynamic>>  {

  static const sizeConverter = SizeConverter();

  /// Const Constructor (Necessary for Annotation)
  const NullableSizeConverter();

  @override
  Size? fromJson(Map<String, dynamic> json)
    => json.containsKey('width') && json.containsKey('height') ? sizeConverter.fromJson(json)
      : null;

  @override
  Map<String, dynamic> toJson(Size? object) => <String, dynamic>{
    if(object != null)
    ...sizeConverter.toJson(object),
  };

}

/// Duration Json Converter
class DurationConverter extends JsonConverter<Duration, int>  {

  /// Const Constructor (Necessary for Annotation)
  const DurationConverter();

  @override
  Duration fromJson(int json) => Duration(microseconds: json);

  @override
  int toJson(Duration object) => object.inMicroseconds;

}

/// DateTime Json Converter
class DateTimeConverter extends JsonConverter<DateTime, String>  {

  /// Const Constructor (Necessary for Annotation)
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
  
}

/// Matrix4 Json Converter
class Matrix4Converter extends JsonConverter<Matrix4, List<double>>  {

  /// Const Constructor (Necessary for Annotation)
  const Matrix4Converter();

  @override
  Matrix4 fromJson(List<double> json)
    => Matrix4.fromList(json.toList());

  @override
  List<double> toJson(Matrix4 object) => object.storage;

}

/// StrokeCap Json Converter
class StrokeCapConverter extends JsonConverter<StrokeCap, int>  {

  /// Const Constructor (Necessary for Annotation)
  const StrokeCapConverter();

  @override
  StrokeCap fromJson(int json) => StrokeCap.values[json];

  @override
  int toJson(StrokeCap object) => object.index;

}

/// StrokeJoin Json Converter
class StrokeJoinConverter extends JsonConverter<StrokeJoin, int>  {

  /// Const Constructor (Necessary for Annotation)
  const StrokeJoinConverter();

  @override
  StrokeJoin fromJson(int json) => StrokeJoin.values[json];

  @override
  int toJson(StrokeJoin object) => object.index;

}

/// PaintingStyle Json Converter
class PaintingStyleConverter extends JsonConverter<PaintingStyle, int>  {

  /// Const Constructor (Necessary for Annotation)
  const PaintingStyleConverter();

  @override
  PaintingStyle fromJson(int json) => PaintingStyle.values[json];

  @override
  int toJson(PaintingStyle object) => object.index;

}

/// BlendMode Json Converter
class BlendModeConverter extends JsonConverter<BlendMode, int>  {

  /// Const Constructor (Necessary for Annotation)
  const BlendModeConverter();

  @override
  BlendMode fromJson(int json) => BlendMode.values[json];

  @override
  int toJson(BlendMode object) => object.index;

}

/// Offset Json Converter
class OffsetConverter extends JsonConverter<Offset, List<double>>  {

  /// Const Constructor (Necessary for Annotation)
  const OffsetConverter();

  @override
  Offset fromJson(List<double> json) => Offset(json[0], json[1]);

  @override
  List<double> toJson(Offset object) => <double>[object.dx, object.dy];

}

/// FontWeight Json Converter
class FontWeightConverter extends JsonConverter<FontWeight, int>  {

  /// Const Constructor (Necessary for Annotation)
  const FontWeightConverter();

  @override
  FontWeight fromJson(int json) => FontWeight.values[json];

  @override
  int toJson(FontWeight object) => object.index;

}

/// FontStyle Json Converter
class FontStyleConverter extends JsonConverter<FontStyle, int>  {

  /// Const Constructor (Necessary for Annotation)
  const FontStyleConverter();

  @override
  FontStyle fromJson(int json) => FontStyle.values[json];

  @override
  int toJson(FontStyle object) => object.index;

}

/// TextAlign Json Converter
class TextAlignConverter extends JsonConverter<TextAlign, int>  {

  /// Const Constructor (Necessary for Annotation)
  const TextAlignConverter();

  @override
  TextAlign fromJson(int json) => TextAlign.values[json];

  @override
  int toJson(TextAlign object) => object.index;

}

/// BoxFit Json Converter
class BoxFitConverter extends JsonConverter<BoxFit, int>  {

  /// Const Constructor (Necessary for Annotation)
  const BoxFitConverter();

  @override
  BoxFit fromJson(int json) => BoxFit.values[json];

  @override
  int toJson(BoxFit object) => object.index;

}

/// TextDirection Json Converter
class TextDirectionConverter extends JsonConverter<TextDirection, int>  {

  /// Const Constructor (Necessary for Annotation)
  const TextDirectionConverter();

  @override
  TextDirection fromJson(int json) => TextDirection.values[json];

  @override
  int toJson(TextDirection object) => object.index;

}

/// Paint Json Converter
class PaintConverter extends JsonConverter<Paint, Map<String, dynamic>>  {

  /// Const Constructor (Necessary for Annotation)
  const PaintConverter();

  @override
  Paint fromJson(Map<String, dynamic> json) => Paint().copyWith(
    color: const ColorConverter().fromJson(json['color']),
    strokeWidth: json['strokeWidth'],
    strokeCap: const StrokeCapConverter().fromJson(json['strokeCap']),
    style: const PaintingStyleConverter().fromJson(json['style']),
    strokeJoin: const StrokeJoinConverter().fromJson(json['strokeCap']),
    blendMode: const BlendModeConverter().fromJson(json['blendMode']),
    isAntiAlias: json['isAntiAlias'],
  );

  @override
  Map<String, dynamic> toJson(Paint object) => {
    'color': const ColorConverter().toJson(object.color),
    'strokeWidth': object.strokeWidth,
    'strokeCap': const StrokeCapConverter().toJson(object.strokeCap),
    'style': const PaintingStyleConverter().toJson(object.style),
    'strokeJoin': const StrokeJoinConverter().toJson(object.strokeJoin),
    'blendMode': const BlendModeConverter().toJson(object.blendMode),
    'isAntiAlias': object.isAntiAlias,
  };

}

class TextPainterConverter extends JsonConverter<TextPainter, Map<String, dynamic>>  {

  const TextPainterConverter();

  @override
  TextPainter fromJson(Map<String, dynamic> json) => TextPainter().copyWith(
    textAlign: const TextAlignConverter().fromJson(json['align']),
    textDirection: json.containsKey('direction') ? const TextDirectionConverter().fromJson(json['direction'])
      : null,
    textScaleFactor: json['scaleFactor'],
  );

  @override
  Map<String, dynamic> toJson(TextPainter object) => {
    'align': const TextAlignConverter().toJson(object.textAlign),
    if(object.textDirection != null)
      'direction': const TextDirectionConverter().toJson(object.textDirection!),
    'scaleFactor': object.textScaleFactor,
  };

}
