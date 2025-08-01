import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../CustomWidgets/CustomMenuButton.dart';

class ProjectsSection extends StatelessWidget
{

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }


  List<Map<String,String>> list=[
    {
      'image':'Images/W_app.jpg',
      'buttonTitle':'Weather App',
      'link':'https://github.com/Umar-Gulzar/Weather_App'
    },
    {
      'image':'Images/portfolio.jpg',
      'buttonTitle':'Portfolio',
      'link':'https://github.com/Umar-Gulzar/Portfolio_Website'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
      key: PROJECTS_KEY,
      width: double.infinity,
      height: 690,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30,),
          Align(
            alignment: Alignment.topCenter,
            child: Text("Projects",style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),),
          ),
          Center(
            child: GridView.builder(
              itemCount: 2,
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  crossAxisSpacing: 50,
                  childAspectRatio: 1/1
            ),
                itemBuilder: (context,index)
                {
                  return Column(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height:300,
                        width: 500,
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(list[index]['image']!,fit: BoxFit.fill,),
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          _launchURL(list[index]['link']!);
                        },
                        child: Text(list[index]['buttonTitle']!,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.teal),)),

                    ],
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}