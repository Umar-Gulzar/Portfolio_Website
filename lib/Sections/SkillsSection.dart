import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../CustomWidgets/CustomMenuButton.dart';
import '../Providers/Providers.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SkillsSection extends ConsumerStatefulWidget
{
  ConsumerState<SkillsSection> createState()=>SkillsSectionState();
}
class SkillsSectionState extends ConsumerState<SkillsSection>
    with TickerProviderStateMixin
{

  List<Map<String,String>> list=[
    {
      'title':'Flutter',
      'subtitle':'Frontend',
      'icon':'Images/flutter.png',
    },
    {
      'title':'Figma',
      'subtitle':'UI/UX Design',
      'icon':'Images/figma.png',
    },
    {
      'title':'GitHub',
      'subtitle':'Version Control',
      'icon':'Images/github.png',
    },
    {
      'title':'Riverpod',
      'subtitle':'State Management',
      'icon':'Images/ri.png',
    },
    {
      'title':'Firebase',
      'subtitle':'Backend',
      'icon':'Images/firebase.png',
    },
    {
      'title':'Api',
      'subtitle':'Rest Api',
      'icon':'Images/rest_api.png',
    },

  ];

  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<Offset> _slide1;
  late Animation<Offset> _slide2;
  late Animation<double> _fade1;
  late Animation<double> _fade2;

  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 700));
    _controller2=AnimationController(vsync: this,duration: Duration(milliseconds: 900));

    _fade1=Tween<double>(begin: 0,end: 0.8).chain(CurveTween(curve:Interval( 0,0.5,curve:Curves.easeInOut))).animate(_controller2);
    _fade2=Tween<double>(begin: 0,end: 0.8).chain(CurveTween(curve:Interval( 0.5,1,curve:Curves.easeInOut))).animate(_controller2);
    _slide1=Tween<Offset>(begin: Offset(0, 0.5),end: Offset.zero).chain(CurveTween(curve:Interval(0, 0.4,curve:  Curves.easeInOut))).animate(_controller2);
    _slide2=Tween<Offset>(begin: Offset(0, 0.5),end: Offset.zero).chain(CurveTween(curve:Interval(0.6, 1,curve:  Curves.easeInOut))).animate(_controller2);

    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    // TODO: implement dispose
  }
  @override
  Widget build(BuildContext context) {

    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;

    return Container(
      key: SKILLS_KEY,
      width: screenWidth,
      //height: screenHeight,   //let to grow height of container naturally then not give height.
      color: Colors.black87,
      child:Stack(
       fit: StackFit.passthrough,
        children: [
          Padding(
            padding:EdgeInsets.all(screenWidth<800?30:30),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("Tech Stack & Skills",style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
                fontSize: (screenWidth*0.040).clamp(35, 45),
              ),),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenWidth<800?100:screenWidth*0.09,left:screenWidth*0.05,right: screenWidth*0.05,bottom: screenWidth*0.05),
            child: Align(
              alignment: Alignment.center,

              child: LayoutBuilder(
                builder: (context,constraints){
                  int count;
                  double ratio;
                  if(screenWidth>1200) {
                    count = 3;
                    ratio = 2 / 1;
                  }
                  else if(screenWidth>800) {
                    count = 2;
                    ratio = 2/1;
                  }
                  else {
                    count=2;
                  ratio=1;
                  }
                  return GridView.builder(
                      itemCount: 6,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount:count,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: ratio,
                    ),
                    itemBuilder: (context,index)
                    {
                      return  MouseRegion(
                        onEnter: (b){
                          _controller.forward();
                          ref.read(skillContainerHoverProvider.notifier).state[index]=true;
                          ref.read(skillContainerHoverProvider.notifier).state=ref.read(skillContainerHoverProvider.notifier).state.toList();
                         },
                        onExit: (b){
                          _controller.reverse();
                          ref.read(skillContainerHoverProvider.notifier).state[index]=false;
                          ref.read(skillContainerHoverProvider.notifier).state=ref.read(skillContainerHoverProvider.notifier).state.toList();
                         },
                        child: Consumer(
                          builder: (context,ref,child) {
                            final hover=ref.watch(skillContainerHoverProvider);
                            return ScaleTransition(
                              scale: hover[index] ? Tween<double>(
                                  begin: 1, end: 1.03).chain(
                                  CurveTween(curve: Curves.bounceInOut)).animate(_controller)
                                  : Tween<double>(begin: 1, end: 1).chain(
                                  CurveTween(curve: Curves.bounceInOut)).animate(_controller),
                              child: VisibilityDetector(
                                key: UniqueKey(),
                                onVisibilityChanged: (v){
                                  if(v.visibleFraction>0.2)
                                    _controller2.forward();
                                  },
                                child: SlideTransition(
                                  position: index<3?_slide1:_slide2,
                                  child: FadeTransition(
                                    opacity: index<3?_fade1:_fade2,
                                    child: LayoutBuilder(
                                      builder: (context,con){
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.easeInOut,
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: (con.maxHeight*0.15).clamp(50, 60),
                                                width: (con.maxWidth*0.15).clamp(50, 60),
                                                child: FittedBox(
                                                  child: Image.asset(
                                                    list[index]['icon']!,),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                list[index]['title']!,
                                                style: TextStyle(color: Colors.white54,
                                                    fontSize: (con.maxWidth*0.05).clamp(25,45),
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              Text(
                                                list[index]['subtitle']!,
                                                style: TextStyle(
                                                  color: Colors.white54, fontSize: (con.maxWidth*0.04).clamp(20,30),),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [BoxShadow(
                                                color: hover[index] ? Colors
                                                    .tealAccent : Colors.white54,
                                                blurRadius: hover[index] ? 5 : 1,
                                                blurStyle: BlurStyle.outer
                                            )
                                            ]
                                        ),
                                      );}
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        ),
                      );
                    }
                                  );}
              ),
            ),
          ),
        ],
      ),

    );
  }
}