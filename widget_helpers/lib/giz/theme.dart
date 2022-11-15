part of giz;

class GizThemes {

  static ThemeData get theme => ThemeData(
    primarySwatch: GizColors.darkPrimarySwatch,
    appBarTheme: appBarTheme,
    textButtonTheme: textButtonTheme,
    textTheme: textTheme,
    iconTheme: iconTheme,
    cardTheme: cardTheme,
    hoverColor: GizColors.accent.withAlpha(10),
    splashColor: GizColors.accent.withAlpha(10),
    highlightColor: GizColors.accent.withAlpha(10),
    focusColor: GizColors.accent.withAlpha(10),
    elevatedButtonTheme: elevatedButtonTheme,
    chipTheme: chipTheme,
    dialogBackgroundColor: GizColors.darkPrimary,
    inputDecorationTheme: inputDecorationTheme,
    textSelectionTheme: textSelectionTheme,
    sliderTheme: sliderTheme,
    dialogTheme: dialogTheme,
  );

  static final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(
        GizColors.darkPrimary,
      ),
    ),
  );

  static final chipTheme = ChipThemeData.fromDefaults(
    primaryColor: GizColors.darkPrimary,
    secondaryColor: GizColors.darkPrimary.withOpacity(0.12),
    labelStyle: const TextStyle(
      fontFamily: 'Rubik',
      fontSize:  13,
      color: GizColors.darkPrimary,
    ),
  );

  static const textTheme = TextTheme(
    labelLarge: TextStyle(
      color: GizColors.primary,
      fontSize: 17.0,
    ),
    labelMedium: TextStyle(
      color: GizColors.primary,
      fontSize: 13.0,
    ),
    labelSmall: TextStyle(
      color: GizColors.primary,
      fontSize: 11.0,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Halant',
      color: GizColors.primary,
      fontSize: 36,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Halant',
      color: GizColors.primary,
      fontSize: 21,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Halant',
      fontSize: 23,
      // fontWeight: FontWeight.bold
    ),
    titleMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 21,
      fontWeight: FontWeight.normal
    ),
    bodyLarge: TextStyle(
      fontSize: 17,
      color: GizColors.primary,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      color: GizColors.primary,
    ),
    bodySmall: TextStyle(
      fontSize: 11,
      color: GizColors.primary,
    ),
  );

  static const iconTheme = IconThemeData(
    color: GizColors.tint,
    size: 36,
  );

  static final AppBarTheme appBarTheme = const AppBarTheme().copyWith(
    color: GizColors.darkPrimary,
  );

  static final cardTheme = CardTheme(
    elevation: 4.0,
    color: GizColors.darkPrimary,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(21.0)
    ),
  );

  static final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) => GizColors.accent),
      foregroundColor: MaterialStateProperty.resolveWith((states) => GizColors.primary),
    ),
  );

  static InputDecorationTheme get inputDecorationTheme {
    const border = UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      borderSide: BorderSide(
        color: GizColors.primary,
        width: 3.0,
      ),
    );
    final focusBorder = border.copyWith(
      borderSide: const BorderSide(
        color: GizColors.accent,
      ),
    );
    final errorBorder = border.copyWith(
      borderSide: const BorderSide(
        color: GizColors.warning,
      ),
    );
    return InputDecorationTheme(
      errorStyle: textTheme.bodySmall?.copyWith(
        color: GizColors.warning,
        fontSize: 21.0,
        height: 0.03,
      ),
      contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
      border: border,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      focusedBorder: focusBorder,
      enabledBorder: border,
      disabledBorder: border,
      labelStyle: textTheme.labelLarge,
    );
  }

  static const textSelectionTheme = TextSelectionThemeData(
    cursorColor: GizColors.accent,
    selectionHandleColor: GizColors.accent,
    selectionColor: GizColors.tint,
  );
  static const darkTextSelectionTheme = TextSelectionThemeData(
    cursorColor: GizColors.primary,
    selectionHandleColor: GizColors.primary,
    selectionColor: GizColors.primaryOpacity50,
  );

  static const sliderTheme = SliderThemeData(
    activeTrackColor: GizColors.accent,
    inactiveTrackColor: GizColors.darkPrimaryOpacity50,
    thumbColor: GizColors.primary,
  );

  static const dialogTheme = DialogTheme();

}

abstract class GizColors  {

  static const Color primary = Color(0xfffafafa);
  static const Color primaryOpacity0 = Color(0x00fafafa);
  static const Color primaryOpacity10 = Color(0x19fafafa);
  static const Color primaryOpacity20 = Color(0x33fafafa);
  static const Color primaryOpacity30 = Color(0x4Cfafafa);
  static const Color primaryOpacity40 = Color(0x66fafafa);
  static const Color primaryOpacity50 = Color(0x7Ffafafa);
  static const Color primaryOpacity60 = Color(0x99fafafa);
  static const Color primaryOpacity70 = Color(0xB2fafafa);
  static const Color primaryOpacity80 = Color(0xCCfafafa);
  static const Color primaryOpacity90 = Color(0xE5fafafa);
  static const Color primaryOpacity100 = Color(0xFFfafafa);
  static final primarySwatch = createPrimarySwatch(primary);

  static const Color darkPrimary = Color(0xff303030);
  static const Color darkPrimaryOpacity0 = Color(0x00303030);
  static const Color darkPrimaryOpacity10 = Color(0x19303030);
  static const Color darkPrimaryOpacity20 = Color(0x33303030);
  static const Color darkPrimaryOpacity30 = Color(0x4C303030);
  static const Color darkPrimaryOpacity40 = Color(0x66303030);
  static const Color darkPrimaryOpacity50 = Color(0x7F303030);
  static const Color darkPrimaryOpacity60 = Color(0x99303030);
  static const Color darkPrimaryOpacity70 = Color(0xB2303030);
  static const Color darkPrimaryOpacity80 = Color(0xCC303030);
  static const Color darkPrimaryOpacity90 = Color(0xE5303030);
  static const Color darkPrimaryOpacity100 = Color(0xFF303030);
  static final darkPrimarySwatch = createPrimarySwatch(darkPrimary);

  static const Color accent = Color(0xff0094ff);
  static const Color accentOpacity0 = Color(0x000094ff);
  static const Color accentOpacity10 = Color(0x190094ff);
  static const Color accentOpacity20 = Color(0x330094ff);
  static const Color accentOpacity30 = Color(0x4C0094ff);
  static const Color accentOpacity40 = Color(0x660094ff);
  static const Color accentOpacity50 = Color(0x7F0094ff);
  static const Color accentOpacity60 = Color(0x990094ff);
  static const Color accentOpacity70 = Color(0xB20094ff);
  static const Color accentOpacity80 = Color(0xCC0094ff);
  static const Color accentOpacity90 = Color(0xE50094ff);
  static const Color accentOpacity100 = Color(0xFF0094ff);
  static final accentSwatch = createPrimarySwatch(accent);

  static const Color tint = Color(0xff60656f);
  static const Color primaryTint = Color(0xfff0f0f0);

  static const Color warning = Color(0xffcc3300);
  static const Color warningOpacity0 = Color(0x00cc3300);
  static const Color warningOpacity10 = Color(0x19cc3300);
  static const Color warningOpacity20 = Color(0x33cc3300);
  static const Color warningOpacity30 = Color(0x4Ccc3300);
  static const Color warningOpacity40 = Color(0x66cc3300);
  static const Color warningOpacity50 = Color(0x7Fcc3300);
  static const Color warningOpacity60 = Color(0x99cc3300);
  static const Color warningOpacity70 = Color(0xB2cc3300);
  static const Color warningOpacity80 = Color(0xCCcc3300);
  static const Color warningOpacity90 = Color(0xE5cc3300);
  static const Color warningOpacity100 = Color(0xFFcc3300);
  static final warningSwatch = createPrimarySwatch(warning);

  static const Color appleChrome = Color(0xffD5D5D7);
  static const Color androidGreen = Color(0xff7CB342);
  static const Color windowsBlue = Color(0xff14B0F0);

}

MaterialColor createPrimarySwatch(Color color) {
  const strengths = <double>[
    0.05,
    0.1,
    0.2,
    0.3,
    0.4,
    0.5,
    0.6,
    0.7,
    0.8,
    0.9,
  ];

  final hslColor = (
    color == Colors.black
    ? HSLColor.fromColor(color).withSaturation(0)
    : HSLColor.fromColor(color)
  );
  final Map<int, Color> swatch = <int, Color>{
    for (var strength in strengths)
      // Stength
      (strength * 1000).round():
      // Color
      hslColor.withLightness(1 - strength).toColor(),
  };
  return MaterialColor(color.value, swatch);
}
