import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/wrapper.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR2empnY2V1emVnY3N4cGplaG53Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQwMjYwMTMsImV4cCI6MjAyOTYwMjAxM30.k63D5xHNVeIM9oSMnCwrpV4XZmJHrJFIsQ_Ocx9nYn4',
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const TimberrApp());
}

class TimberrApp extends StatelessWidget {
  const TimberrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: "NunitoSans",
        appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: kOffBlack),
        ),
      ),
      home: const Wrapper(),
    );
  }
}
