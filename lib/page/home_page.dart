import 'package:comparebloc/page/home_page_logic.dart';
import 'package:flutter/material.dart';
import 'package:tdlib/td_page.dart';




class HomePage extends TDPage {
  final _logic = HomePageLogic();


  @override
  Widget buildLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compare BLoC"),
      ),
      body: _bodyContent(context),
    );
  }

  Widget _bodyContent(BuildContext context) {
    
    final buildContentColor = () {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          _logic.colorBroadcaster.onUpdate((color) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                color: color,
                width: double.infinity,
                height: 300.0,
              ),
            );
          }),

          SizedBox(height: 20.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () => _logic.actionChangeColor(Colors.red),
              ),

              SizedBox(width: 15.0),

              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () => _logic.actionChangeColor(Colors.green),
              ),

            ],
          )

        ],
      );
    };

    final buildCount = () {
      return Row(
        children: <Widget>[

          Expanded(
            child: _logic.countBroadcaster.onUpdate((number) {
              return Text("$number", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold));
            }), 
          ),

          FloatingActionButton(
            backgroundColor: Colors.amber,
            mini: true,
            child: Text("-", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            onPressed: () => _logic.actionChangeNumber(false),
          ),

          SizedBox(width: 7.0),

          FloatingActionButton(
            backgroundColor: Colors.amber,
            mini: true,
            child: Text("+", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            onPressed: () => _logic.actionChangeNumber(true),
          ),

        ],
      );
    };

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            SizedBox(height: 20.0),

            buildContentColor(),

            SizedBox(height: 20.0),

            Divider(),

            SizedBox(height: 20.0),

            buildCount(),

            SizedBox(height: 20.0),

          ],

        ),
      ),
    );
  }

  @override
  void dispose() {
    _logic.dispose();
  }

}