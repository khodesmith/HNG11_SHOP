import 'package:flutter/material.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key, required this.selectedVal});
  final ValueChanged<int> selectedVal;
  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
          widget.selectedVal(_selectedIndex);
        });
      },
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green[300],
      unselectedItemColor: Colors.white,
      selectedFontSize: 20,
      unselectedFontSize: 15,
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_box,
            size: 0,
          ),
          label: 'PRODUCTS',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_checkout,
            size: 0,
          ),
          label: 'CHECKOUT',
        )
      ],
    );
  }
}
