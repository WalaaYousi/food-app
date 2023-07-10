import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_app/home/food_page_body.dart';
import 'package:food_app/widget/big_text.dart';
import 'package:food_app/widget/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
      child: Container(
        margin: EdgeInsets.only(top: 45,bottom: 15),
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                bigText(text: 'Saudi Arabia',color: Color(0xFF89dad0),),
                  Row(children: [
                    smallText(text: 'Riyadh',color: Color(0xFF332d2b),),
                    Icon(Icons.arrow_drop_down_rounded)
                  ],)
              ],
            ),
            Center(
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF89dad0)
                ),
                child: Icon(Icons.search,
                color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    ),
   Expanded(child: SingleChildScrollView(
    child:  foodPagebody(),
   )
   
   )
        ],
      )
 

    );
  }
}