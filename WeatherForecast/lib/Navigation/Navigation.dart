// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../pages/home/home.dart';
import '../pages/Details/det.dart';
import '../../utils/fetchdata.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  String cityname = "Lahore";
  late Future<dynamic> fetched;
  late List<Widget> _childe;
  var select = 0;

  PageController pageController = PageController();

  // Updating with changed city

  addcity(city) {
    setState(() {
      cityname = city;
      fetched = getCityData(city);
    });
    _childe = [
      Home(
        Data: fetched,
        AddCity: addcity,
      ),
      Det(data: fetched)
    ];
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    fetched = getCityData(cityname);

    _childe = [
      Home(
        Data: fetched,
        AddCity: addcity,
      ),
      Det(data: fetched)
    ];
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onpagechan,
        children: _childe,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.red,
        currentIndex: select,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Details")
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      select = index;
    });
    pageController.jumpToPage(index);
  }

  void onpagechan(int index) {
    setState(() {
      select = index;
    });
  }

  Future<dynamic> getCityData(String cityname) {
    return FetchData().getdata(context, cityname);
  }
}
