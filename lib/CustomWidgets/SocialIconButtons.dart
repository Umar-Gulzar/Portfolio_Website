import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Providers/Providers.dart';

class SocialIconButtons extends ConsumerStatefulWidget
{
  ConsumerState<SocialIconButtons> createState()=>SocialIconButtonsState();
}
class SocialIconButtonsState extends ConsumerState<SocialIconButtons>
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
      'toolTip':'Linkedin'
    },
    {
      'icon': FaIcon(FontAwesomeIcons.github),
      'url' :'https://github.com/Umar-Gulzar',
      'toolTip':'GitHub'
    },
    {
      'icon': FaIcon(FontAwesomeIcons.facebook),
      'url' :'https://web.facebook.com/umar.arain.5268750',
      'toolTip':'Facebook'
    },
    {
      'icon': FaIcon(FontAwesomeIcons.instagram),
      'url' :'',
      'toolTip':'Instagram'
    },

  ];


  @override
  Widget build(BuildContext context) {
    final hover=ref.watch(hoverProvider);
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for(int index=0;index<4;index++)
        ScaleTransition(
          scale:hover[index]?
          Tween<double>(begin: 1,end: 1.2).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller):
          Tween<double>(begin: 1,end: 1).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller),
          child: MouseRegion(
            onEnter: (b){
              _controller.forward();
              ref.read(hoverProvider.notifier).state[index]=true;
             ref.read(hoverProvider.notifier).state=[...ref.read(hoverProvider.notifier).state];

            },
            onExit: (b){
              _controller.reverse();
              ref.read(hoverProvider.notifier).state[index]=false;
              ref.read(hoverProvider.notifier).state=[...ref.read(hoverProvider.notifier).state];
            },
            child: IconButton(
              onPressed: () {
                  _launchURL(socialButtonsData[index]['url']);
              },
              icon:socialButtonsData[index]['icon'],
              color:hover[index]?Colors.teal:Colors.black,
              tooltip:socialButtonsData[index]['toolTip'],
            ),
          ),
        ),

      ],
    );
  }
}