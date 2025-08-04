import 'package:flutter/material.dart';

Widget profileCard(Animation<Offset> _rightSlide,Animation<double> _fadeAnimation,Animation<Offset> _lowerSlide,)
{
  return SizedBox(
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
              gradient: RadialGradient(
                  colors: [Colors.black, Colors
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
          const SizedBox(height: 40,),
          Container(height: 2, width: 300, color: Colors
              .black12,),
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
                style: TextStyle(
                    fontSize: 30, color: Colors.teal),),
            ),
          ),
        ],
      ),
    ),
  ) ;
}