import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../CustomWidgets/CustomMenuButton.dart';
import '../CustomWidgets/SocialIconButtons.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../CustomWidgets/ProfileCard.dart';
import '../CustomWidgets/ProfilePicture.dart';

class AboutmeSection extends StatefulWidget
{
  State<AboutmeSection> createState()=>AboutmeSectionState();
}
class AboutmeSectionState extends State<AboutmeSection>
    with SingleTickerProviderStateMixin
{

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _rightSlide;
  late Animation<double> _scaleButton;
  late Animation<Offset> _lowerSlide;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 700));
    _rightSlide=Tween<Offset>(begin: Offset(2,0),end: Offset.zero).chain(CurveTween(curve:Interval(0, 0.6,curve:Curves.easeInOut))).animate(_controller);
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
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return VisibilityDetector(
      key: Key("Aboutme_key"),
      onVisibilityChanged: (info){
        _controller.forward();
      },
      child: Container(
        key: ABOUTME_KEY,
        width: double.infinity,
        height:screenWidth>800? 600:null,
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context,constraints) {
            return Flex(
              direction: screenWidth > 800 ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if(constraints.maxWidth>800)
                  profileCard(_rightSlide, _fadeAnimation, _lowerSlide),
                if(constraints.maxWidth<800)
                  profilePicture(screenWidth, _rightSlide, _fadeAnimation),
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * 0.05,
                    left: screenWidth <= 800 ? screenWidth * 0.05 : 0,
                    right: screenWidth <= 800 ? screenWidth * 0.05 : 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SlideTransition(
                        position: _rightSlide,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text("Hi, I’m Umar Gulzar", style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: (constraints.maxWidth*0.02).clamp(25,30),
                          ),),
                        ),
                      ),
                      SlideTransition(
                        position: _rightSlide,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text(
                            "Flutter Developer", style: TextStyle(
                            fontSize:(constraints.maxWidth*0.015).clamp(21,22),
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
                          style: TextStyle(
                              fontSize: (constraints.maxWidth*0.011).clamp(15,20),
                              color: Colors.black54),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 50),
                      ScaleTransition(
                        scale: _scaleButton,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 6,
                                    // shadowColor: Colors.white10,
                                    backgroundColor: Colors.teal[300],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))
                                    )),
                                onPressed: () {
                                  setState(() {
                                    scrollToSection(CONTACT_KEY);
                                  });
                                },
                                child: Text(
                                  "Contact",
                                  style: TextStyle(color: Colors.black),)),
                            screenWidth < 800 ? SocialIconButtons() : SizedBox
                                .shrink(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      screenWidth > 800 ? SocialIconButtons() : SizedBox
                          .shrink(),


                    ],
                  ),
                )

              ],
            );
          }
        ),
      ),
    );
  }
}