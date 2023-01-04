import 'package:flutter/material.dart';
import 'package:project_two/widgets/product_object.dart';
import 'package:project_two/widgets/products_list.dart';
import '../screens/product_screen.dart';
import 'cart_object.dart';

class ProductCard extends StatefulWidget{
  ProductObject productObject;
  List<CartObject> cartList;
  ProductCard(this.productObject, this.cartList);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            child: Stack(children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(widget.productObject, widget.cartList)));
                },
                child: Image.asset(widget.productObject.image, fit: BoxFit.contain,
                  height: 230,
                ),
              ),
              Padding(padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          widget.productObject.isFavorite = !widget.productObject.isFavorite;
                          ProductsList().setfavorite(widget.productObject.id);
                        });
                      },
                      child: Icon(
                        widget.productObject.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],),
          ),
        ),
        SizedBox(height: 10),
        Padding(padding: EdgeInsets.only(left:5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.productObject.name, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
              Text('\$${widget.productObject.price.toString()}', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.red),),
            ],
          ),
          ),
        ),
      ],
    );
  }
}