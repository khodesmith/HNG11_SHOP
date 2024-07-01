import 'package:flutter/material.dart';
import 'package:hng_shop/Checkout/checkout_screen.dart';
import 'package:hng_shop/Model/product_model.dart';
import 'package:hng_shop/Products/product_screen.dart';
import 'package:hng_shop/widgets/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onIndexTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: MyBottomNav(
        selectedVal: _onIndexTapped,
      ),
    );
  }

  List<ProductModel> productList = [
    ProductModel(
        productName: "Man's Jacket",
        productImage: 'assets/images/man jacket.png',
        price: 25,
        quantity: 0),
    ProductModel(
      productName: 'Pants',
      productImage: 'assets/images/pants.png',
      price: 15,
      quantity: 0,
    ),
    ProductModel(
      productName: 'Shirt',
      productImage: 'assets/images/shert.png',
      price: 10,
      quantity: 0,
    ),
    ProductModel(
      productName: 'T-Shirt',
      productImage: 'assets/images/t-shirt.png',
      price: 12,
      quantity: 0,
    ),
    ProductModel(
      productName: 'Kurta',
      productImage: 'assets/images/kurta.png',
      price: 25,
      quantity: 0,
    ),
    ProductModel(
      productName: 'Lehenga',
      productImage: 'assets/images/lehenga.png',
      price: 40,
      quantity: 0,
    ),
    ProductModel(
      productName: 'Ladies Shirt',
      productImage: 'assets/images/t-shert.png',
      price: 45,
      quantity: 0,
    ),
    ProductModel(
      productName: 'Luxury Watch',
      productImage: 'assets/images/watch.png',
      price: 100,
      quantity: 0,
    ),
  ];

  List<Widget> get screens => [
        ProductScreen(products: productList),
        CheckoutScreen(
          products: productList.where((item) => item.quantity != 0).toList(),
        ),
      ];
}
