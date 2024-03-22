import 'package:flutter/material.dart';

class LeftNavigation extends StatefulWidget {
  const LeftNavigation({super.key});

  @override
  State<LeftNavigation> createState() => _LeftNavigationState();
}

class _LeftNavigationState extends State<LeftNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: ClipOval(
                      child: Image.asset('assets/images/nikelogo.png',height: 50,width: 50,),
                    ),
                  ),
                accountName: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text('Nike',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 0.8),),
                ),
                accountEmail: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text('Version 1.0',style: TextStyle(fontSize: 14),),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/rocket6.jpg',),
                    fit: BoxFit.cover
                  )
                ),
              ),
              ListTile(
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.person_outline_outlined),
                  )
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text("Profile",style: TextStyle(fontSize: 18),),
                ),
              ),
              ListTile(
                leading: SizedBox(
                    height: 34,
                    width: 34,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.shopping_cart_outlined),
                    )
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text("Cart",style: TextStyle(fontSize: 18),),
                ),
              ),
              ListTile(
                leading: SizedBox(
                    height: 34,
                    width: 34,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.favorite_border_outlined),
                    )
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text("Favorite",style: TextStyle(fontSize: 18),),
                ),
              ),
              ListTile(
                leading: SizedBox(
                    height: 34,
                    width: 34,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.help_outline_outlined),
                    )
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text("Help",style: TextStyle(fontSize: 18),),
                ),
              )
            ],
          ),
      );
  }
}
