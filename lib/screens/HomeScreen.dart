import 'package:flutter/material.dart';
import 'package:paradise/helpers/authentication_helper.dart';
import 'package:paradise/screens/LoginScreen.dart';
import 'package:paradise/screens/trips_list.dart';
import 'package:paradise/shared_components/paradise_app_bar.dart';

class HomeScreen extends StatefulWidget {
  // use {} to define named parameters
  // what's inside {} are named parameters
  // si 'key' is a parameter of type 'nullable Key'
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    TripsList(),
    Text(
      'الحسابات ',
      style: optionStyle,
    ),
    Text(
      'الباصات',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const ParadiseAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'الرحلات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_sharp),
            label: 'الحسابات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            label: 'الباصات',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('خيارات'),
              decoration: BoxDecoration(color: Colors.yellow),
            ),
            ListTile(
              title: const Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                AuthenticationHelper().signOut().then((value) {
                  if (value == null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        value,
                        style: TextStyle(fontSize: 16),
                      ),
                    ));
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
