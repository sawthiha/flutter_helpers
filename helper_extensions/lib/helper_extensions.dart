library helper_extensions;

import 'dart:ui';

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
    ..isAntiAlias = isAntiAlias ?? this.isAntiAlias;
}
