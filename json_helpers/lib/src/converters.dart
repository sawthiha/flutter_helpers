part of json_helpers;

/// Color Json Converter
class ColorConverter extends JsonConverter<Color, dynamic>  {

  static Color _defaultFallback() => Colors.transparent;

  final Color Function() fallback;

  /// Const Constructor (Necessary for Annotation)
  const ColorConverter(
    {
      this.fallback = _defaultFallback,
    }
  );

  @override
  Color fromJson(json)
    => json != null && json is int ? Color(json)
    : fallback();

  @override
  dynamic toJson(Color object) => object.value;

}

/// Nullable Color Json Converter
class NullableColorConverter extends JsonConverter<Color?, dynamic>  {

  /// const constructor
  const NullableColorConverter();

  @override
  Color? fromJson(json) => json != null && json is int && json < 0 ? null
    : Color(json);

  @override
  dynamic toJson(Color? object) => object == null ? -1: object.value;

}

class ColorListConverter extends JsonConverter<List<Color>, dynamic>  {

  static const colorConverter = ColorConverter();

  const ColorListConverter();

  @override
  List<Color> fromJson(json) => [
    if(json != null)
      for(var color in json)
        colorConverter.fromJson(color),
  ];

  @override
  toJson(List<Color> object) => [
    for(var color in object)
      colorConverter.toJson(color),
  ];

}

/// Size Json Converter
class SizeConverter extends JsonConverter<Size, dynamic>  {

  static bool _checkIfValidJson(json) => json != null && json is Map && json.containsKey('width') && json.containsKey('height');
  
  static Size _defaultFallback() => Size.zero;

  final Size Function() fallback;

  /// Const Constructor (Necessary for Annotation)
  const SizeConverter({
    this.fallback = _defaultFallback,
  });

  @override
  Size fromJson(dynamic json) =>
    _checkIfValidJson(json) ? Size(
      json['width'], json['height']
    ): fallback();

  @override
  dynamic toJson(Size object) => {
    'width': object.width,
    'height': object.height,
  };

}

/// Nullable Size Json Converter
class NullableSizeConverter extends JsonConverter<Size?, dynamic>  {

  /// Const Constructor (Necessary for Annotation)
  const NullableSizeConverter();

  @override
  Size? fromJson(dynamic json)
    => SizeConverter._checkIfValidJson(json) ?
      Size(
        json['width'], json['height']
      ): null;

  @override
  dynamic toJson(Size? object) => <String, dynamic>{
    if(object != null)
      ...{
        'width': object.width,
        'height': object.height,
      },
  };

}

/// Duration Json Converter
class DurationConverter extends JsonConverter<Duration, dynamic>  {

  static Duration _defaultFallback() => Duration.zero;

  final Duration Function() fallback;

  /// Const Constructor (Necessary for Annotation)
  const DurationConverter({
    this.fallback = _defaultFallback,
  });

  @override
  Duration fromJson(json) => json != null && json is int ? Duration(microseconds: json): fallback.call();

  @override
  int toJson(Duration object) => object.inMicroseconds;

}

/// List of Duration Json Converter
class DurationListConverter extends JsonConverter<List<Duration>, dynamic>  {

  static List<Duration> _defaultFallback() => [];
  final List<Duration> Function() fallback;
  /// Const Constructor (Necessary for Annotation)
  const DurationListConverter({
    this.fallback = _defaultFallback,
  });

  @override
  List<Duration> fromJson(dynamic json) => json == null || json is! Iterable ? fallback(): [
    for (var durJson in json)
      Duration(microseconds: durJson),
  ];

  @override
  dynamic toJson(List<Duration> object) => [
    for (var duration in object)
      duration.inMicroseconds,
  ];

}

/// DateTime Json Converter
class DateTimeConverter extends JsonConverter<DateTime, dynamic>  {

  static DateTime _defaultFallback() => DateTime.now();
  final DateTime Function() fallback;
  /// Const Constructor (Necessary for Annotation)
  const DateTimeConverter({
    this.fallback = _defaultFallback,
  });

  @override
  DateTime fromJson(json) {
    try {
      return DateTime.parse(json);
    } catch (e) {
      return fallback();
    }
  }

  @override
  toJson(DateTime object) => object.toIso8601String();
  
}

/// Matrix4 Json Converter
class Matrix4Converter extends JsonConverter<Matrix4, dynamic>  {

  static Matrix4 _defaultFallback() => Matrix4.identity();
  final Matrix4 Function() fallback;

  /// Const Constructor (Necessary for Annotation)
  const Matrix4Converter({
    this.fallback = _defaultFallback,
  });

  @override
  Matrix4 fromJson(dynamic json)
    => Matrix4.fromList(json.cast<double>().toList());

  @override
  dynamic toJson(Matrix4 object) => object.storage;

}

class NullableMatrix4Converter extends JsonConverter<Matrix4?, dynamic>  {

  static const doubleListConverter = NullableDoubleListConverter();

  const NullableMatrix4Converter();

  @override
  Matrix4? fromJson(json)  {
    final buffer = doubleListConverter.fromJson(json);
    return buffer != null ? Matrix4.fromList(buffer): null;
  }

  @override
  toJson(Matrix4? object) => doubleListConverter.toJson(object?.storage);

}

/// Offset Json Converter
class OffsetConverter extends JsonConverter<Offset, dynamic>  {

  /// Const Constructor (Necessary for Annotation)
  const OffsetConverter();

  @override
  Offset fromJson(dynamic json) => Offset(json[0], json[1]);

  @override
  dynamic toJson(Offset object) => <double>[object.dx, object.dy];

}

/// Offset Json Converter
class NullableOffsetConverter extends JsonConverter<Offset?, dynamic>  {

  /// Const Constructor (Necessary for Annotation)
  const NullableOffsetConverter();

  @override
  Offset? fromJson(dynamic json)
    => json.isEmpty ? null
      : Offset(json[0], json[1]);

  @override
  dynamic toJson(Offset? object)
    => object != null ? <double>[object.dx, object.dy]
    : <double>[];

}

/// Offset Itreable Json Converter
class OffsetIterableConverter extends JsonConverter<Iterable<Offset>, dynamic>  {

  /// Const Constructor (Necessary for Annotation)
  const OffsetIterableConverter();

  @override
  Iterable<Offset> fromJson(dynamic json) => [
    for (var offsetJson in json)
      Offset(offsetJson[0], offsetJson[1])
  ];

  @override
  dynamic toJson(Iterable<Offset> object) => [
    for (var offset in object)
      <double>[offset.dx, offset.dy],
  ];

}

/// Offset List Json Converter
class OffsetListConverter extends JsonConverter<List<Offset>, dynamic>  {

  /// Const Constructor (Necessary for Annotation)
  const OffsetListConverter();

  @override
  List<Offset> fromJson(dynamic json) => [
    for (var offsetJson in json)
      Offset(offsetJson[0], offsetJson[1])
  ];

  @override
  dynamic toJson(List<Offset> object) => [
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
class PaintConverter extends JsonConverter<Paint, dynamic>  {

  /// Const Constructor (Necessary for Annotation)
  const PaintConverter();

  @override
  Paint fromJson(dynamic json) => Paint().copyWith(
    color: const ColorConverter().fromJson(json['color']),
    strokeWidth: json['strokeWidth'],
    strokeCap: StrokeCap.values[json['strokeCap']],
    style: PaintingStyle.values[json['style']],
    strokeJoin: StrokeJoin.values[json['strokeCap']],
    blendMode: BlendMode.values[json['blendMode']],
    isAntiAlias: json['isAntiAlias'],
  );

  @override
  dynamic toJson(Paint object) => {
    'color': const ColorConverter().toJson(object.color),
    'strokeWidth': object.strokeWidth,
    'strokeCap': object.strokeCap.index,
    'style': object.style.index,
    'strokeJoin': object.strokeJoin.index,
    'blendMode': object.blendMode.index,
    'isAntiAlias': object.isAntiAlias,
  };

}

/// Nullable Paint Json Converter
class NullablePaintConverter extends JsonConverter<Paint?, dynamic>  {

  final PaintConverter paintConverter;

  /// Const Constructor (Necessary for Annotation)
  const NullablePaintConverter({
    this.paintConverter = const PaintConverter(),
  });

  @override
  Paint? fromJson(dynamic json)
    => json.isNotEmpty ? paintConverter.fromJson(json): null;

  @override
  dynamic toJson(Paint? object)
    => object != null ? paintConverter.toJson(object)
    : <String, dynamic>{};

}

class TextPainterConverter extends JsonConverter<TextPainter, dynamic>  {

  const TextPainterConverter();

  @override
  TextPainter fromJson(dynamic json) => TextPainter().copyWith(
    textAlign: TextAlign.values[json['align']],
    textDirection: json.containsKey('direction') ? TextDirection.values[json['direction']]
      : null,
    textScaleFactor: json['scaleFactor'],
  );

  @override
  dynamic toJson(TextPainter object) => {
    'align': object.textAlign.index,
    if(object.textDirection != null)
      'direction': object.textDirection!.index,
    'scaleFactor': object.textScaleFactor,
  };

}

class TextDecorationConverter extends JsonConverter<TextDecoration, dynamic>  {

  const TextDecorationConverter();

  @override
  TextDecoration fromJson(dynamic json) => TextDecoration.combine(
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
  dynamic toJson(TextDecoration object) =>  [
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

class NullableFontWeightConverter extends JsonConverter<FontWeight?, int>  {

  const NullableFontWeightConverter();

  @override
  FontWeight? fromJson(int json) => json < 0 ? null
    : FontWeight.values[json];

  @override
  int toJson(FontWeight? object) => object?.index ?? -1;

}

class NullableFontStyleConverter extends JsonConverter<FontStyle?, int>  {

  const NullableFontStyleConverter();

  @override
  FontStyle? fromJson(int json) => json < 0 ? null
    : FontStyle.values[json];

  @override
  int toJson(FontStyle? object) => object?.index ?? -1;

}

class TextStyleConverter extends JsonConverter<TextStyle, dynamic>  {

  final NullablePaintConverter nullablePaintConverter;
  final NullableFontWeightConverter nullableFontWeightConverter;
  final NullableColorConverter nullableColorConverter;
  final NullableFontStyleConverter nullableFontStyleConverter;

  const TextStyleConverter(
    {
      this.nullablePaintConverter = const NullablePaintConverter(),
      this.nullableColorConverter = const NullableColorConverter(),
      this.nullableFontStyleConverter = const NullableFontStyleConverter(),
      this.nullableFontWeightConverter = const NullableFontWeightConverter(),
    }
  );

  @override
  TextStyle fromJson(dynamic json) => TextStyle(
    fontFamily: json['family'],
    fontSize: json['size'],
    fontWeight: nullableFontWeightConverter.fromJson(json['weight']),
    fontStyle: nullableFontStyleConverter.fromJson(json['style']),
    color: nullableColorConverter.fromJson(json['color']),
    backgroundColor: nullableColorConverter.fromJson(json['backgroundColor']),
    foreground: nullablePaintConverter.fromJson(json['foregroundPaint']),
    background: nullablePaintConverter.fromJson(json['backgroundPaint']),
    letterSpacing: json['letterSpacing'] ?? 0.0,
  );

  @override
  dynamic toJson(TextStyle object) => {
    'family': object.fontFamily,
    'size': object.fontSize,
    'weight': nullableFontWeightConverter.toJson(object.fontWeight),
    'style': nullableFontStyleConverter.toJson(object.fontStyle),
    'color': nullableColorConverter.toJson(object.color),
    'backgroundColor': nullableColorConverter.toJson(object.backgroundColor),
    'foregroundPaint': nullablePaintConverter.toJson(object.foreground),
    'backgroundPaint': nullablePaintConverter.toJson(object.background),
    'letterSpacing': object.letterSpacing ?? 0.0,
  };

}

/// BorderRadius to json converter
class BorderRadiusConverter extends JsonConverter<BorderRadius, dynamic>  {

  /// Radius Converter
  final RadiusConverter radiusConverter;

  /// Const Constructor for annotations
  const BorderRadiusConverter(
    {
      this.radiusConverter = const RadiusConverter(),
    }
  );

  @override
  BorderRadius fromJson(dynamic json) => BorderRadius.only(
    topLeft: radiusConverter.fromJson(json['topLeft']),
    topRight: radiusConverter.fromJson(json['topRight']),
    bottomLeft: radiusConverter.fromJson(json['bottomLeft']),
    bottomRight: radiusConverter.fromJson(json['bottomRight']),
  );

  @override
  dynamic toJson(BorderRadius object) => <String, dynamic>{
    'topLeft': radiusConverter.toJson(object.topLeft),
    'topRight': radiusConverter.toJson(object.topRight),
    'bottomLeft': radiusConverter.toJson(object.bottomLeft),
    'bottomRight': radiusConverter.toJson(object.bottomRight),
  };

}

/// BorderRadius to json converter
class NullableBorderRadiusConverter extends JsonConverter<BorderRadius?, dynamic>  {

  /// Radius Converter
  final BorderRadiusConverter radiusConverter;

  /// Const Constructor for annotations
  const NullableBorderRadiusConverter(
    {
      this.radiusConverter = const BorderRadiusConverter(),
    }
  );

  @override
  BorderRadius? fromJson(dynamic json) => json.isNotEmpty ? radiusConverter.fromJson(json): null;

  @override
  dynamic toJson(BorderRadius? object) => object != null ? radiusConverter.toJson(object): <String, dynamic>{};

}

/// Radius to Json converter
class RadiusConverter extends JsonConverter<Radius, dynamic>  {

  /// Const Constructor for annotations
  const RadiusConverter();

  @override
  Radius fromJson(dynamic json)
    => Radius.elliptical(json['x'], json['y']);

  @override
  dynamic toJson(Radius object) => <String, dynamic>{
    'x': object.x,
    'y': object.y,
  };

}

class RectConverter extends JsonConverter<Rect, dynamic>  {

  static const offsetConverter = OffsetConverter();

  const RectConverter();

  @override
  Rect fromJson(json) => Rect.fromCenter(
    center: offsetConverter.fromJson(json['center']),
    width: json['width'],
    height: json['height'],
  );

  @override
  toJson(Rect object) => {
    'center': offsetConverter.toJson(object.center),
    'width': object.width,
    'height': object.height,
  };

}

class RRectConverter extends JsonConverter<RRect, dynamic>  {

  static const radiusConverter = RadiusConverter();
  static const rectConverter = RectConverter();

  const RRectConverter();
  
  @override
  RRect fromJson(json) => RRect.fromRectAndCorners(
    rectConverter.fromJson(json['rect']),
    topLeft: radiusConverter.fromJson(json['tl']),
    topRight: radiusConverter.fromJson(json['tr']),
    bottomRight: radiusConverter.fromJson(json['br']),
    bottomLeft: radiusConverter.fromJson(json['bl']),
  );
  
  @override
  toJson(RRect object) => {
    'rect': rectConverter.toJson(object.outerRect),
    'tl': radiusConverter.toJson(object.tlRadius),
    'tr': radiusConverter.toJson(object.trRadius),
    'br': radiusConverter.toJson(object.brRadius),
    'bl': radiusConverter.toJson(object.blRadius),
  };

}

class BoxFitConverter extends JsonConverter<BoxFit, dynamic>  {

  const BoxFitConverter();

  @override
  BoxFit fromJson(json) => BoxFit.values[json];

  @override
  toJson(BoxFit object) => object.index;

}

class BlendModeConverter extends JsonConverter<BlendMode, dynamic>   {

  const BlendModeConverter();
  
  @override
  BlendMode fromJson(json) => BlendMode.values[json];
  
  @override
  toJson(BlendMode object) => object.index;

}

class NullableBlendModeConverter extends JsonConverter<BlendMode?, dynamic>   {

  static const blendModeConverter = BlendModeConverter();

  const NullableBlendModeConverter();
  
  @override
  BlendMode? fromJson(json) => json < 0 ? null: BlendMode.values[json];
  
  @override
  toJson(BlendMode? object) => object != null ? blendModeConverter.toJson(object): -1;

}

class AlignmentConverter extends JsonConverter<Alignment, dynamic>  {

  const AlignmentConverter();

  @override
  Alignment fromJson(json) => Alignment(json['x'], json['y']);

  @override
  toJson(Alignment object) => <String, dynamic>{
    'x': object.x,
    'y': object.y,
  };

}

class NullableAlignmentConverter extends JsonConverter<Alignment?, dynamic>  {

  static const converter = AlignmentConverter();

  const NullableAlignmentConverter();

  @override
  Alignment? fromJson(json) => json != null ? converter.fromJson(json): null;

  @override
  toJson(Alignment? object) => object != null ? converter.toJson(object) : null;

}

class BoxShapeConverter extends JsonConverter<BoxShape, dynamic>  {

  const BoxShapeConverter();

  @override
  BoxShape fromJson(json) => BoxShape.values[json];

  @override
  toJson(BoxShape object) => object.index;

}

class NullableBoxShapeConverter extends JsonConverter<BoxShape?, dynamic>  {

  static const boxShapeConverter = BoxShapeConverter();

  const NullableBoxShapeConverter();

  @override
  BoxShape? fromJson(json) => json >= 0 ? boxShapeConverter.fromJson(json): null;

  @override
  toJson(BoxShape? object) => object != null ? boxShapeConverter.toJson(object): -1;

}

class BorderStyleConverter extends JsonConverter<BorderStyle, dynamic>  {

  const BorderStyleConverter();
  
  @override
  BorderStyle fromJson(json) => BorderStyle.values[json];
  
  @override
  toJson(BorderStyle object) => object.index;

}

class BorderSideConverter extends JsonConverter<BorderSide, dynamic>  {

  static const colorConverter = ColorConverter();
  static const styleConverter = BorderStyleConverter();

  const BorderSideConverter();
  
  @override
  BorderSide fromJson(json) => BorderSide(
    color: colorConverter.fromJson(json['color']),
    width: json['width'],
    style: styleConverter.fromJson(json['style']),
    strokeAlign: json['strokeAlign'],
  );
  
  @override
  toJson(BorderSide object) => <String, dynamic> {
    'color': colorConverter.toJson(object.color),
    'width': object.width,
    'style': styleConverter.toJson(object.style),
    'strokeAlign': object.strokeAlign,
  };

}

class BorderConverter extends JsonConverter<Border, dynamic>  {

  static const sideConverter = BorderSideConverter();

  const BorderConverter();

  @override
  Border fromJson(json) => Border(
    top: sideConverter.fromJson(json['top']),
    right: sideConverter.fromJson(json['right']),
    bottom: sideConverter.fromJson(json['bottom']),
    left: sideConverter.fromJson(json['left']),
  );

  @override
  toJson(Border object) => <String, dynamic>  {
    'top': sideConverter.toJson(object.top),
    'right': sideConverter.toJson(object.right),
    'bottom': sideConverter.toJson(object.bottom),
    'left': sideConverter.toJson(object.left),
  };

}

class NullableBorderConverter extends JsonConverter<Border?, dynamic>  {

  static const borderConverter = BorderConverter();

  const NullableBorderConverter();

  @override
  Border? fromJson(json) => json.isNotEmpty ? borderConverter.fromJson(json): null;

  @override
  toJson(Border? object) => object != null ? borderConverter.toJson(object): <String, dynamic>{};

}

class BoxDecorationConverter extends JsonConverter<BoxDecoration, dynamic>  {

  static const colorConveter = NullableColorConverter();
  static const boxShapeConverter = BoxShapeConverter();
  static const blendModeConverter = NullableBlendModeConverter();
  static const borderRadiusConverter = NullableBorderRadiusConverter();
  static const borderConverter = NullableBorderConverter();

  const BoxDecorationConverter();

  @override
  BoxDecoration fromJson(json) => BoxDecoration(
    color: colorConveter.fromJson(json['color']),
    shape: boxShapeConverter.fromJson(json['shape']),
    backgroundBlendMode: blendModeConverter.fromJson(json['blendMode']),
    borderRadius: borderRadiusConverter.fromJson(json['borderRadius']),
    border: borderConverter.fromJson(json['border']),
  );

  @override
  toJson(BoxDecoration object) => {
    'color': colorConveter.toJson(object.color),
    'shape': boxShapeConverter.toJson(object.shape),
    'blendMode': blendModeConverter.toJson(object.backgroundBlendMode),
    'borderRadius': borderRadiusConverter.toJson(object.borderRadius?.resolve(null)),
    'border': borderConverter.toJson(object.border != null && object.border is Border ? object.border as Border: null),
  };

}

class NullableBoxDecorationConverter extends JsonConverter<BoxDecoration?, dynamic>  {

  static const converter = BoxDecorationConverter();

  const NullableBoxDecorationConverter();

  @override
  BoxDecoration? fromJson(json) => json.isNotEmpty ? converter.fromJson(json): null;

  @override
  toJson(BoxDecoration? object) => object != null ? converter.toJson(object): <String, dynamic>{ };

}

class TileModeConverter extends JsonConverter<TileMode, dynamic>  {

  const TileModeConverter();
  
  @override
  TileMode fromJson(json) => TileMode.values[json];
  
  @override
  toJson(TileMode object) => object.index;

}

class NullableTileModeConverter extends JsonConverter<TileMode?, dynamic>  {

  const NullableTileModeConverter();
  
  @override
  TileMode? fromJson(json) => json < 0 ? null: TileMode.values[json];
  
  @override
  toJson(TileMode? object) => object == null ? -1: object.index;

}

class NullableDoubleListConverter extends JsonConverter<List<double>?, dynamic>  {

  const NullableDoubleListConverter();

  @override
  List<double>? fromJson(json) => (json as Iterable<dynamic>?)?.cast<double>().toList();

  @override
  toJson(List<double>? object) => object;

}

class IntegerListConverter extends JsonConverter<List<int>, dynamic>  {

  const IntegerListConverter();
  
  @override
  List<int> fromJson(json) => json.cast<int>().toList();
  
  @override
  toJson(List<int> object) => object;

}

class NullableIntegerListConverter extends JsonConverter<List<int>?, dynamic>  {

  const NullableIntegerListConverter();
  
  @override
  List<int>? fromJson(json) => (json as Iterable<dynamic>?)?.cast<int>().toList();
  
  @override
  toJson(List<int>? object) => object;

}
