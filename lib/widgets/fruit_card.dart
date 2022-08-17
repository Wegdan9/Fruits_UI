import 'package:flutter/material.dart';

import '../model/dummy_fruit_list.dart';
import '../screens/fruit_screen.dart';

class FruitCard extends StatelessWidget {

  final ScrollController controller;
  const FruitCard({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: fruitItems.length,
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.7,
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(int.parse(fruitItems[index].color)),
                boxShadow: [
                  BoxShadow(
                      color: Color(int.parse(fruitItems[index].color)).withOpacity(0.6),
                      offset: const Offset(10,10),
                      //spreadRadius: -20,
                      blurRadius: 10
                  )]
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(fruitItems[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                              text:  '${fruitItems[index].price}' '.00',
                              style: const TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                            text: '(''${fruitItems[index].kg}'')',
                          )
                        ],
                      ),)
                    ],
                  ),
                ),
                Hero(
                    tag: fruitItems[index].name,
                    child: Image(image: AssetImage('assets/fruits/''${fruitItems[index].image}'), width: MediaQuery.of(context).size.width * 0.6, height: MediaQuery.of(context).size.height * 0.2,)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Text(fruitItems[index].description, style: const TextStyle(fontSize: 14, color: Colors.white),),
                ),
                const SizedBox(height: 8,),
                ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      elevation: MaterialStateProperty.all(1)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FruitScreen(fruitItems[index]),));
                  },
                  child: const Text('Show Details', style: TextStyle(color: Colors.white),), )
              ],
            ),
          );
        },),
    );
  }
}
