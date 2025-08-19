import 'package:d_reg/theme/app_theme.dart';
// import 'package:d_reg/views/screens/login_screen.dart';
// import 'package:d_reg/views/screens/history_screen.dart';
// import 'package:d_reg/views/screens/main_scaffold.dart';
// import 'package:d_reg/views/screens/studentlist_screen.dart';
// import 'package:d_reg/views/screens/rollcall_screen.dart';
import 'package:d_reg/views/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {


  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        // themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        //   onUnknownRoute: (RouteSettings settings){
        //     return MaterialPageRoute(
        //       builder: (context)=> NotFoundScreen(routeName: settings.name),
        //     );
        // },
        home: const RegistrationScreen(),
      ),
    );
  }
}

