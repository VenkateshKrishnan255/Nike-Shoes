import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shoppingshoes_venkat/nike/AppScreens/billpage.dart';
import 'package:flutter_shoppingshoes_venkat/nike/ShoesModels/data.dart';
import 'package:flutter_shoppingshoes_venkat/nike/widget/custom_bagappbar.dart';
import '../ShoesModels/shoes.dart';
import 'bagcode.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}
class _BagPageState extends State<BagPage> {
  final ref = Shoes('', '', 0, 0, 0,[]);
  int lengthOfItemOnBag = listBag.length;
  double totalPrice = BagCode.allTheItemOnBag();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: width,
          height: height,
          child: Column(
            children: [
              const Custom_BagAppbar(),
              Container(
                width: width,
                height: height / 17,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Total: $lengthOfItemOnBag Items',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              if (listBag.isEmpty==true)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 200),
                  child: Column(
                    children: [
                      Text('No Shoes Added!',style: TextStyle(fontSize: 26,color: Colors.white),),
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text('Once You Have Added, Come Back :)',style: TextStyle(fontSize: 18,color: Colors.white),),
                      )
                    ],
                  ),
                )
                else Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: _mainProductList(width, height),
                  ),
                  _buttomInfo(width, height),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttomInfo(double width, double height) {
    return Container(
              width: width,
              height: height / 8,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                      Text("\u20B9${totalPrice}")
                    ],
                  ),
                  const SizedBox(height: 6,),
                  materialButtom(width, height)
                ],
              ),
            );
  }

  Widget materialButtom( width , height){
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BillPage(),),);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      minWidth: width / 1.2,
      height: height / 14,
      color: Colors.grey[350],
      child: Text('Confirm Order',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
    );
  }

  Widget _mainProductList(double width, double height) {
    return Container(
            width: width,
            height: height * 0.65,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: listBag.length,
                itemBuilder: (context, index) {
                  final currenPageItem = listBag[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    width: width,
                    height: height * 0.2,
                    child: Row(
                      children: [
                        //Item Image
                        SizedBox(
                          width: width * 0.4,
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                width: width * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.grey[350]),
                              ),
                              Positioned(
                                child: RotationTransition(
                                  turns:
                                      const AlwaysStoppedAnimation(-20 / 360),
                                  child: SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Image(
                                      image: AssetImage(listBag[index].listImage[index].image),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                                child: GestureDetector(
                                  onTap: () {
                                   setState(() {
                                     listBag.removeAt(index);
                                     if(currenPageItem.quantity == 1)
                                     {
                                       lengthOfItemOnBag-1;
                                     }else if(currenPageItem.quantity == 2)
                                     {
                                       lengthOfItemOnBag-2;
                                     }else if(currenPageItem.quantity == 3){
                                       lengthOfItemOnBag-3;
                                     }else if(currenPageItem.quantity == 4){
                                       lengthOfItemOnBag-4;
                                     }else if(currenPageItem.quantity == 5){
                                       lengthOfItemOnBag-5;
                                     }else if(currenPageItem.quantity == 6){
                                       lengthOfItemOnBag-6;
                                     }else if(currenPageItem.quantity == 7){
                                       lengthOfItemOnBag-7;
                                     }else if(currenPageItem.quantity == 8){
                                       lengthOfItemOnBag-8;
                                     }else if(currenPageItem.quantity == 9){
                                       lengthOfItemOnBag-9;
                                     }else if(currenPageItem.quantity == 10){
                                       lengthOfItemOnBag-10;
                                     }else if(currenPageItem.quantity == 11){
                                       lengthOfItemOnBag-12;
                                     }
                                     totalPrice = BagCode.allTheItemOnBag();
                                   });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5
                                        )
                                      ]
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.delete, size: 15, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currenPageItem.category),
                            Text(currenPageItem.name),
                            Text("\u20B9${currenPageItem.price}",style: const TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (currenPageItem.quantity > 1) {
                                        currenPageItem.quantity--; // Decrease the quantity
                                        lengthOfItemOnBag--;
                                        totalPrice -= currenPageItem.price; // Decrease the total price
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.remove,size: 15,color: Colors.black,),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(currenPageItem.quantity.toString(),style: TextStyle(color: Colors.white),),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      currenPageItem.quantity++; // Increase the quantity
                                      lengthOfItemOnBag++;
                                      totalPrice += currenPageItem.price; // Increase the total price
                                    });
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.add,size: 15,color: Colors.black,),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
    );
  }
}