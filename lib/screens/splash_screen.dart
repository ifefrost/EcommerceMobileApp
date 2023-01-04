import 'package:flutter/material.dart';

import '../widgets/cart_object.dart';
import 'home_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: animate ? 500 : 100,
              height: animate ? 500 : 100,
              curve: Curves.easeInOut,
              child: Image(image: AssetImage('images/frostNik_logo.png'),)
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: animate ? 1 : 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.red[600]!,
                              Colors.red[400]!,
                              Colors.red[200]!,
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        List<CartObject> cartList;
                        cartList = [];
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(cartList)));
                      },
                      child: const Text('Enter Store'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}