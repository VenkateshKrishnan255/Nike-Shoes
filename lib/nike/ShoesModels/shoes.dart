import 'dart:ui';

//Class -1(ImageShoes)
class ImageShoes {
  final String image;
  final Color color;

  ImageShoes(
      this.image,
      this.color
      );
}
//Class -2(Shoes)
class Shoes{
  final String name;
  final String category;
  final double price;
  final int punctuation;
  int quantity ;

   void quantitys(int value) {
    quantity = value;
  }

  final List<ImageShoes> listImage;

  Shoes(
      this.name,
      this.category,
      this.price,
      this.punctuation,
      this.quantity,
      this.listImage,
      );
}

// class Images{
//   final String images;
//   final String names;
//   final String categorys;
//   final String prices;
//   final int punctuations;
//   Images(
//       this.images,
//       this.names,
//       this.categorys,
//       this.prices,
//       this.punctuations
//       );
// }