import 'package:flutter/material.dart';
import 'package:fruit_ui/model/dummy_fruit_list.dart';
import 'package:fruit_ui/screens/fruit_screen.dart';

class NewItems extends StatelessWidget {
  const NewItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: const Text('New Items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: fruitItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500]!.withOpacity(0.5),
                            offset: const Offset(5, 5),
                            //spreadRadius: -20
                            blurRadius: 15
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage('assets/fruits/''${fruitItems[index].image}'), width: MediaQuery.of(context).size.width * 0.3, height: MediaQuery.of(context).size.height * 0.15,),
                          Text(fruitItems[index].name, style: const TextStyle(fontSize: 15),),
                          const SizedBox(height: 5,),
                          RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: '${fruitItems[index].price}''.00', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                                  TextSpan(text: '(''${fruitItems[index].kg}'')', style: TextStyle(fontSize: 12, color: Colors.grey[700]))
                                ],

                              )
                          )
                        ],
                      )
                    ),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FruitScreen(fruitItems[index]),)),
                  );
                },),
          ),
        ],
      ),
    );
  }
}
