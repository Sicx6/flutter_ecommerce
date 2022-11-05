// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_flutter/provider/users_provider.dart';
import 'package:ecommerce_flutter/screens/Home/displayName_screen.dart';
import 'package:ecommerce_flutter/screens/Home/displayPicture_screen.dart';
import 'package:ecommerce_flutter/screens/Manage%20Address/manageAdress_screen.dart';
import 'package:ecommerce_flutter/screens/my%20order/order_screen.dart';
import 'package:ecommerce_flutter/screens/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg1.jpg'), fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                ),
                Text(
                  AppUser().user!.displayName ?? '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  appUser.user?.email ?? '',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        AppUser().user?.delete();
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.delete)),
                ))
              ],
            )),
        ExpansionTile(
          title: Text('Manage Account'),
          leading: Icon(Icons.people),
          children: [
            ListTile(
              title: Text('Change Display Name'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DisplayName();
                }));
              },
            ),
            ListTile(
              title: Text('Change Profile Picture'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePicture();
                }));
              },
            ),
            ListTile(
              title: Text('Change Profile Phone Number'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePicture();
                }));
              },
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePicture();
                }));
              },
            ),
          ],
        ),
        ListTile(
          title: Text('Manage Address'),
          leading: Icon(Icons.location_city),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ManageAddress();
            }));
          },
        ),
        ExpansionTile(
          title: Text('For Seller'),
          leading: Icon(Icons.sell),
          children: [
            ListTile(
              title: Text('Add New Product'),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return ManageAddress();
                // }));
              },
            ),
            ListTile(
              title: Text('Manage Product'),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return MyOrder();
                // }));
              },
            ),
          ],
        ),
        ListTile(
          title: Text('My Orders'),
          leading: Icon(Icons.gps_fixed),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyOrder();
            }));
          },
        ),
        ListTile(
          title: Text('Sign Out'),
          leading: Icon(Icons.logout),
          onTap: () {
            AppUser.instance.signOut();

            print(AppUser().user);
          },
        ),
      ],
    ));
  }
}
