// import 'package:optimum/src/constant/color.dart';
// import 'package:flutter/material.dart';

// class ThemeClass {
//   static ThemeData themeData(bool isDarkTheme, BuildContext context) {
//     isDark = isDarkTheme;
//     return ThemeData(
//       useMaterial3: true,
//       fontFamily: "Nunito",
//       applyElevationOverlayColor: false,
//       brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//       colorSchemeSeed: ColorConst.gray,
//       appBarTheme: AppBarTheme(
//         elevation: 0.0,
//         backgroundColor:
//             isDarkTheme ? ColorConst.white : ColorConst.black,
//       ),
//       scaffoldBackgroundColor:
//           isDarkTheme ? ColorConst.white : ColorConst.black,
//       cardTheme: CardTheme.of(context).copyWith(
//         margin: EdgeInsets.zero,
//         color: isDarkTheme ? ColorConst.white : Colors.black,
//         surfaceTintColor: isDarkTheme ? ColorConst.white : Colors.black,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(4.0),
//         ),
//         elevation: 10.0,
//         shadowColor: isDarkTheme
//             ? Colors.transparent
//             : Colors.grey.shade50.withOpacity(0.25),
//       ),
//       checkboxTheme: const CheckboxThemeData(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(4.0),
//           ),
//         ),
//         materialTapTargetSize: MaterialTapTargetSize.padded,
//       ),
//       // dropdownMenuTheme: const DropdownMenuThemeData(
//       //   inputDecorationTheme: InputDecorationTheme(
//       //     enabledBorder: OutlineInputBorder(
//       //       borderSide: BorderSide(color: Colors.red)
//       //     )
//       //   )
//       // )
//     );
//   }
// }

// bool isDark = false;