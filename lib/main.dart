import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/controller/fun_provider.dart';
import 'package:simple_todo_app/demo_files/date_picking.dart';
import 'package:simple_todo_app/demo_files/demo_to_check.dart';
import 'package:simple_todo_app/firebase_options.dart';
import 'package:simple_todo_app/views/home_screen.dart';
import 'package:simple_todo_app/splash_screen.dart';
import 'package:simple_todo_app/demo_files/map_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FunProvider>(
          create: (context) {
          return FunProvider();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
