import 'package:flutter/material.dart';
import '../CustomWidgets/CustomMenuButton.dart';

class ProjectsSection extends StatelessWidget
{
  List<Map<String,String>> list=[
    {
      'image':'Images/dp.png',
      'buttonTitle':'Weather App'
    },
    {
      'image':'Images/dp.png',
      'buttonTitle':'Portfolio'
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
                          child: Image.asset(list[index]['image']!),
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
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