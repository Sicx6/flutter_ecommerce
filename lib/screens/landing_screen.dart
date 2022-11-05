import 'package:ecommerce_flutter/provider/users_provider.dart';
import 'package:ecommerce_flutter/screens/Home/homeScreen.dart';
import 'package:ecommerce_flutter/screens/signIn_screen.dart';
import 'package:ecommerce_flutter/screens/splasScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);

    if (appUser.user != null) {
      print('Login');
      return HomeScreen();
    } else {
      print('Not logged in');
      return SignInScreen();
    }
  }
}
