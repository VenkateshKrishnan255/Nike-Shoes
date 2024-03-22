import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingshoes_venkat/nike/AppScreens/homepage.dart';
import 'package:flutter_shoppingshoes_venkat/nike/ShoesModels/shoes.dart';
import 'package:flutter_shoppingshoes_venkat/nike/widget/custom_buttom.dart';
import 'bagcode.dart';

class DetailsPage extends StatefulWidget {
  final Shoes shoes;

  const DetailsPage({Key? key, required this.shoes}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int valueIndexColor = 0;
  int valueIndexSize = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              //------------------------Circle-----------------------
              Positioned(
                top: -size.height * 0.15,
                right: -size.height * 0.20,
                child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 250),
                    tween: Tween(begin: 0, end: 1),
                    builder: (context, value, __) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: value * (size.height * 0.5),
                        width: value * (size.height * 0.5),
                        decoration: BoxDecoration(
                            color:
                                widget.shoes.listImage[valueIndexColor].color,
                            shape: BoxShape.circle),
                      );
                    }),
              ),
              Positioned(
                top: size.height * 0.20,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: FittedBox(
                    child: Text(
                      widget.shoes.category,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[100],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Hero(
                  tag: widget.shoes.name,
                  child: Image(
                    image: AssetImage(
                        widget.shoes.listImage[valueIndexColor].image),
                  ),
                ),
              ),
              //------------------------CustomAppBar-----------------------
              Positioned(
                top: kToolbarHeight,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: const Custom_Buttom(
                        child:  Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              //------------------------Category Title-----------------------
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.shoes.category,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.shoes.name,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      "\u20B9${widget.shoes.price}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: widget.shoes.punctuation > index
                          ? widget.shoes.listImage[valueIndexColor].color
                          : Colors.white,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'SIZE',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Custom_Buttom(
                        onTap: () {
                          valueIndexSize = index;
                          setState(() {});
                        },
                        color: index == valueIndexSize
                            ? widget.shoes.listImage[valueIndexColor].color
                            : Colors.white,
                        child: Text(
                          '${index + 7}',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: index == valueIndexSize
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "COLOR",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: List.generate(
                        widget.shoes.listImage.length,
                        (index) => GestureDetector(
                          onTap: () {
                            valueIndexColor = index;
                            setState(() {});
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: widget.shoes.listImage[index].color,
                              shape: BoxShape.circle,
                              border: index == valueIndexColor
                                  ? Border.all(color: Colors.white, width: 2)
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Custom_Buttom(
                  width: 100,
                  onTap: () {
                    BagCode.addToCard(widget.shoes , context);
                  },
                  color: widget.shoes.listImage[valueIndexColor].color,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child:  Row(
                      children: [
                        Text(
                          'CART',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1, right: 3),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white70,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
