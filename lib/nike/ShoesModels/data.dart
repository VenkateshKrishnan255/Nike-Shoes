import 'package:flutter/material.dart';
import 'package:flutter_shoppingshoes_venkat/nike/ShoesModels/shoes.dart';

final listCategory = ["Basketball", "Running", "Training"];

final listShoes = [
  //---------------------1-Shoes Data Passing-------------------------
  Shoes("AIR JORDAN 1 MID SE GC", "NIKE AIR", 3000.0, 4,1,[
    ImageShoes("assets/images/nike1.png", const Color(0xff800039)),
    ImageShoes("assets/images/nike2.png", const Color(0xffBD7020)),
    ImageShoes("assets/images/nike3.png", const Color(0xffC93531))
  ]),
  //---------------------Ending-------------------------

  //---------------------2-Shoes Data Passing-------------------------
  Shoes("NIKE BLAZER MID", "NIKE AIR", 4500.0, 3,1,[
    ImageShoes("assets/images/nike4.png", const Color(0xffD0643D)),
    ImageShoes("assets/images/nike4.png", const Color(0xffD0643D)),
    ImageShoes("assets/images/nike5.png", const Color(0xffDC1967)),
    ImageShoes("assets/images/nike6.png", const Color(0xffC09E3D))
  ]),
  //---------------------Ending-------------------------

  //---------------------3-Shoes Data Passing-------------------------
  Shoes("ZOOMX VAPOERFLY", "NIKE AIR", 3600.0, 3, 1,[
    ImageShoes("assets/images/nike7.png", const Color(0xff37A26E)),
    ImageShoes("assets/images/nike8.png", const Color(0xff01A992)),
    ImageShoes("assets/images/nike7.png", const Color(0xff37A26E)),
    ImageShoes("assets/images/nike9.png", const Color(0xff5383A7))
  ]),
  //---------------------Ending-------------------------
];


List<Shoes> listBag = [];
