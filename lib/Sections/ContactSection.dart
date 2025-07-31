import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../CustomWidgets/CustomMenuButton.dart';

class ContactSection extends StatelessWidget
{
  List<Map<String,dynamic>> list=[
  {
    'title':'Email Me',
    'icon':Icons.email,
    'subtitle':'umargulzar259@gmail.com'
  },
    {
      'title':'Call Me',
      'icon':Icons.phone,
      'subtitle':'(+92)306-5486762'
    },
    {
      'title':'Location',
      'icon':Icons.location_on,
      'subtitle':'Budhla Sant, Multan'
    },



  ];
  @override
  Widget build(BuildContext context) {
   return    Container(
     key: CONTACT_KEY,
     width: double.infinity,
     height: 400,
     color: Colors.white,
     child:   Column(
       children: [
         // Container(
         //   color: Colors.black87,
         //   width: double.infinity,
         //   height: 1,
         // ),
         Divider(color: Colors.black87,),
         Column(
           children: [
             SizedBox(height: 30,),
             Text("Contact Information",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
             for(int i=0;i<3;i++)
               Container(
                 margin: EdgeInsets.all(10),
                 child: ListTile(
                   title: Text(list[i]['title']),
                   subtitle: Text(list[i]['subtitle']),
                   leading: Icon(list[i]['icon']),
                 ),
               ),
           ],
         ),
       ],
     ),
   );
  }
}