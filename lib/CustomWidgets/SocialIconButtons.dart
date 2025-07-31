import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButtons extends StatefulWidget
{
  State<SocialIconButtons> createState()=>SocialIconButtonsState();
}
class SocialIconButtonsState extends State<SocialIconButtons>
    with SingleTickerProviderStateMixin
{
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  late AnimationController _controller;

  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 600));
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  List<Map<String,dynamic>> socialButtonsData=[
    {
      'icon': FaIcon(FontAwesomeIcons.linkedin),
      'url' :'https://www.linkedin.com/in/umar-gulzar-968504336/',
      'hover':false,
      'toolTip':'Linkedin'
    },
    {
      'icon': FaIcon(FontAwesomeIcons.github),
      'url' :'',
      'hover':false,
      'toolTip':'GitHub'
    },
    {
      'icon': FaIcon(FontAwesomeIcons.facebook),
      'url' :'https://web.facebook.com/umar.arain.5268750',
      'hover':false,
      'toolTip':'Facebook'
    },
    {
      'icon': FaIcon(FontAwesomeIcons.instagram),
      'url' :'',
      'hover':false,
      'toolTip':'Instagram'
    },

  ];






  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for(int index=0;index<4;index++)
        ScaleTransition(
          scale:socialButtonsData[index]['hover']?
          Tween<double>(begin: 1,end: 1.2).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller):
          Tween<double>(begin: 1,end: 1).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller),
          child: MouseRegion(
            onEnter: (b){
              _controller.forward();
              setState(() {
                socialButtonsData[index]['hover']=true;
              });
            },
            onExit: (b){
              _controller.reverse();
              setState(() {
                socialButtonsData[index]['hover']=false;
              });
            },
            child: IconButton(
              onPressed: () {
                  _launchURL(socialButtonsData[index]['url']);
              },
              icon:socialButtonsData[index]['icon'],
              color:socialButtonsData[index]['hover']?Colors.teal:Colors.black,
              tooltip:socialButtonsData[index]['toolTip'],
            ),
          ),
        ),

      ],
    );
  }
}