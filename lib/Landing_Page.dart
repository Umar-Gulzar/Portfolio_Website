import 'package:flutter/material.dart';
import 'CustomWidgets/SocialIconButtons.dart';
import 'Sections/ContactSection.dart';
import 'Sections/AboutmeSection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CustomWidgets/CustomMenuButton.dart';
import 'Sections/SkillsSection.dart';
import 'Sections/ProjectsSection.dart';
import 'Sections/HomeSection.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Landing_Page extends StatefulWidget
{
  State<Landing_Page> createState()=>Landing_PageState();
}
class Landing_PageState extends State<Landing_Page>
{

  List<String> menuButtons=['Home','About Me','Skills','Projects','Contact'];
  List<bool>  isButtonHovered=List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              InkWell(
                onTap: (){
                  scrollToSection(HOME_KEY);
                },
                child: RichText(
                  text: TextSpan(
                    children:
                   [
                     TextSpan(text:"</>Umar",
                    style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: (screenWidth*0.02).clamp(20,30),
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(
                              color: Colors.white,
                              offset: Offset(0,2),
                              blurRadius: 15,
                            ),
                             ]
                        )),),
                     TextSpan(text:"Dev",
                       style: GoogleFonts.orbitron(
                           textStyle:TextStyle(
                               color: Colors.tealAccent,
                               fontSize: (screenWidth*0.02).clamp(20, 30),
                               fontWeight: FontWeight.bold,
                               shadows: [Shadow(
                                 color: Colors.tealAccent,
                                 offset: Offset(0,2),
                                 blurRadius: 15,
                               ),
                                 ]
                           )),)
                   ]
                  ) ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
          actions: [
            if(screenWidth<=800)
             PopupMenuButton(
               surfaceTintColor: Colors.teal,
               color: Colors.black87,
               constraints: BoxConstraints(maxWidth:double.infinity,minWidth: double.infinity),
               menuPadding: EdgeInsets.zero,
               position: PopupMenuPosition.under,
               offset: Offset(0, 15),
               iconColor: Colors.white,
                 itemBuilder: (context){
      return [
        PopupMenuItem(child:Center(child: Text("Home",style: TextStyle(color: Colors.white54),)),onTap: (){scrollToSection(HOME_KEY);},),
        PopupMenuItem(child: Center(child: Text("About Me",style: TextStyle(color: Colors.white54))),onTap: (){scrollToSection(ABOUTME_KEY);},),
        PopupMenuItem(child: Center(child: Text("Skills",style: TextStyle(color: Colors.white54))),onTap: (){scrollToSection(SKILLS_KEY);},),
        PopupMenuItem(child: Center(child: Text("Projects",style: TextStyle(color: Colors.white54))),onTap: (){scrollToSection(PROJECTS_KEY);},),
        PopupMenuItem(child: Center(child: Text("Contact",style: TextStyle(color: Colors.white54))),onTap: (){scrollToSection(CONTACT_KEY);},),
      ];
    }),
            if(screenWidth>800)
                for(int i=0;i<5;i++)
                     CustomMenuButton(i),
                Flexible(child: SizedBox(width:screenWidth<=800?10:70)),
          ]
        ),


        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeSection(),
              AboutmeSection(),
              SkillsSection(),
              ProjectsSection(),
              ContactSection(),

              Container(
                width: double.infinity,
                //height: screenWidth>800?400:630,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black, Colors.teal]),
                ),
                child: LayoutBuilder(
                  builder: (context,constraints) {
                    return Column(
                      children: [
                        SizedBox(height: 20,),
                        Flex(
                          direction: screenWidth > 800 ? Axis.horizontal : Axis
                              .vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              //color: Colors.grey,
                              // height: screenWidth>800?280:screenWidth*0.15,
                              width: screenWidth > 800 ? constraints.maxWidth*0.15 : constraints.maxWidth * 0.25,
                              child: FittedBox(
                                child: RichText(
                                    text: TextSpan(
                                        children:
                                        [
                                          TextSpan(text: "</>Umar",
                                            style: GoogleFonts.orbitron(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: (screenWidth *
                                                        0.02).clamp(20, 30),
                                                    fontWeight: FontWeight.bold,
                                                    shadows: [Shadow(
                                                      color: Colors.white,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 15,
                                                    ),
                                                    ]
                                                )),),
                                          TextSpan(text: "Dev",
                                            style: GoogleFonts.orbitron(
                                                textStyle: TextStyle(
                                                    color: Colors.tealAccent,
                                                    fontSize: (screenWidth *
                                                        0.02).clamp(20, 30),
                                                    fontWeight: FontWeight.bold,
                                                    shadows: [Shadow(
                                                      color: Colors.tealAccent,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 15,
                                                    ),
                                                    ]
                                                )),)
                                        ]
                                    )),
                              ),
                            ),
                            Container(
                             // color: Colors.black54,
                              //height:screenWidth>800?  constraints.maxHeight*0.25:constraints.maxHeight*0.5,
                              width: screenWidth > 800 ?  constraints.maxWidth*0.15 : screenWidth * 0.30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20,),
                                  Text("Quick Links",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  SizedBox(
                                    height: 160,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return TextButton(
                                            onPressed: () {
                                              scrollToSection(
                                                  BUTTON_KEYS[index]);
                                            },
                                            child: Text(
                                              menuButtons[index],
                                              style: TextStyle(
                                                  color: isButtonHovered[index]
                                                      ? Colors.tealAccent
                                                      : Colors.white70
                                              ),
                                            ),
                                            onHover: (b) {
                                              setState(() {
                                                isButtonHovered =
                                                    List.filled(5, false);
                                                isButtonHovered[index] = b;
                                              });
                                            },
                                          );
                                        }
                                    ),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              //color: Colors.white54,
                              // height:screenWidth>800? 250:screenHeight*0.35,
                              width: screenWidth > 800 ?constraints.maxWidth*0.15 : 230,
                              child: Column(
                                crossAxisAlignment: screenWidth > 800 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20,),
                                  Text("Connect with me", style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),),
                                  SizedBox(height: 30,),
                                  SizedBox(
                                    width: 160,
                                    child: FittedBox(
                                        child: SocialIconButtons()),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.email, color: Colors.white70,),
                                      SizedBox(width: 20,),
                                      Text("umargulzar259@gmail.com",
                                          style: TextStyle(
                                              color: Colors.white70)),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.phone, color: Colors.white70),
                                      SizedBox(width: 20,),
                                      Text("(+92)306-5486762", style: TextStyle(
                                          color: Colors.white70),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: Colors.white70),
                                      SizedBox(width: 20,),
                                      Text("Budhla Sant, Multan",
                                          style: TextStyle(
                                              color: Colors.white70)),
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(height: 20,),
                        Text("UmarDev @2025",
                          style: TextStyle(color: Colors.black),),
                        SizedBox(height: 40,),
                      ],
                    );
                  }
                ),
              ),
            ],
          ),
        )

    );
  }
  }
