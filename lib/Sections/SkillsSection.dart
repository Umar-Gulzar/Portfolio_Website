import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../CustomWidgets/CustomMenuButton.dart';
import 'package:visibility_detector/visibility_detector.dart';


class SkillsSection extends StatefulWidget
{
  State<SkillsSection> createState()=>SkillsSectionState();
}
class SkillsSectionState extends State<SkillsSection>
    with TickerProviderStateMixin
{
  List<bool> isHovered=List.filled(6, false);
  late AnimationController _controller;

  bool isGridVisible=false;

  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 700));

    // TODO: implement initState


    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();

    // TODO: implement dispose

  }
  @override
  Widget build(BuildContext context) {
    return    VisibilityDetector(
      onVisibilityChanged: (info){
        if(info.visibleFraction>0.2 && !isGridVisible)
        {
          setState(() {
            isGridVisible=true;
          });
        }
      },
      key: Key("m_key"),
      child: Container(
        key: SKILLS_KEY,
        width: double.infinity,
        height: 700,
        color: Colors.black87,
        child:Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding:EdgeInsets.all(40),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Tech Stack & Skills",style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40,left: 100,right: 100),
              child: Align(
                alignment: Alignment.center,

                child: AnimationLimiter(                                      //we can skip it if grid is not scrollable
                  child: GridView.builder(itemCount: 6,shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount:3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 2/1,
                      ),
                      itemBuilder: (context,index)
                      {
                        return isGridVisible? AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: Duration(seconds: 2),
                          columnCount: 1,                      //Itnay containers aik hi time par ay gy.
                         // delay: Duration(seconds: 3),       //column count jessy yaha par 1 ha tu 1 1 ky beech itna delay
                          child: MouseRegion(
                            onEnter: (b){
                              _controller.forward();
                              setState(() {
                              isHovered[index]=true;
                            });},
                            onExit: (b){
                              _controller.reverse();
                              setState(() {
                              isHovered[index]=false;
                            });},
                            child: ScaleTransition(
                              scale:isHovered[index]?Tween<double>(begin: 1,end: 1.03).chain(CurveTween(curve: Curves.bounceInOut)).animate(_controller)
                              :Tween<double>(begin: 1,end: 1).chain(CurveTween(curve: Curves.bounceInOut)).animate(_controller),
                              child: SlideAnimation(
                                verticalOffset: 50,
                                child: FadeInAnimation(
                                  curve: Curves.easeInOut,
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 700),
                                    curve: Curves.easeInOut,
                                    child: Text(""),
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [BoxShadow(
                                          color: isHovered[index] ? Colors.tealAccent : Colors.white54,
                                          blurRadius: isHovered[index]?5:1,
                                          blurStyle: BlurStyle.outer
                                        )
                                        ]
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                            :MouseRegion(
                          onEnter: (b){
                            _controller.forward();
                            setState(() {
                              isHovered[index]=true;
                            });},
                          onExit: (b){
                            _controller.reverse();
                            setState(() {
                              isHovered[index]=false;
                            });},
                          child: ScaleTransition(
                            scale:isHovered[index]?Tween<double>(begin: 1,end: 1.03).chain(CurveTween(curve: Curves.bounceInOut)).animate(_controller)
                                :Tween<double>(begin: 1,end: 1).chain(CurveTween(curve: Curves.bounceInOut)).animate(_controller),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeInOut,
                              child: Text(""),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [BoxShadow(
                                      color: isHovered[index] ? Colors.tealAccent : Colors.white54,
                                      blurRadius: isHovered[index]?5:1,
                                      blurStyle: BlurStyle.outer
                                  )
                                  ]
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}