import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/constants.dart';
import 'helpers/methods.dart';
import 'pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print(const bool.fromEnvironment('isLelaki'));
  print(EnvironmentHandler.fileName);

  await dotenv.load(fileName: EnvironmentHandler.fileName);

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIza*****',
      authDomain: '*****.firebaseapp.com',
      projectId: '*****',
      storageBucket: '*****.appspot.com',
      messagingSenderId: '*****',
      appId: EnvironmentHandler.appId,
    ),
  );
  runApp(const KadKahwinApp());
}

class KadKahwinApp extends StatelessWidget {
  const KadKahwinApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(EnvironmentHandler.side);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: EnvironmentHandler.side == 'lelaki'
              ? 'Kad Kahwin Shafiq ♥ Iffah'
              : 'Kad Kahwin Iffah ♥ Shafiq',
          theme: ThemeData(
            primarySwatch: ColorsConstant.mainColorWithSwatch,
            textTheme: GoogleFonts.alluraTextTheme(),
          ),
          home: const AppHomePage(),
        );
      },
    );
  }
}
