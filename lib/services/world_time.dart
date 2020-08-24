import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';
class WorldTime{
  String location; //location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDayTime; // true if day,false if night

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{
    try{
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data =jsonDecode(response.body);
      //print(data);

      //get prop from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create date time object
      DateTime now = DateTime.parse(datetime);
      now=now.add(Duration(hours:int.parse(offset)));
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDayTime = now.hour>6 && now.hour<18 ;
      time = DateFormat.jm().format(now);
    }
    catch(e){
     print('Caught Error: $e');
     time = 'could not get time data';
    }


  }
}
