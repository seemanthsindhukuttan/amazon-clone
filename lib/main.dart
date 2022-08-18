import 'package:amazon_clone/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'view/sgin_in or login/sgin_in_or_create.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: UiColors.backgroundColor,
          systemNavigationBarColor: UiColors.backgroundColor,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: SginInOrCreate(),
      ),
    );
  }
}
