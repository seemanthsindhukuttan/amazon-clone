import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/colors.dart';
import 'core/utils.dart';
import 'layout/lobby_screen.dart';
import 'view/sgin_in or login/sgin_in_or_create.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Firebase.initializeApp();
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon',
      theme: ThemeData(
        primarySwatch: UiColors.primaryColor as MaterialColor,
        scaffoldBackgroundColor: UiColors.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: UiColors.primaryColor,
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Scaffold(body: AppUtils.appCircularProgressIndicator),
            );
          } else if (snapshot.hasData) {
            return const LayoutScreen();
          } else {
            return const SginInOrCreate();
          }
        },
      ),
    );
  }
}
