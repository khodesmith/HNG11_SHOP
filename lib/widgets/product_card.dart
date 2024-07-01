import 'package:flutter/material.dart';
import 'package:hng_shop/Model/product_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      // margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(widget.product.productImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.productName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.product.price}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconButton.filled(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.red[300],
                              ),
                            ),
                            onPressed: () {
                              if (widget.product.quantity == 0) {
                                return;
                              }
                              setState(
                                () {
                                  widget.product.quantity--;
                                },
                              );
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            widget.product.quantity.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          IconButton.filled(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.green[300],
                              ),
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  widget.product.quantity++;
                                },
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
