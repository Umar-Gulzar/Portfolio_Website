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
      'image':'Images/W_app.png',
      'buttonTitle':'Weather App',
      'link':'https://github.com/Umar-Gulzar/Weather_App'
    },
    {
      'image':'Images/portfolio.png',
      'buttonTitle':'Portfolio',
      'link':'https://github.com/Umar-Gulzar/Portfolio_Website'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
      key: PROJECTS_KEY,
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width>800?MediaQuery.of(context).size.height:null,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40,),
          Align(
            alignment: Alignment.topCenter,
            child: Text("Projects",style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: (MediaQuery.of(context).size.width*0.03).clamp(35, 50),
            ),),
          ),
          Padding(
            padding:EdgeInsets.all(30) ,
            child: LayoutBuilder(
              builder: (context,constraints){
                int count;
                double ratio;
                if(MediaQuery.of(context).size.width>1200)
                {
                  count = 3;
                  ratio=1;
                }
                else if(MediaQuery.of(context).size.width>600)
                  {
                    count=2;
                    ratio=1;
                  }
                else
                {
                  count = 1;
                  ratio=1;
                }

              return GridView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: count,
                   // crossAxisSpacing: 20,
                  // mainAxisSpacing: 20,
                    childAspectRatio: ratio,
              ),
                  itemBuilder: (context,index)
                  {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 20,
                      children: [
                        SizedBox(
                          width: 400,
                          height: 300,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            elevation: 10,
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              list[index]['image']!,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height:double.infinity,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            _launchURL(list[index]['link']!);
                            },
                          child: Text(
                            list[index]['buttonTitle']!,
                            style: TextStyle(
                                fontSize: (constraints.maxWidth*0.020).clamp(20, 50),
                                fontWeight: FontWeight.w500,
                                color: Colors.teal
                            ),
                          ),
                        ),

                      ],
                    );
                  }
              );}
            ),
          ),
        ],
      ),
    );
  }
}