import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/animations/fadeAnimation.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        elevation: 0,
        //brightness: Brightness.light,
        leading: Icon(null),
        actions: <Widget> [
          IconButton(
              onPressed:(){},
            icon:Icon(Icons.shopping_basket, color: Colors.grey[800],)
            ,)
        ],
      ),

      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Text("Food Delivery",style: TextStyle(
                        color: Colors.grey[80],
                        fontWeight: FontWeight.bold,
                        fontSize: 30, ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget> [
                            FadeAnimation(delay: 1, child:makecategory(isActive: true, title: "Pizza"),),
                            FadeAnimation(delay: 1.3,child:  makecategory(isActive: false, title: "Burger")),
                            FadeAnimation(delay: 1.4,child:  makecategory(isActive: false, title: "Salad")),
                            FadeAnimation(delay: 1.5,child:  makecategory(isActive: false, title: "Kebab")),
                            FadeAnimation(delay: 1.6,child:  makecategory(isActive: false, title: "Pizza")),

                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
              ),

              FadeAnimation(delay: 1 , child: Padding(
                  padding: EdgeInsets.all(20),
                  child:  Text("Free Delivery", style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget> [
                          FadeAnimation(delay: 1.4,child:  makeItem( image: 'lib/images/one.jpg'),),
                          FadeAnimation(delay: 1.5,child:  makeItem( image: 'lib/images/two.jpg'),),
                          FadeAnimation(delay: 1.6,child:  makeItem( image: 'lib/images/three.jpg'),),
                        ],
                      ),
                  ),
               ),
              SizedBox(height: 30,)
            ],
          )
       )
    );
  }

  Widget makecategory({isActive, title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),

        child: Align(
          child: Text(title, style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[600],
            fontSize: 18,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w300,
          ),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image}) {
    return AspectRatio(
        aspectRatio: 1 / 1.3,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                  stops: [0.2 , 0.9],
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.3),
                  ]
              )
            ),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.favorite, color: Colors.white,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget> [
                        Text("200", style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Vegetarian Pizza", style: TextStyle(color: Colors.white,fontSize: 20,),),

                      ],
                    )
                  ],
                ),
            ),
          ),
        ),
      ),
    );

  }
}


