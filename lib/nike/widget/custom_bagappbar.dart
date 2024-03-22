import 'package:flutter/material.dart';
import 'package:flutter_shoppingshoes_venkat/nike/AppScreens/homepage.dart';

class Custom_BagAppbar extends StatelessWidget {
  const Custom_BagAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Icon(Icons.arrow_back_outlined)),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: const Text(
              'Cart',
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 2),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined))
        ],
      ),
    );
  }
}
