import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  TabController tb;

    @override
  void initState(){
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  Widget time(){
      int hour=0;
      int min=0;
      int sec=0;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                     Padding(
                       padding:  EdgeInsets.only(
                         bottom: 10,
                       ),
                         child: Text(
                         'HH',
                             style:TextStyle(
                             fontSize: 18,
                               fontWeight: FontWeight.bold
                         )
                         ),
                     ),

                   // ignore: missing_required_param
                   NumberPicker.integer(
                      initialValue: hour,
                  minValue: 0,
                  maxValue: 23,
                  listViewWidth: 50,
                  onChanged: (val) {
                    setState(() {
                      hour = val;
                    });

                  },
                   ),
                   ],
                 ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Padding(
                        padding:  EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Text(
                            'MM',
                            style:TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        )
                        ),
                      ),

                      // ignore: missing_required_param
                      NumberPicker.integer(
                        initialValue: min,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth: 50,
                        onChanged: (val) {
                          setState(() {
                            min= val;
                          });

                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Padding(
                        padding:  EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Text(
                            'SS',
                            style:TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),

                      // ignore: missing_required_param
                      NumberPicker.integer(
                        initialValue: sec,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth: 50,
                        onChanged: (val) {
                          setState(() {
                            sec = val;
                          });

                        },
                      ),
                    ],
                  ),

                ],
              ),
          ),
          Expanded(
            flex:1,
            child:Text('1',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Expanded(
            flex:3,
           child:Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,

           ),

          ),
    ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Clock'
        ),
        bottom: TabBar(
          tabs: <Widget>[
            Text('Timer'),
            Text(
              'Stopwatch'
            ),
          ],
          controller: tb,
          labelPadding: EdgeInsets.only(
            bottom: 10,
          ),
          labelStyle: TextStyle(
            fontSize: 18,
          ),
          unselectedLabelColor: Colors.white54,

        ),
      ),
      body:TabBarView(
        children: [
          time(),
          Text('Stopwatch'),
        ],
        controller: tb,

      )
    );
  }
}
