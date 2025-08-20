import 'package:d_reg/data/db/isar_db_connection.dart';
import 'package:d_reg/theme/app_theme.dart';
import 'package:d_reg/views/screens/login_screen.dart';
import 'package:d_reg/views/screens/main_scaffold.dart';
import 'package:d_reg/views/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    // Initialize IsarService
  final isarService = IsarService();
  try {
    // open the isar db
    await isarService.openIsar();
  } catch (e) {
     debugPrint('Failed to initialize Isar: $e');
    // show an error screen or fallback
  }

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  // check if teacher already registered
  final hasTeacher = await isarService.hasTeacher();

  runApp(MyApp(
    hasTeacher: hasTeacher,
    isarService: isarService,
  ));
}

class MyApp extends StatelessWidget {

  final bool hasTeacher;
  final IsarService isarService;

  const MyApp({super.key, 
    required this.hasTeacher,
    required this.isarService,
  });

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
        //onUnknownRoute: (RouteSettings settings){
        //    return MaterialPageRoute(
        //       builder: (context)=> NotFoundScreen(routeName: settings.name),
        //    );
        // },
        initialRoute: hasTeacher ? '/login' : '/register',
        routes: {
          '/register': (context) => const RegistrationScreen(),
          '/login': (context) => const LoginScreen(),
          '/main': (context) => const MainScaffold(),
        },
      ),
    );
  }
}

