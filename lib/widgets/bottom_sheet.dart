import 'package:flutter/material.dart';
import 'package:project_two/widgets/product_object.dart';
import '../screens/cart_screen.dart';
import 'cart_object.dart';


class CustomBottomSheet extends StatefulWidget {
  ProductObject productObject;
  List<CartObject> cartList;

  CustomBottomSheet(this.productObject, this.cartList);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int _quantity = 1;

  void _increase() {
    setState(() {
      if (_quantity < widget.productObject.quantity) {
        _quantity++;
      }
      else {
        _quantity = widget.productObject.quantity;
      }
    });
  }
  void _decrease() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
      else {
        _quantity = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 20),
          Row(children: [
            Text("Amount: ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
            SizedBox(width: 30),
            InkWell(
              onTap: (){
                _decrease();
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
            SizedBox(width: 8),
            Text("${_quantity}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
            SizedBox(width: 8),
            InkWell(
              onTap: (){
                _increase();
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
          ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Price:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('\$${(widget.productObject.price * _quantity).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          InkWell(
            onTap:(){
              for (int i = 0; i < widget.cartList.length; i++) {
                if (widget.cartList[i].id == widget.productObject.id) {
                  widget.cartList[i].quantity += _quantity;
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CartScreen(widget.cartList))
                  );
                  return;
                }
              }
              if (widget.productObject.quantity >= _quantity) {
                widget.cartList.add(CartObject(
                  id: widget.productObject.id,
                  name: widget.productObject.name,
                  image: widget.productObject.image,
                  price: widget.productObject.price,
                  quantity: _quantity,
                ));
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => CartScreen(widget.cartList))
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Not enough quantity in stock.')));
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
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
    );
  }
}