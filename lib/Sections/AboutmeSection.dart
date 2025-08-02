import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../CustomWidgets/CustomMenuButton.dart';
import '../CustomWidgets/SocialIconButtons.dart';
import 'package:visibility_detector/visibility_detector.dart';


class AboutmeSection extends StatefulWidget
{
  State<AboutmeSection> createState()=>AboutmeSectionState();
}
class AboutmeSectionState extends State<AboutmeSection>
    with SingleTickerProviderStateMixin
{

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _leftSlide;
  late Animation<double> _scaleButton;
  late Animation<Offset> _lowerSlide;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 700));
    _leftSlide=Tween<Offset>(begin: Offset(2,0),end: Offset.zero).chain(CurveTween(curve:Interval(0, 0.6,curve:Curves.easeInOut))).animate(_controller);
    _scaleButton=Tween<double>(begin: 0,end: 1).chain(CurveTween(curve:Interval(0.6, 1,curve:Curves.easeInOut))).animate(_controller);
    _lowerSlide=Tween<Offset>(begin: Offset(0,2),end: Offset.zero).chain(CurveTween(curve:Interval(0.5, 0.8,curve:Curves.easeInOut))).animate(_controller);
    _fadeAnimation=Tween<double>(begin: 0,end: 0.9).chain(CurveTween(curve:Interval( 0.4,0.8,curve:Curves.easeInOut))).animate(_controller);
    // TODO: implement initState
    //_controller.forward();
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
    return VisibilityDetector(
      key: Key("Aboutme_key"),
      onVisibilityChanged: (info){
        _controller.forward();
      },
      child: Container(
        key: ABOUTME_KEY,
        width: double.infinity,
        height: 600,
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: SizedBox(
                height: 500,
                width: 500,
                child: Card(
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  elevation: 30,
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(colors: [Colors.black, Colors
                              .tealAccent
                          ]),
                        ),
                        child: SlideTransition(
                          position: _leftSlide,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Image.asset(
                              "Images/dp.png", height: 200, width: 200,),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40,),
                      Container(height: 2, width: 300, color: Colors.black12,),
                      const SizedBox(height: 30,),
                      SlideTransition(
                        position: _lowerSlide,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text("Umar Gulzar", style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(height: 2, width: 60, color: Colors.black12,),
                      const SizedBox(height: 30,),
                      SlideTransition(
                        position: _lowerSlide,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text("Flutter Developer",
                            style: TextStyle(fontSize: 30, color: Colors.teal),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: 600,
              top: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SlideTransition(
                    position: _leftSlide,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text("Hi, I’m Umar Gulzar", style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),),
                    ),
                  ),
                  SlideTransition(
                    position: _leftSlide,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text("Flutter Developer", style: TextStyle(fontSize: 22,
                        color: Colors.teal,
                        fontWeight: FontWeight.w600,
                      ),),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "I’m, a Flutter developer who loves creating modern and responsive mobile apps. "
                          "I enjoy turning ideas into beautiful apps\nusing Flutter and Dart."
                          "I work with tools like Firebase, REST APIs, and Riverpod to build real-world apps. "
                          "Right now, \nI'm learning Flutter Backend and also improving my UI/UX skills.\n\n"
                          "I'm always excited to learn new things and build apps that people love to use.",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 50),
                  ScaleTransition(
                    scale: _scaleButton,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 6,
                            // shadowColor: Colors.white10,
                            backgroundColor: Colors.teal[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            )),
                        onPressed: () {
                          setState(() {
                            scrollToSection(CONTACT_KEY);
                          });
                        },
                        child: Text(
                          "Contact", style: TextStyle(color: Colors.black),)),
                  ),
                  const SizedBox(height: 30),
                  SocialIconButtons(),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}