import 'package:astranow/src/pages/home_page.dart';
import 'package:astranow/src/pages/incidents_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainBarPage extends StatefulWidget {
  MainBarPage({Key? key}) : super(key: key);

  @override
  State<MainBarPage> createState() => _MainBarPageState();
}

class _MainBarPageState extends State<MainBarPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        index: currentIndex,
        items: <Widget>[
          Icon(Icons.account_circle, size: 20.0, color: Colors.white,),
          Icon(Icons.map, color: Colors.white),
        ],
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        color: Color(int.parse('#09274d'.replaceAll('#', '0xff'))), //
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: _callPage(currentIndex),
    );
  }

  Widget _callPage(int currPage)
  {
    switch(currPage)
    {
      case 0: return HomePage();
      case 1: return IncidentsPage();
      default: return HomePage();
    }
  }
}