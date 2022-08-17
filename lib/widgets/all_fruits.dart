import 'package:flutter/material.dart';

import 'categories.dart';
import 'fruit_card.dart';

class AllFruits extends StatefulWidget {
  const AllFruits({Key? key}) : super(key: key);

  @override
  State<AllFruits> createState() => _AllFruitsState();
}

class _AllFruitsState extends State<AllFruits> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Categories(controller: controller),
       FruitCard(controller: controller,),
    ],);
  }




}
