import 'package:flutter/material.dart';
import 'package:project_two/screens/checkout_screen.dart';
import 'package:project_two/screens/favorite_screen.dart';
import 'package:project_two/widgets/cart_object.dart';

import '../widgets/cart_items.dart';
import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  List<CartObject> cartList;
  CartScreen(this.cartList);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.cartList.length; i++) {
      total += widget.cartList[i].price * widget.cartList[i].quantity;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                    Text('Cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    CartItems(widget.cartList),
                    SizedBox(height: 50),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text('Delivery Fee:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                            Text('\$ 30.25', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red),),
                          ]
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text('Total Payment:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                            Text('\$${(total+30.25).toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red),),
                          ]
                      ),
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap:(){
                        if (widget.cartList.length == 0){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Your cart is empty'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(widget.cartList)));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(widget.cartList)));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(widget.cartList)));
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}