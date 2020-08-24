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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
              child: Row(
                children: [
                  Column(
                   children:[
                     Padding(
                       padding:  EdgeInsets.only(
                         bottom: 10,
                       ),
                         child: Text(
                         'HH'
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

                ],
              )
          ),
          Expanded(
            flex:1,
              child: Column(
                    children:[
                      Padding(
                        padding:  EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Text(
                            'HH'
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
          ),
          Expanded(
            flex:3,
            child: Column(
              children:[
                Padding(
                  padding:  EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Text(
                      'HH'
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
