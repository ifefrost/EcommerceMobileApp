import 'package:project_two/widgets/product_object.dart';

class ProductsList {
  final List<ProductObject> productsList = [
    ProductObject(image:'images/echo_dot.jpg',name:"Echo dot",price:59.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'Speakers',id: '1',quantity: 10,rating: 4.5, isFavorite: false),
    ProductObject(image:'images/homepod_mini.jpg',name:"Homepod Mini",price:299.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'Speakers',id: '2',quantity: 12,rating: 2.5, isFavorite: false),
    ProductObject(image:'images/iphone_13.jpg',name:"iphone 13",price:1499.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'Phones',id: '3',quantity: 4,rating: 3.5, isFavorite: false),
    ProductObject(image:'images/mac_mini.jpg',name:"Mac Mini",price:999.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'Tablet',id: '4',quantity: 5,rating: 1.5, isFavorite: false),
    ProductObject(image:'images/macbook_pro.jpg',name:"Macbook Pro",price:1299.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'Laptop',id: '5',quantity: 1,rating: 4.5, isFavorite: false),
    ProductObject(image:'images/google_pixel_6.jpg',name:"Google Pixel 6",price:799.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'Phones',id: '6',quantity: 7,rating: 4.0, isFavorite: false),
    ProductObject(image:'images/lg_4k_TV.jpg',name:"LG 4K TV",price:1999.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'TV',id: '7',quantity: 3,rating: 3.0, isFavorite: false),
    ProductObject(image:'images/samsung_4k_TV.jpg',name:"Samsung 4K TV",price:1799.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'TV',id: '8',quantity: 4,rating: 4.5, isFavorite: false),
    ProductObject(image:'images/surface_pro.jpg',name:"Surface Pro",price:899.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'Tablet',id: '9',quantity: 10,rating: 5.0, isFavorite: false),
    ProductObject(image:'images/galaxy_watch.jpg',name:"Galaxy Watch",price:399.99,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        category: 'Watch',id: '10',quantity: 5,rating: 3.5, isFavorite: false),
  ];

  List<ProductObject> getProductsList() {
    return productsList;
  }
  setfavorite(String id){
    productsList.firstWhere((element) => element.id == id).isFavorite = !productsList.firstWhere((element) => element.id == id).isFavorite;
  }
  List<ProductObject> getProductsListByCategory(String category) {
    return productsList.where((element) => element.category == category).toList();
  }
  List<ProductObject> getProductsListBySearch(String search) {
    return productsList.where((element) => element.name.toLowerCase().contains(search.toLowerCase())).toList();
  }
  List<ProductObject> getFavoriteList() {
    return productsList.where((element) => element.isFavorite == true).toList();
  }
}