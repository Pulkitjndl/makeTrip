import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Colors.black,
        scaffoldBackgroundColor: Color(0xFFF3F5F7)
      ),
    home: HomeScreen(),
    );
  }
}