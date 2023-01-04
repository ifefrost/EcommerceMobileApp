import 'package:flutter/material.dart';
import 'package:project_two/screens/home_screen.dart';

import '../widgets/cart_object.dart';

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            width: 200,
            height: 200,
            child: Column(
              children: [
                Text('Order Placed', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                Text('Thanks for ordering', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                SizedBox(height: 20),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Continue Shopping', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
                    ),
                  ),
                  onTap: () {
                    List<CartObject> cartList;
                    cartList = [];
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(cartList)));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}