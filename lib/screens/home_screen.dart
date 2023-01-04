import 'package:flutter/material.dart';
import 'package:project_two/screens/cart_screen.dart';
import '../widgets/cart_object.dart';
import '../widgets/product_card.dart';
import '../widgets/products_list.dart';
import '../widgets/product_object.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key});
  List<CartObject> cartList;
  HomeScreen(this.cartList);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categoryList = [
    'All',
    'Phones',
    'Watch',
    'TV',
    'Tablet',
    'Speakers',
  ];


  List<ProductObject> productsList = ProductsList().getProductsList();
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                          controller: _searchController,
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
                    ]
                  )),
                Container(
                  margin: EdgeInsets.only(right:25, top: 20),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('images/razer_blade.jpg', fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width/1.2,),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('All Products', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (MediaQuery.of(context).size.width - 30 - 15) / (2 * 290),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 45,
                  ),
                  itemCount: productsList.length,
                  itemBuilder: (_, i){
                      return ProductCard(productsList[i], widget.cartList);
                  },
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
        currentIndex: 0,
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