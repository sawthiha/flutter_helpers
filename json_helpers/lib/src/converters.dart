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

  /// const constructor
  const NullableColorConverter();

  @override
  Color? fromJson(int json) => json < 0 ? null
    : Color(json);

  @override
  int toJson(Color? object) => object == null ? -1: object.value;

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

  /// Const Constructor (Necessary for Annotation)
  const NullableSizeConverter();

  @override
  Size? fromJson(Map<String, dynamic> json)
    => json.containsKey('width') && json.containsKey('height') ?
      Size(
        json['width'], json['height']
      ): null;

  @override
  Map<String, dynamic> toJson(Size? object) => <String, dynamic>{
    if(object != null)
      ...{
        'width': object.width,
        'height': object.height,
      },
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

/// List of Duration Json Converter
class DurationListConverter extends JsonConverter<List<Duration>, List<int>>  {

  /// Const Constructor (Necessary for Annotation)
  const DurationListConverter();

  @override
  List<Duration> fromJson(List<int> json) => [
    for (var durJson in json)
    Duration(microseconds: durJson),
  ];

  @override
  List<int> toJson(List<Duration> object) => [
    for (var duration in object)
      duration.inMicroseconds,
  ];

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

/// Offset Json Converter
class OffsetConverter extends JsonConverter<Offset, List<double>>  {

  /// Const Constructor (Necessary for Annotation)
  const OffsetConverter();

  @override
  Offset fromJson(List<double> json) => Offset(json[0], json[1]);

  @override
  List<double> toJson(Offset object) => <double>[object.dx, object.dy];

}

/// Offset Json Converter
class NullableOffsetConverter extends JsonConverter<Offset?, List<double>>  {

  /// Const Constructor (Necessary for Annotation)
  const NullableOffsetConverter();

  @override
  Offset? fromJson(List<double> json)
    => json.isEmpty ? null
      : Offset(json[0], json[1]);

  @override
  List<double> toJson(Offset? object)
    => object != null ? <double>[object.dx, object.dy]
    : <double>[];

}

/// Offset Itreable Json Converter
class OffsetIterableConverter extends JsonConverter<Iterable<Offset>, Iterable<List<double>>>  {

  /// Const Constructor (Necessary for Annotation)
  const OffsetIterableConverter();

  @override
  Iterable<Offset> fromJson(Iterable<List<double>> json) => [
    for (var offsetJson in json)
      Offset(offsetJson[0], offsetJson[1])
  ];

  @override
  Iterable<List<double>> toJson(Iterable<Offset> object) => [
    for (var offset in object)
      <double>[offset.dx, offset.dy],
  ];

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

/// Paint Json Converter
class PaintConverter extends JsonConverter<Paint, Map<String, dynamic>>  {

  /// Const Constructor (Necessary for Annotation)
  const PaintConverter();

  @override
  Paint fromJson(Map<String, dynamic> json) => Paint().copyWith(
    color: const ColorConverter().fromJson(json['color']),
    strokeWidth: json['strokeWidth'],
    strokeCap: StrokeCap.values[json['strokeCap']],
    style: PaintingStyle.values[json['style']],
    strokeJoin: StrokeJoin.values[json['strokeCap']],
    blendMode: BlendMode.values[json['blendMode']],
    isAntiAlias: json['isAntiAlias'],
  );

  @override
  Map<String, dynamic> toJson(Paint object) => {
    'color': const ColorConverter().toJson(object.color),
    'strokeWidth': object.strokeWidth,
    'strokeCap': object.strokeCap.index,
    'style': object.style.index,
    'strokeJoin': object.strokeJoin.index,
    'blendMode': object.blendMode.index,
    'isAntiAlias': object.isAntiAlias,
  };

}

class TextPainterConverter extends JsonConverter<TextPainter, Map<String, dynamic>>  {

  const TextPainterConverter();

  @override
  TextPainter fromJson(Map<String, dynamic> json) => TextPainter().copyWith(
    textAlign: TextAlign.values[json['align']],
    textDirection: json.containsKey('direction') ? TextDirection.values[json['direction']]
      : null,
    textScaleFactor: json['scaleFactor'],
  );

  @override
  Map<String, dynamic> toJson(TextPainter object) => {
    'align': object.textAlign.index,
    if(object.textDirection != null)
      'direction': object.textDirection!.index,
    'scaleFactor': object.textScaleFactor,
  };

}

class TextDecorationConverter extends JsonConverter<TextDecoration, List<String>>  {

  const TextDecorationConverter();

  @override
  TextDecoration fromJson(List<String> json) => TextDecoration.combine(
    [
      if(json.contains('none'))
        TextDecoration.none,
      if(json.contains('overline'))
        TextDecoration.overline,
      if(json.contains('underline'))
        TextDecoration.underline,
      if(json.contains('lineThrough'))
        TextDecoration.lineThrough,
    ]
  );

  @override
  List<String> toJson(TextDecoration object) =>  [
    if(object.contains(TextDecoration.none))
      'none',
    if(object.contains(TextDecoration.overline))
      'overline',
    if(object.contains(TextDecoration.underline))
      'underline',
    if(object.contains(TextDecoration.lineThrough))
      'lineThrough',
  ];

}
