import 'package:flutter/material.dart';
import 'package:project_two/widgets/cart_object.dart';

class CartItems extends StatefulWidget {
  List<CartObject> cartList;

  CartItems(this.cartList);

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {

  void _increase(cartObject) {
    setState(() {
      cartObject.quantity++;
    });
  }
  void _decrease(cartObject) {
    setState(() {
      if (cartObject.quantity > 1) {
        cartObject.quantity--;
      }
      else {
        cartObject.quantity = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.cartList.length == 0)
            Center(
              child: Text('No items in cart'),
            ),
          for (int i = 0; i < widget.cartList.length; i++)
            Container(
              height: 110,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(widget.cartList[i].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.cartList[i].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        // Text(widget.imageList[i].category, style: TextStyle(fontSize: 14,),),
                        Text('\$${(widget.cartList[i].price * widget.cartList[i].quantity).toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.cartList.removeAt(i);
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.delete, color: Colors.red,)
                          ),
                        ),
                        Row(children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: (){
                                _decrease(widget.cartList[i]);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(Icons.remove, size: 18, color: Colors.red,),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text('${widget.cartList[i].quantity}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: (){
                                _increase(widget.cartList[i]);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(Icons.add, size: 18, color: Colors.red,),
                              ),
                            ),
                          ),
                        ],),
                    ],),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}