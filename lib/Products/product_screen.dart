import 'package:flutter/material.dart';
import 'package:hng_shop/Checkout/checkout_screen.dart';
import 'package:hng_shop/Model/product_model.dart';
import 'package:hng_shop/widgets/product_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        title: Text(
          'HNG SHOPPERZ!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green[300],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return CheckoutScreen(
                      products: widget.products
                          .where((item) => item.quantity != 0)
                          .toList(),
                    );
                  },
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart_checkout_rounded,
              size: 30,
              color: Colors.green[300],
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: widget.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
