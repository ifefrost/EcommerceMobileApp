import 'package:flutter/material.dart';
import 'package:project_two/screens/confirmation_screen.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:SafeArea(
        child: Padding(
        padding: EdgeInsets.only(top:20, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Padding(
              padding: EdgeInsets.only(top: 5),
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
                  Text('Checkout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
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
                Column(
                children: [
                  Container(
                  child: Column(
                  children: [
                  SizedBox(height: 30),
                  Text('Customer Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Address',
                            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text('Payment Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Card Number',
                            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Card Holder',
                            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Expiry Date',
                            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'CVV',
                            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            InkWell(
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Pay', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmationScreen()));
            },
            ),
            SizedBox(height: 30),
            ],
          ),
          ],
        ),
      ),
    ),
      ),
    );
  }
}