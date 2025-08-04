import 'package:flutter/material.dart';

Widget profilePicture(double screenWidth,Animation<Offset> _rightSlide,Animation<double> _fadeAnimation)
{
  return  Padding(
    padding: EdgeInsets.only(top: screenWidth * 0.02),
    child: Align(
      alignment: Alignment.topCenter,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [Colors.black, Colors
              .tealAccent
          ]),
        ),
        child: SlideTransition(
          position: _rightSlide,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Image.asset(
              "Images/dp.png", height: 200, width: 200,),
          ),
        ),
      ),
    ),
  );
}