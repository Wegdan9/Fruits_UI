import 'dart:async';

import 'package:flutter/material.dart';
import '../model/dummy_fruit_list.dart';

class Categories extends StatefulWidget {
  ScrollController controller;
   Categories({ required this.controller, Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;


  @override
  void initState() {
    widget.controller.addListener(() {
      _selectedCategoryIndex();
    });
    super.initState();
  }

  void _selectedCategoryIndex() {
    Timer( const Duration(milliseconds: 300), () {
      var newIndex = widget.controller.offset / 210;
      if (newIndex.round() != _selectedIndex) {
        setState(() {
          _selectedIndex - newIndex.round();
        });
      }
    },
    );
  }
  void _scrollToItem(index){
    double position = index * 210.0;
    widget.controller.animateTo(position, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: fruitItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.black,
                              width: 2,
                              style: _selectedIndex == index ? BorderStyle.solid : BorderStyle.none
                          )
                      )
                  ),
                  child: Text(fruitItems[index].name, style: TextStyle(color: _selectedIndex == index ? Colors.black : Colors.grey,fontSize: 30, letterSpacing: 1.2, fontWeight: FontWeight.bold),)),
            ),
            onTap: (){
              setState(() {
                _selectedIndex = index;
              });
              _scrollToItem(_selectedIndex);
            },
          );
        },),
    );
  }
}



