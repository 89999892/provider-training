import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_training/productsProvider.dart';
import 'dart:io';

class productDetails extends StatelessWidget {
  final int index;

  const productDetails({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<product> allproducts = Provider
        .of<products>(context, listen: true)
        .allproducts;
    product Product = allproducts[index];
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text('Product Details',
                  style: TextStyle(fontSize: 30, color: Colors.deepOrange,fontWeight: FontWeight.w400),),
              ),

            ),
            Container(
              width: double.infinity,
              height: 400,
              child:Hero(
                tag: index,
                child:  Image.file(File(Product.image),
    fit: BoxFit.cover,),
              ),

            ),
            SizedBox(height: 20,),
            _buildCardDetails(Product),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDetails(product Product) {
    return Padding(padding: EdgeInsets.all(8),
      child:SizedBox(
        width: double.infinity,
        height: 300,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Center(child: Text('Title :',style: TextStyle(fontSize: 25,color: Colors.deepOrange),),),
                Center(child: Text(Product.title,style: TextStyle(fontSize: 20),),),
                Divider(
                  color: Colors.deepOrange,
                  thickness: 2,
                  indent: 40,
                  endIndent: 40,

                ),
                Center(child: Text('Discription :',style: TextStyle(fontSize: 25,color: Colors.deepOrange),),),
                Center(child: Text(Product.discribtion,style: TextStyle(fontSize: 20),),),
                Divider(
                  color: Colors.deepOrange,
                  thickness: 2,
                  indent: 40,
                  endIndent: 40,

                ),
                Center(child: Text('Price :',style: TextStyle(fontSize: 25,color: Colors.deepOrange),),),
                Center(child: Text(Product.price.toString(),style: TextStyle(fontSize: 20),),),
                Divider(
                  color: Colors.deepOrange,
                  thickness: 2,
                  indent: 40,
                  endIndent: 40,

                ),


              ],
            ),
          ),

        ),
      ),);
  }
}
