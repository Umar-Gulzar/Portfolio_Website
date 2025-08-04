Container(
width: double.infinity,
// height: screenWidth<600?screenHeight*0.7:400,                   /////////change/////////////
decoration: BoxDecoration(
gradient: LinearGradient(colors: [Colors.black, Colors.teal]),
),
child: Column(
children: [
SizedBox(height: 20,),
Column(                                                          /////////change/////////////
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Container(

height:screenWidth*0.15,width: screenWidth*0.25,   /////////change/////////////
child: FittedBox(
child: RichText(
text: TextSpan(
children:
[
TextSpan(text:"</>Umar",
style: GoogleFonts.orbitron(
textStyle:TextStyle(
color: Colors.white,
fontSize: (screenWidth*0.02).clamp(15, 30),
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
fontSize:(screenWidth*0.02).clamp(15, 30),
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
Container(height: screenWidth*0.55,width: screenWidth*0.25,   /////////change/////////////

child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
children: [
SizedBox(height: 20,),
Text("Quick Links",
style: TextStyle(
fontSize:20 ,
fontWeight: FontWeight.w400,
color: Colors.white
),
),
SizedBox(height: 20,),
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
child:Text(
menuButtons[index],
style: TextStyle(
color:isButtonHovered[index]?Colors.tealAccent:Colors.white70
),
),
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
height: screenWidth*0.50,width: screenWidth*0.50,         /////////change/////////////
child: Column(
crossAxisAlignment: CrossAxisAlignment.center,           /////////change/////////////
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
//mainAxisAlignment: MainAxisAlignment.end,
children: [
Icon(Icons.email,color: Colors.white70,),
SizedBox(width: 20,),
Text("umargulzar259@gmail.com",style: TextStyle(color: Colors.white70)),
],
),
SizedBox(height: 10,),
Row(
// mainAxisAlignment: MainAxisAlignment.start,
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