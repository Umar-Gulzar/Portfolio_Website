import 'package:flutter/material.dart';
import '../CustomWidgets/CustomMenuButton.dart';

class HomeSection extends StatefulWidget
{
  State<HomeSection> createState()=>HomeSectionState();
}
class HomeSectionState extends State<HomeSection>
    with SingleTickerProviderStateMixin
{
  late AnimationController _controller;
  late Animation<Offset> _upperSlide;
  late Animation<Offset> _lowerSlide;
  late Animation<double> _scaleButton;
  late Animation<double> _fadeAnimation;
  late Animation<double> _fadeAnimation2;

  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 900));

    _upperSlide=Tween<Offset>(begin: Offset(0,-4),end: Offset.zero).chain(CurveTween(curve:Interval(0, 0.5,curve:Curves.easeInOut))).animate(_controller);
    _lowerSlide=Tween<Offset>(begin: Offset(0,2),end: Offset.zero).chain(CurveTween(curve:Interval(0.5, 0.8,curve:Curves.easeInOut))).animate(_controller);
    _scaleButton=Tween<double>(begin: 0,end: 1).chain(CurveTween(curve:Interval(0.7, 1,curve:Curves.easeInOut))).animate(_controller);
    _fadeAnimation=Tween<double>(begin: 0,end: 0.9).chain(CurveTween(curve:Interval( 0.6,1,curve:Curves.easeInOut))).animate(_controller);
    _fadeAnimation2=Tween<double>(begin: 0,end: 0.9).chain(CurveTween(curve:Interval( 0,0.7,curve:Curves.easeInOut))).animate(_controller);


    _controller.forward();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth=MediaQuery.of(context).size.width;
    final double screenHeight=MediaQuery.of(context).size.height;
    return Container(
      key:HOME_KEY,
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.black, Colors.teal]),
      ),
      child: LayoutBuilder(
          builder: (context,constraints)
          {
            return Stack(
            children: [
              Positioned(
                top: screenHeight/12,
                left:screenWidth/10,
                child: FadeTransition(
                  opacity: _fadeAnimation2,
                  child: Text("Hi, I’m Umar Gulzar",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: (screenWidth*0.03).clamp(25.0, 45),
                  ),),
                ),
              ),
              // Image.asset("Images/dart_bird_logo.png",height: 200,width: 200,),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 120,),
                    SlideTransition(
                      position: _upperSlide,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text("Flutter",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: (constraints.maxWidth*0.06).clamp(50, 90),
                            fontFamily: "Neuropol"
                        ),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _lowerSlide,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text("Developer",style: TextStyle
                          (
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: (constraints.maxWidth*0.06).clamp(50, 90),
                          fontFamily: 'Neuropol',
                        ),),
                      ),
                    ),
                    SizedBox(height: screenWidth<600?10:0),
                    FadeTransition(
                      opacity: _fadeAnimation2,
                      child: Text("“Turning ideas into interactive apps.”",style: TextStyle(
                        color: Colors.white,
                        fontSize: (constraints.maxWidth*0.015).clamp(15, 25),
                      ),),
                    ),
                    SizedBox(height: 20,),
                    FadeTransition(
                      opacity: _fadeAnimation2,
                      child: Text("I build smooth, beautiful, and high-performance cross-platform apps using Flutter.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: (constraints.maxWidth*0.015).clamp(15, 25),
                      ),),
                    ),

                    SizedBox(height:screenWidth>800? 30:45),

                    ScaleTransition(
                      scale: _scaleButton,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 6,
                            // shadowColor: Colors.white10,
                            backgroundColor: Colors.teal[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            )),
                        onPressed: () {
                          scrollToSection(CONTACT_KEY);
                        },
                        child: Text("Hire Me",
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth>800? 35:40),
                    ScaleTransition(
                      scale: _scaleButton,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            )),
                        onPressed: () {
                          scrollToSection(PROJECTS_KEY);
                        },
                        child: Text("View My Work",style: TextStyle(color: Colors.black)),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          );}
      ),

    );
  }
}