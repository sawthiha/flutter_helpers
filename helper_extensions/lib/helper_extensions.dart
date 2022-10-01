library helper_extensions;

import 'dart:math';
import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

extension PaintExtension on Paint  {
  Paint copyWith(
    {
      Color? color,
      double? strokeWidth,
      StrokeCap? strokeCap,
      StrokeJoin? strokeJoin,
      PaintingStyle? style,
      MaskFilter? maskFilter,
      Shader? shader,
      ColorFilter? colorFilter,
      BlendMode? blendMode,
      bool? isAntiAlias,
      double? strokeMiterLimit,
      FilterQuality? filterQuality,
      ImageFilter? imageFilter,
      bool? invertColors,
    }
  ) => Paint()
    ..color = color ?? this.color
    ..strokeWidth = strokeWidth ?? this.strokeWidth
    ..strokeCap = strokeCap ?? this.strokeCap
    ..style = style ?? this.style
    ..strokeJoin = strokeJoin ?? this.strokeJoin
    ..maskFilter = maskFilter ?? this.maskFilter
    ..shader = shader ?? this.shader
    ..colorFilter = colorFilter ?? this.colorFilter
    ..blendMode = blendMode ?? this.blendMode
    ..isAntiAlias = isAntiAlias ?? this.isAntiAlias
    ..strokeMiterLimit = strokeMiterLimit ?? this.strokeMiterLimit
    ..filterQuality = filterQuality ?? this.filterQuality
    ..imageFilter = imageFilter ?? this.imageFilter
    ..invertColors = invertColors ?? this.invertColors;
}

extension TextPainterExtension on TextPainter  {
  
  TextPainter copyWith({
    InlineSpan? text,
    TextAlign? textAlign,
    TextDirection? textDirection,
    double? textScaleFactor,
    int? maxLines,
    String? ellipsis,
    Locale? locale,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) => TextPainter(
    text: text ?? this.text,
    textAlign: textAlign ?? this.textAlign,
    textDirection: textDirection ?? this.textDirection,
    textScaleFactor: textScaleFactor ?? this.textScaleFactor,
    maxLines: maxLines ?? this.maxLines,
    ellipsis: ellipsis ?? this.ellipsis,
    locale: locale ?? this.locale,
    strutStyle: strutStyle ?? this.strutStyle,
    textWidthBasis: textWidthBasis ?? this.textWidthBasis,
    textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
  );

}

extension NumberExtension on num  {

  /// Trim Redundant zero decimals
  /// Source: https://stackoverflow.com/a/59963834/17673002
  num get trimRedundantZeroDecimals => this % 1 == 0 ? toInt(): this;

}

extension StringValidation on String  {

  /// Check if a string is ip v4 address
  bool get isIpV4 => RegExp(r"^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$").hasMatch(this);

}

extension OffsetPathExtension on Iterable<Offset>  {
  
  /// Get path from the offsets given that they are not relative
  Path get toPath  {
    final path = Path();
    if (isNotEmpty) {
      path.moveTo(first.dx, first.dy);
      for (var offset in skip(1)) {
        path.lineTo(offset.dx, offset.dy);
      }
    }
    return path;
  }

  /// Get bound containing the offset
  Rect get toBound => toPath.getBounds();

}

extension OffsetHelpers on Offset   {

  double angle(Offset origin, Offset offset)  {
    final p0 = offset - origin;
    final p1 = this - origin;
    final vec0 = vmath.Vector2.zero();
    final vec1 = vmath.Vector2(p0.dx, p0.dy);
    final vec2 = vmath.Vector2(p1.dx, p1.dy);
    return acos(vec1.dot(vec2) / (vec0.distanceTo(vec1) * vec0.distanceTo(vec2)));
  }

}
