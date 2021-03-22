import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  BuildContext context;

  Mydrawer(BuildContext context);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Name'),
                accountEmail: Text('Username'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('Hi'),
                ),
              ),
              // ListTile(
              //     leading: Icon(Icons.home),
              //     title: Text(
              //       'Home Page',
              //     ),
              //     onTap: () {
              //       Navigator.of(context).pop();
              //       //Navigator.of(context).pushNamed(MyHomepage.route);
              //     }),
              // ListTile(
              //   leading: Icon(Icons.person),
              //   title: Text(
              //     'My Account',
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     //Navigator.of(context).pushNamed(Account.route);
              //   },
              // ),
              // ListTile(
              //   leading: Icon(Icons.assignment),
              //   title: Text(
              //     'My Lists',
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     //Navigator.of(context).pushNamed(Mylist.route);
              //   },
              // ),
              // ListTile(
              //   leading: Icon(Icons.bookmark),
              //   title: Text(
              //     'Wishlist',
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //    // Navigator.of(context).pushNamed(Wishlist.route);
              //   },
              // ),
              // Divider(),
              // ListTile(
              //   leading: Icon(Icons.mail),
              //   title: Text(
              //     'Contact us',
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     //Navigator.of(context).pushNamed(Contactus.route);
              //   },
              // ),
              // ListTile(
              //   leading: Icon(Icons.info),
              //   title: Text(
              //     'Info & FAQ',
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     //Navigator.of(context).pushNamed(Infofaq.route);
              //   },
              // ),
              // Divider(),
              // ListTile(
              //   leading: Icon(Icons.lock_open),
              //   title: Text(
              //     'Logout',
              //   ),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}