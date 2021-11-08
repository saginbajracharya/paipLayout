import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paiplayout/src/widgets/BottomNavigation.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => 
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme                     : Themes.light,
      darkTheme                 : Themes.dark,
      home                      : BottomNavigation(),
    );
}

class Themes {
  static final light = ThemeData.light().copyWith(
    //main pages background Color
    scaffoldBackgroundColor: Color(0x10101C),     
    // status bar brightness
    brightness: Brightness.dark,
    // status bar color
    backgroundColor: Colors.white,
    
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Poppins',
    ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Poppins',
    ),
    accentTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Poppins',
    ),

    buttonColor: Colors.blue,
    snackBarTheme: SnackBarThemeData(
      actionTextColor: Colors.white,
      disabledActionTextColor: Colors.grey,
      contentTextStyle: TextStyle(fontSize: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.white,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    //main pages background Color
    scaffoldBackgroundColor: Color(0x10101C),
    // status bar brightness
    brightness: Brightness.dark,
    // status bar color
    backgroundColor: Colors.white,

    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: 'Poppins',
    ),
    primaryTextTheme: ThemeData.dark().textTheme.apply(
      fontFamily: 'Poppins',
    ),
    accentTextTheme: ThemeData.dark().textTheme.apply(
      fontFamily: 'Poppins',
    ),

    buttonColor: Colors.blue,
    snackBarTheme: SnackBarThemeData(
      actionTextColor: Colors.white,
      disabledActionTextColor: Colors.grey,
      contentTextStyle: TextStyle(fontSize: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.black,
    ),
  );
}
