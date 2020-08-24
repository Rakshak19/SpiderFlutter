import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
{

  Map data ={};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    String bgimg = data['isDayTime'] ? 'day.jpg': 'night.jpg';
Color bgColor = data['isDayTime'] ? Colors.blue[100] : Colors.grey[900];
    return Scaffold(
      backgroundColor: bgColor,
      body:
       SafeArea(
         child: Container(
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('images/$bgimg'),
               fit : BoxFit.cover,
             )
           ),
           child: Padding(
             padding: const EdgeInsets.fromLTRB(0,120,0,0),
             child: Column(
               children: <Widget>[
                 FlatButton.icon(
                   onPressed: (){
                     Navigator.pushNamed(context, '/timer');
                   },
                   icon:Icon(Icons.hourglass_empty),
                   label: Text('Timer & Stopwatch',
                   style:TextStyle(
                     fontSize: 20
                   )
                   ),
                 ),
                 SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       data['location'],
                       style: TextStyle(
                         fontSize: 28,
                         letterSpacing: 2,
                       ),
                     )
                   ],
                 ),
                 SizedBox(height: 20),
                 Text(
                   data['time'],
                   style: TextStyle(
                     fontSize: 66
                   ),
                 )
               ],
             ),
           ),
         ),
       ),
    );
  }
}
