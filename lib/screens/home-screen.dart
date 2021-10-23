
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_training/productsProvider.dart';
import 'package:provider_training/screens/add-product-screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_training/screens/product-details-screen.dart';

class homeScreen extends StatelessWidget {
  const homeScreen();

  @override
  Widget build(BuildContext context) {
    List<product> allproductList =
        Provider.of<products>(context, listen: true).allproducts;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Products',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: allproductList.isEmpty
          ? Center(
              child: Text('No product is added',style: TextStyle(fontSize: 26, color: Colors.black),),
            )
          : _buidProductsGrid(allproductList),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(15)),
        child: TextButton.icon(
          onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>addProductscreen())),
          icon: Icon(Icons.add,color: Colors.black,),
          label: const Text('Add Product',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
    );
  }

  Widget _buidProductsGrid(List<product> allproductList) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1.5,
        ),
        itemCount: allproductList.length,
        itemBuilder: (ctx, index) {

          return Padding(
            padding: const EdgeInsets.symmetric(vertical:20 ,horizontal: 40),
            child: InkWell(
              onTap: ()=>Navigator.push(ctx, MaterialPageRoute(builder: (_)=>productDetails(index: index,))),
              child: Card(
                elevation: 10,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                   SizedBox(
                     height: double.infinity,
                     width: double.infinity,

                       child: ClipRRect(

                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),

                         ),
                         child: Hero(
                           tag: index,
                           child:Image.file(
                             File(allproductList[index].image),
                             fit: BoxFit.cover,
                           ),
                         )
                       ),

                   ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: FloatingActionButton(
                        heroTag: allproductList[index].title,
                        backgroundColor: Colors.white,
                        splashColor: Colors.deepOrange,
                        onPressed: () => Provider.of<products>(ctx,listen: false).delete(index)
                        //todo listen false or true
                        ,
                        child: Icon(
                          Icons.delete,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    _buildProdText(allproductList[index])
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildProdText(product Product) {
    return Positioned(
      right: 10,
      bottom: 10,
      child: Card(
        elevation: 15,
       // width: 180,
       // height: 150,

        color: Colors.black54,
        child: Container(
          width: 150,
           height: 140,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
              //  SizedBox(height: 20,),
                Text(Product.title,style: TextStyle(color: Colors.white, fontSize: 18),overflow: TextOverflow.ellipsis,),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  height: 2,
                  color: Colors.white,),
                Text(Product.discribtion,style: TextStyle(color: Colors.white, fontSize: 18,),overflow: TextOverflow.ellipsis,),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  height: 2,
                  color: Colors.white,),
                Text('\$'+Product.price.toString(),style: TextStyle(color: Colors.white, fontSize: 18),overflow: TextOverflow.ellipsis,),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  height: 2,
                  color: Colors.white,),
              ],
            ),
        ),
        ),

    );
  }
}
