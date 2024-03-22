import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shoppingshoes_venkat/nike/AppScreens/detailspage.dart';
import 'package:flutter_shoppingshoes_venkat/nike/AppScreens/leftnavigation.dart';
import 'package:flutter_shoppingshoes_venkat/nike/ShoesModels/data.dart';
import 'package:flutter_shoppingshoes_venkat/nike/widget/custom_appbar.dart';
import 'package:flutter_shoppingshoes_venkat/nike/widget/custom_buttombar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(viewportFraction: 0.75);
  double _currentPage = 0.0;
  double _indexPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      if (_currentPage >= 0 && _currentPage < 0.7) {
        _indexPage = 0;
      } else if (_currentPage > 0.7 && _currentPage < 1.7) {
        _indexPage = 1;
      } else if (_currentPage > 1.7 && _currentPage < 2.7) {
        _indexPage = 2;
      }
    });
  }

  Color getColor() {
    late final Color color;
    if (_currentPage >= 0 && _currentPage < 0.7) {
      color = listShoes[0].listImage[0].color;
    } else if (_currentPage > 0.7 && _currentPage < 1.7) {
      color = listShoes[1].listImage[1].color;
    } else if (_currentPage > 1.7 && _currentPage < 2.7) {
      color = listShoes[2].listImage[2].color;
    }
    return color;
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftNavigation(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 110),
            child: IconButton(
                onPressed: (){},
                icon: Image.asset('assets/images/nikelogo.png',scale: 13,)
            ),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.shopping_bag_outlined)
          )
        ],
      ),
      body: Column(
        children: [
          //---------------------Title------------------------------
          SizedBox(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      1,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          listCategory[0],
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: index == 0 ? getColor() : Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: List.generate(
                        1,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            listCategory[1],
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: index == 1 ? getColor() : Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: List.generate(
                        1,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            listCategory[2],
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: index == 2 ? getColor() : Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //---------------------Title-Ending-----------------------
          SizedBox(height: 10),
          //---------------------Content---------------------------
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: listShoes.length,
                itemBuilder: (context, index) {
                  final shoes = listShoes[index];
                  final listTitle = shoes.category.split(' ');
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, _) {
                          return DetailsPage(shoes: shoes);
                        },
                      ));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: index == _indexPage ? 25 : 60),
                      child: Transform.translate(
                        offset: Offset(index == _indexPage ? 0 : 20, 0),
                        child: LayoutBuilder(builder: (context, constraints) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.only(
                              top: index == _indexPage ? 0 : 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                color: Colors.white),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        shoes.category,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        shoes.name,
                                        style: const TextStyle(
                                            fontSize: 28,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "\u20B9${shoes.price}"
                                        ,style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          '${listTitle[0]} \n${listTitle[1]}',
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: constraints.maxHeight * 0.14,
                                  left: constraints.maxWidth * -0.61,
                                  right: -constraints.maxWidth * 0.55,
                                  bottom: constraints.maxHeight * 0.14,
                                  child: Hero(
                                    tag: shoes.name,
                                    child: Image(
                                        image: AssetImage(
                                      shoes.listImage[index].image,
                                    )),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Material(
                                    color: shoes.listImage[index].color,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(36),
                                        bottomRight: Radius.circular(36)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: InkWell(
                                      onTap: () {},
                                      child: const SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Icon(
                                          Icons.add,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                }
                ),
          ),
          //---------------------Content-Ending--------------------------
          Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child: Custom_ButtomBar(color: getColor()),
          )
        ],
      ),
    );
  }
}