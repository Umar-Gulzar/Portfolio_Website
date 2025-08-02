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
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
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
                           textStyle: const TextStyle(
                               color: Colors.tealAccent,
                               fontSize: 30,
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
            for(int i=0;i<5;i++)
             CustomMenuButton(i),
            Flexible(child: SizedBox(width: 70,)),

          ]
          ,
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
                height: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black, Colors.teal]),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Container(color: Colors.transparent,height: 280,width: 200,
                       child: FittedBox(
                         child: RichText(
                             text: TextSpan(
                                 children:
                                 [
                                   TextSpan(text:"</>Umar",
                                     style: GoogleFonts.orbitron(
                                         textStyle: const TextStyle(
                                             color: Colors.white,
                                             fontSize: 30,
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
                                         textStyle: const TextStyle(
                                             color: Colors.tealAccent,
                                             fontSize: 30,
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
                       ),
                        Container(height: 280,width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20,),
                            Text("Quick Links",style: TextStyle(fontSize:20 ,fontWeight: FontWeight.w400,color: Colors.white),),
                            SizedBox(height: 30,),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context,index)
                              {
                                return TextButton(
                                    onPressed: (){
                                      scrollToSection(BUTTON_KEYS[index]);
                                    },
                                    child:Text(menuButtons[index],style: TextStyle(color:isButtonHovered[index]?Colors.tealAccent:Colors.white70 ),),
                                  onHover: (b){
                                      setState(() {
                                         isButtonHovered=List.filled(5, false);
                                         isButtonHovered[index]=b;
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
                        height: 280,width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            Text("Connect with me",style: TextStyle(fontSize:20 ,fontWeight: FontWeight.w400,color: Colors.white),),
                            SizedBox(height: 30,),
                            SizedBox(
                              width: 160,
                              child: FittedBox(child: SocialIconButtons()),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.email,color: Colors.white70,),
                                SizedBox(width: 20,),
                                Text("umargulzar259@gmail.com",style: TextStyle(color: Colors.white70)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.phone,color: Colors.white70),
                                SizedBox(width: 20,),
                                Text("(+92)306-5486762",style: TextStyle(color: Colors.white70),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.location_on,color: Colors.white70),
                                SizedBox(width: 20,),
                                Text("Budhla Sant, Multan",style: TextStyle(color: Colors.white70)),
                              ],
                            )
                          ],
                        ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 20,),
                    Text("UmarDev @2025",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            ],
          ),
        )

    );
  }
  }
