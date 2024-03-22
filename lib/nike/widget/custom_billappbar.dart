import 'package:flutter/material.dart';
import 'package:flutter_shoppingshoes_venkat/nike/AppScreens/bagpage.dart';

import '../AppScreens/homepage.dart';

class Custom_BillAppbar extends StatelessWidget {
  const Custom_BillAppbar({super.key});

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
                    builder: (context) => BagPage(),

                  ),
                );
              },
              icon: Icon(Icons.arrow_back_outlined)),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: const Text(
              'Bills',
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 2),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.file_download_outlined),),
        ],
      ),
    );
  }
}
