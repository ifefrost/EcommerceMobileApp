import 'package:flutter/material.dart';
import 'package:project_two/widgets/product_object.dart';

import '../widgets/cart_object.dart';
import '../widgets/product_card.dart';
import '../widgets/products_list.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class FavoriteScreen extends StatelessWidget {
  List<CartObject> cartList;
  FavoriteScreen(this.cartList);

  @override
  Widget build(BuildContext context) {
    List<ProductObject> productsList = ProductsList().getProductsList();
    List<ProductObject> _favoriteList = ProductsList().getFavoriteList();
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
            padding: EdgeInsets.only(top:20, left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text('Find Product'),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search, size: 30, color: Colors.red,),
                              hintText: 'Search',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.notifications_none, size: 30, color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Favourite Products', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: GridView.builder(
                      itemCount: _favoriteList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(_favoriteList[index], cartList);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(cartList)));
          } else if (index == 1) {
             Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(cartList)));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(cartList)));
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