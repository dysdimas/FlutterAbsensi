import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/absent.dart';

class HomePage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      AbsentPage(),
      Text('OverTime'),
      Text('Leave'),
      Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('Saldo'),
                subtitle: Text('Rp.       7.000.000,00'),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('TopUp'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: const Text('Cancel'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.fingerprint),
        title: Text('Absent'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.timelapse),
        title: Text('Overtime'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.timer_off),
        title: Text('Leave'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
      ),
    ];
    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.assignment, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Hai Dimas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Logout?"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      FlatButton(
                        textColor: Colors.red,
                        child: new Text("Yes"),
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                      FlatButton(
                        textColor: Colors.grey,
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(child: _listPage[_selectedTabIndex]),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
