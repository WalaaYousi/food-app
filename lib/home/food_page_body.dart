import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_app/widget/big_text.dart';
import 'package:food_app/widget/icon_text.dart';
import 'package:food_app/widget/small_text.dart';

class foodPagebody extends StatefulWidget {
  const foodPagebody({super.key});

  @override
  State<foodPagebody> createState() => _foodPagebodyState();
}

class _foodPagebodyState extends State<foodPagebody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currpageValue=0.0;
  double _scalefactor = 0.8;
  double _currhight =220;
  @override
  void initstate(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currpageValue=pageController.page!;
        
      });
    });
  }
  @override
  void despose(){

  }
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.redAccent,
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context,posision){
              return _buildPageItem(posision);

          }),
        ),
        new DotsIndicator(
  dotsCount: 5,
  
  position: _currpageValue,
  decorator: DotsDecorator(
    activeColor: Color(0xFF89dad0),
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
),

SizedBox(height: 50,),
Container(
  margin: EdgeInsets.only(left: 30),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
       bigText(text: 'popular'),
      SizedBox(width: 10,),
      Container( 
        margin: EdgeInsets.only(bottom: 3),
        child:
      bigText(text: '.',color: Colors.black26,),),
     
       SizedBox(width: 10,),
       Container( 
        child: smallText(text: 'food pairing',)),
        
    ],
  ),
),
Container(
  height: 900,
  child: ListView.builder(
    physics: NeverScrollableScrollPhysics(),
   // shrinkWrap: true,
  itemCount: 10,
  itemBuilder: (context,index){
    return 
     Container(
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white38,
              
              image: DecorationImage(image: AssetImage('images/foodd.avif'),
              fit: BoxFit.cover
              )
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
              child: Padding(padding: EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bigText(text: 'Nutritious fruit meal in china'),
                  SizedBox(height: 10,),
                  smallText(text: 'Wit chinese characteristics '),
                   SizedBox(height: 10,),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconWidget(icon: Icons.circle_sharp, text: 'Normal', iconcolor: Color.fromARGB(255, 247, 193, 111)),
                     iconWidget(icon: Icons.location_on, text: '1.7Km', iconcolor: Color(0xFF89dad0)),
                      iconWidget(icon: Icons.access_time_outlined, text: '30Min', iconcolor: Color(0xFFfcab88)),
                  ],
                 )
                ],
              ),
              ),
            ),
          )
        ],
      ),
    );

}

),
)
      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix=Matrix4.identity();
    if(index==_currpageValue.floor()){
     var currscale=1-(_currpageValue-index)*(1-_scalefactor);
      var currtrans= _currhight*(1-currscale)/2;
     matrix=Matrix4.diagonal3Values(1, currscale, 1)..setTranslationRaw(0,currtrans , 0);
    
    }
    else if(index==_currpageValue.floor()+1){
      var currscale = _scalefactor+(_currpageValue-index+1)*(1-_scalefactor);
      var currtrans= _currhight*(1-currscale)/2;
       matrix=Matrix4.diagonal3Values(1, currscale, 1)..setTranslationRaw(0,currtrans , 0);
       
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
    
        height: 220,
        margin: EdgeInsets.only(left: 10,right:10 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven? Color(0xFF69c5df):Color(0xFF9294cc),
          image: DecorationImage(image: AssetImage('images/foodd.avif'),
          fit: BoxFit.cover
          )
        ),
      ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
          height: 120,
          margin: EdgeInsets.only(left: 40,right:40,bottom: 30 ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
           boxShadow: [BoxShadow(
color: Color(0xFFe8e8e8),
blurRadius: 5.0,
offset: Offset(0, 5)
           ),
           BoxShadow(
            color: Colors.white,
            offset: Offset(-5, 0),
           ),
           BoxShadow(
            color: Colors.white,
            offset: Offset(5, 0),
           ),
           ]

           
          ),
          child: Container(
            padding: EdgeInsets.only(top: 15,left: 15,right: 15),
           
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 bigText(text: 'Chineese Side'),
                 SizedBox(height: 10,),
                 Row(
                  children: [
                    Wrap(
                      children: List.generate(5, (index) => Icon(
                        Icons.star,
                        color: Color(0xFF89dad0),
                        size: 15,
                      )),
                    ),
                    SizedBox(width: 10,),
                    smallText(text: '4.2'),
                     SizedBox(width: 10,),
                    smallText(text: '1278'),
                     SizedBox(width: 10,),
                    smallText(text: 'Comments'),
                  ],
                 ),
                 SizedBox(height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconWidget(icon: Icons.circle_sharp, text: 'Normal', iconcolor: Color.fromARGB(255, 247, 193, 111)),
                     iconWidget(icon: Icons.location_on, text: '1.7Km', iconcolor: Color(0xFF89dad0)),
                      iconWidget(icon: Icons.access_time_outlined, text: '30Min', iconcolor: Color(0xFFfcab88)),
                  ],
                 )
              ],
            ),
          ),
            ),
        ),
        ],
      ),
    );
  }
}