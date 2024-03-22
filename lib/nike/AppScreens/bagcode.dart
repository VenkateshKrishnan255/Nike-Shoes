import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingshoes_venkat/nike/ShoesModels/data.dart';
import '../ShoesModels/shoes.dart';

class BagCode{
  BagCode();

  static void addToCard(Shoes data, BuildContext context){
    bool contains = listBag.contains(data);

    if(contains){
      _showFailSnackbarMgs(context , "Failed");
    }else{
      listBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _showSuccessSnackbarMgs(context , "Added");
    }
  }

  static void _showFailSnackbarMgs(BuildContext context, String mgs1) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text(mgs1),),);
  }

  static void _showSuccessSnackbarMgs(BuildContext context, String mgs2) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text(mgs2),),);
  }

  static double allTheItemOnBag(){
    double sumPrice = 0.0;
    for(Shoes item in listBag){
      sumPrice = sumPrice + item.price;
    }
    return sumPrice;
  }
}