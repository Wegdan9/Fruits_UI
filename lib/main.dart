import 'package:flutter/material.dart';
import './screens/home_screen.dart';


main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{

   final MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
     <int, Color>{
      50:  Color(0xFFFFFFFF),
      100:  Color(0xFFFFFFFF),
      200:  Color(0xFFFFFFFF),
      300:  Color(0xFFFFFFFF),
      400:  Color(0xFFFFFFFF),
      500:  Color(0xFFFFFFFF),
      600:  Color(0xFFFFFFFF),
      700:  Color(0xFFFFFFFF),
      800:  Color(0xFFFFFFFF),
      900:  Color(0xFFFFFFFF),
    },
  );

  const MyApp({super.key});
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Fruits',
      theme: ThemeData(
        primarySwatch: white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: (){},
          ),
          actions: [
            IconButton(
            icon: const Icon(Icons.shopping_cart_rounded),
            onPressed: (){},),
          ],
          elevation: 0,
        ),
        body: const HomeScreen(),
      ),
    );
  }
}