import 'package:flutter/material.dart';
import 'package:flutter_project/animations/fadeAnimation.dart';
import 'package:flutter_project/pages/homePage.dart';
import 'package:page_transition/page_transition.dart';


class startPage extends StatefulWidget {
  const startPage({super.key});

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> with TickerProviderStateMixin {
  // variables :
 late AnimationController _animationController;
 late Animation <double> _animation;
 bool _textVisible = true;

  // function
  @override
  void initState(){
    _animationController = AnimationController(vsync: this,
      duration: Duration(milliseconds: 100)
    );

    _animation= Tween<double>(
      begin: 1.0,
      end: 25.0
    ). animate(_animationController);

    super.initState();
  }

  void _onTap(){
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((f) =>
        Navigator.push(context, PageTransition (type: PageTransitionType.fade,
        child: homePage()
        ))
    );
  }



  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage
              (image: AssetImage("lib/images/starter-image.jpg"),
              fit: BoxFit.cover
            )
          ),

          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                  colors:[
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.2),] //colors

          ),
            ),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .end,
                  children: <Widget> [
                    FadeAnimation(delay: 0.5 ,child:  Text("Taking Order For Faster Delivery",
                      style: TextStyle(
                      color: Colors.white,
                    fontSize: 50, fontWeight: FontWeight.bold,)
                      ,),
                    ),
                    SizedBox(height: 20,),

                    FadeAnimation(delay:  1 ,child:Text("See Resturants near by adding location",
                      style: TextStyle(color: Colors.white,
                        height: 1.4,
                        fontSize: 18
                      ),
                    ),
                    ),
                    SizedBox(height: 100,),

                    ScaleTransition(
                      scale: _animation,
                      child: FadeAnimation(delay:  1.2 ,child:  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors:[
                              Colors.yellow,
                              Colors.orange,]
                        )
                      ),

                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0 ,
                        duration: Duration(milliseconds: 50),

                        child: MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () => _onTap(),
                        child: Text("Start", style: TextStyle( color: Colors.white,
                        ),
                        ),
                      ),
                      )
                    ),
                      )
                    ),

                    SizedBox(height: 30,),
                    AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0 ,
                      duration: Duration(milliseconds: 50),
                      child: Align(
                        child: Text("Now Deliver To Your Door 24/7", style:
                        TextStyle(color: Colors.white70, fontSize: 15,
                        ),),
                      ),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
            ),
          ),
        ),
    );
  }
}
