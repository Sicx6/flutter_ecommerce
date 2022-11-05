import 'package:ecommerce_flutter/screens/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6)).then((value) => setState(() {
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateWhere: isLoaded,
      navigateRoute: const SignInScreen(), backgroundColor: Colors.white,
      linearGradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 50, 51, 29),
            Color.fromARGB(255, 255, 208, 0),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp),
      text: WavyAnimatedText(
        "Shoopper Apps",
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      imageSrc: "assets/shopping-bag.png",
      //  displayLoading: false,
    );
  }
}
