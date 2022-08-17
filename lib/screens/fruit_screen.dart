import 'package:flutter/material.dart';
import '../model/Fruit.dart';

class FruitScreen extends StatelessWidget {

  final Fruit fruitItem;
  const FruitScreen(this.fruitItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(int.parse(fruitItem.color)),
          appBar: AppBar(
            backgroundColor: Color(int.parse(fruitItem.color)),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_rounded),
                color: Colors.white,
                onPressed: (){},)
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text(fruitItem.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),),
                    Center(
                      child: Hero(
                        tag: fruitItem.name,
                        child: Image(image: AssetImage('assets/fruits/''${fruitItem.image}'),height: MediaQuery.of(context).size.height * 0.5, width: MediaQuery.of(context).size.width * 0.8,)),),
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Text('Description', style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Text(fruitItem.longDescription, style: const TextStyle(color: Colors.white, fontSize: 15)),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  margin: const EdgeInsets.only(bottom: 0),
                  //color: Colors.grey,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 20,
                        left: 12,
                          child: RichText(
                            text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${fruitItem.price }' '.00',
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                                    ),
                                      TextSpan(
                                        text: '(${fruitItem.kg})',
                                      )
                                    ]
                            ),
                          ),

                      ),
                      Positioned(
                        bottom: 0,
                          right: 0,
                          child:
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18)),
                            ),
                            child: Center(
                              child: Text('Buy Now', textAlign: TextAlign.center,style: TextStyle(color: Color(int.parse(fruitItem.color)), fontWeight: FontWeight.bold, fontSize: 20),),
                            ),
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
