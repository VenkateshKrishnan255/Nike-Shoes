import 'package:flutter/material.dart';
import 'package:flutter_shoppingshoes_venkat/nike/AppScreens/leftnavigation.dart';

class Custom_Appbar extends StatelessWidget {
  const Custom_Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kToolbarHeight + 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LeftNavigation(),));
            }, icon: Icon(Icons.menu)),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Image.asset('assets/images/nikelogo.png',scale: 13,),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined))
          ],
        ),
    );
  }
}
