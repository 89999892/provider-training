
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class product {
  final int id;
  final String title;
  final String discribtion;
  final double price;
  final String image;

  product({
    @required this.id,
    @required this.title,
    @required this.discribtion,
    @required this.price,
    @required this.image,
  });
}

class products with ChangeNotifier {
  List<product> allproducts = [];
  String image;

  void Add(
    @required title,
    @required discribtion,
    @required price,
  ) {
    allproducts.add(product(id: 1, title:title, discribtion: discribtion, price:price, image: image));
    image=null;

notifyListeners();
  }
  void delete(int index){
    allproducts.removeAt(index);
    notifyListeners();
  }

Future getProductImage(ImageSource src)async{
    final pickedFile=await ImagePicker().getImage(source: src);
    if(pickedFile!=null){
      image=pickedFile.path;
      notifyListeners();
    }else{
      print('pickedFile  equal null!!!!!!');
    }

}
}
