import 'package:flutter/material.dart';
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
    return Container(
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
                                CurveTween(curve: Curves.bounceInOut)).animate(
                                _controller)
                                : Tween<double>(begin: 1, end: 1).chain(
                                CurveTween(curve: Curves.bounceInOut)).animate(
                                _controller),
                            child: AnimatedContainer(
                              //   clipBehavior: Clip.antiAlias,
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeInOut,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: FittedBox(
                                        child: Image.asset(
                                          list[index]['icon']!,),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      list[index]['title']!,
                                      style: TextStyle(color: Colors.white54,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      list[index]['subtitle']!,
                                      style: TextStyle(
                                        color: Colors.white54, fontSize: 20,),
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
                            ),
                          );
                        }
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),

    );
  }
}