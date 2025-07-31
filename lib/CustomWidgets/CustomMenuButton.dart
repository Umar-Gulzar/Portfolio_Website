import 'package:flutter/material.dart';

void scrollToSection(GlobalKey key)
{
  Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut
  );
}
final  HOME_KEY=GlobalKey();
final  ABOUTME_KEY=GlobalKey();
final  SKILLS_KEY=GlobalKey();
final  PROJECTS_KEY=GlobalKey();
final  CONTACT_KEY=GlobalKey();
final List<GlobalKey<State<StatefulWidget>>> BUTTON_KEYS=[ HOME_KEY,ABOUTME_KEY,SKILLS_KEY,PROJECTS_KEY,CONTACT_KEY,];
int press=-1;
class CustomMenuButton extends StatefulWidget
{
  int index;
  CustomMenuButton(this.index);
  State<CustomMenuButton> createState()=>CustomMenuButtonState(index);
}

class CustomMenuButtonState extends State<CustomMenuButton>
{
  final List<bool> isHovered=List.filled(5, false);
 // List<bool> isPressed=List.filled(5, false);
  final List<String> buttonNames=['Home','About Me','Skills','Projects','Contact'];
  int index;
  CustomMenuButtonState(this.index);
  @override
  Widget build(BuildContext context) {
    return TextButton(
          style: TextButton.styleFrom(
            shadowColor: isHovered[index] ? Colors.tealAccent : Colors
                .transparent, elevation: 20, shape: RoundedRectangleBorder(),
            backgroundColor: isHovered[index] ? Colors.transparent : Colors
                .transparent,),
          onHover: (b) {
            setState(() {
              isHovered[index] = b;
            });
          }, onPressed: () {
        setState(() {
         press=index;
        });
        scrollToSection(BUTTON_KEYS[index]);
      }, child: Column(
        children: [
          SizedBox(height: 12,),
          Text(buttonNames[index], style: TextStyle(
              color: isHovered[index] || press==index
                  ? Colors.tealAccent
                  : Colors.white),),
          SizedBox(height: 8,),
          Container(height: 1,
              width: 60,
              color: isHovered[index] || press==index
                  ? Colors.white
                  : Colors.transparent)
        ],
      )
    );
  }
}




