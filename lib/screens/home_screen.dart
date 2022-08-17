import 'package:flutter/material.dart';
import '../widgets/new_items.dart';
import '../widgets/all_fruits.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: const[
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text('All Fruits', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
          ),
          AllFruits(),
          NewItems()
        ],
      ),


    );
  }
}
