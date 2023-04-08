import 'dart:math' as math;

double calculateJaroWinklerDistance(
  String s1, String s2,
  {
    double threshold = 0.7,
    double jwCoef = 0.1,
  }
) {
  var matches = 0;
  var transpositions = 0;
  var prefix = 0;

  String max, min;
  if (s1.length > s2.length) {
    max = s1;
    min = s2;
  } else {
    max = s2;
    min = s1;
  }

  int range = math.max(max.length ~/ 2 - 1, 0);
  final matchIndexes = List<int>.filled(min.length, -1);
  final matchFlags = List<bool>.filled(max.length, false);

  for (var mi = 0; mi < min.length; mi++) {
    final c1 = min.codeUnitAt(mi);
    for (var xi = math.max(mi - range, 0), xn = math.min(mi + range + 1, max.length); xi < xn; xi++) {
      if (!matchFlags[xi] && c1 == max.codeUnitAt(xi)) {
        matchIndexes[mi] = xi;
        matchFlags[xi] = true;
        matches++;
        break;
      }
    }
  }

  final ms1 = List<int>.filled(matches, 0, growable: false);
  final ms2 = List<int>.filled(matches, 0, growable: false);

  for (var i = 0, si = 0; i < min.length; i++) {
    if (matchIndexes[i] != -1) {
      ms1[si] = min.codeUnitAt(i);
      si++;
    }
  }

  for (var i = 0, si = 0; i < max.length; i++) {
    if (matchFlags[i]) {
      ms2[si] = max.codeUnitAt(i);
      si++;
    }
  }

  for (var mi = 0; mi < ms1.length; mi++) {
    if (ms1[mi] != ms2[mi]) {
      transpositions++;
    }
  }

  for (var mi = 0; mi < min.length; mi++) {
    if (s1.codeUnitAt(mi) == s2.codeUnitAt(mi)) {
      prefix++;
    } else {
      break;
    }
  }

  final jaroSimilarity = matches > 0 ? ((matches / s1.length) + (matches / s2.length) + ((matches - transpositions) / matches)) / 3
    : 0.0;

  return jaroSimilarity > threshold ? jaroSimilarity + math.min(jwCoef, 1.0 / prefix) * prefix * (1 - jaroSimilarity)
    : jaroSimilarity;
}
