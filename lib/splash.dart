import 'package:crypto_ticker/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future(() {
      navigateToMain();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffE8BD0D),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome to CryptoTicker',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Lottie.network(
                "https://assets1.lottiefiles.com/packages/lf20_wmzn5vq8.json"),
          ],
        ),
      ),
    );
  }

  void navigateToMain() {
    Future.delayed(Duration(milliseconds: 7000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => MyHomePage())));
    });
  }
}
