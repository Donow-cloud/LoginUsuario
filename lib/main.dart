//Si escribes "mateapp" se creará la base del proyecto acá
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler_app/Providers/usuario_provider.dart';
import 'package:traveler_app/Screens/home_screen.dart';
import 'package:traveler_app/Screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => usuario_provider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {'login': (_) => LoginScreen(), 'home': (_) => HomeScreen()},
        initialRoute: 'login',
      ),
    );
  }
}
