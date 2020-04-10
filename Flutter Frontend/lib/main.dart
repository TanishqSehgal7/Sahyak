import 'package:flutter/material.dart';
import 'package:final_app/grocery.dart';
import 'package:final_app/maps.dart';
import 'package:final_app/gallery.dart';

void main() {
  runApp(MaterialApp(
    // Title
      title: "Using Tabs",
      // Home
      home: MyHome()));
}

class MyHome extends StatefulWidget {
  MyHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController tabcontroller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    tabcontroller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.menu, color: Colors.black,
            size: 25 ,),
          Spacer(),
        ],
      ),
    ),
    SizedBox(height: 5 ),
  TabBar(
  controller: tabcontroller,
  indicatorColor: Colors.green,
  indicatorWeight: 3.0,
  labelColor: Colors.black,
  unselectedLabelColor: Colors.grey,
  isScrollable: true,
  tabs: <Widget>[
        Tab(
          // set icon to the tab
    child: Text("Map", style: TextStyle(
        fontSize: 25 ,
        fontFamily: 'OpenSans'
    ),),
        ),
        Tab(
          child: Text("Shop", style: TextStyle(
              fontSize: 25,
              fontFamily: 'OpenSans'
          ),),
        ),
        Tab(
          child: Text("Upload", style: TextStyle(
              fontSize: 25,
              fontFamily: 'OpenSans'
          ),),
        ),
      ],
  ),

            Expanded(
              child: Container(
                child: TabBarView(
                    controller: tabcontroller,
                    children: <Widget>[
                      HomePage(),
                      MyMainPage (),
                      Detail(),
                    ]),
              ),
            )
          ],
      ),

    );
  }
}