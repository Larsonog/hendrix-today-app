import 'package:flutter/material.dart';
import 'package:hendrix_today_app/home_screen';
import 'package:hendrix_today_app/calendar_screen';
import 'package:hendrix_today_app/search_screen';

void main() {
  runApp(const MaterialApp(home: ScreenContainer()));
}

class ScreenContainer extends StatefulWidget {
  const ScreenContainer({super.key});

  @override
  State<ScreenContainer> createState() => _ScreenContainerState();
}

class _ScreenContainerState extends State<ScreenContainer> {
  int selectedIndex = 0;
  List<Widget> pages = []; //contains each page
  List<String> titles = []; //contains the title of each page
  final Color webOrange = const Color.fromARGB(255, 202, 81, 39);

  @override
  void initState() {
    super.initState();
    pages = [
      const MyHomeScreen(),
      const CalendarScreen(),
      const SearchScreen()
    ]; //Stores Pages for BottomNav
    titles = [
      "Hendrix Today",
      "HDX Calendar",
      "Search"
    ]; //Stores Page Titles for Bottom Nav
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color webOrange = const Color.fromARGB(255, 202, 81, 39);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: webOrange, title: Text(titles[selectedIndex])),
        body: Center(child: pages[selectedIndex]),
        bottomNavigationBar:
            BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: webOrange,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month_outlined,
                color: webOrange,
              ),
              label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: webOrange,
              ),
              label: "Search")
        ], currentIndex: selectedIndex, onTap: onItemTapped));
  }
}
