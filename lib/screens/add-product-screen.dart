import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider_training/productsProvider.dart';
import 'package:flutter/foundation.dart';

class addProductscreen extends StatelessWidget {
  addProductscreen();

  TextEditingController titlectrler = TextEditingController();
  TextEditingController descriptionctrler = TextEditingController();
  TextEditingController pricectrler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.only(top: 30, right: 10, left: 10),
          child: ListView(
            children: [
              SizedBox(height: 100,),
              TextField(
                controller: titlectrler,
                
                decoration: InputDecoration(
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    labelText: 'Title',
                    hintText: 'add the production title...'
                ),


              ),
              SizedBox(height: 20,),
              TextField(
                controller: descriptionctrler,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                    labelText: 'Description',
                    hintText: 'add the production description...'
                ),


              ),
              SizedBox(height: 20,),
              TextField(
                controller: pricectrler,




                decoration: InputDecoration(

                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                    labelText: 'Price',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    hintText: 'add the production price in dollar...',

                ),


              ),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.deepOrange,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  onPressed: () =>
                      showDialog(context: context, builder: (BuildContext context,)=>_buildImageAlertdialog(context),),
                  child: Text('choose a product image',style: TextStyle(fontSize: 20),)),
              SizedBox(height: 20,),
              Consumer<products>(builder:(context,value,_){
                return RaisedButton(
                    color: Colors.white,

                    elevation: 5,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    onPressed: () {
                      value.Add(titlectrler.text, descriptionctrler.text,double.parse(pricectrler.text));
                      Navigator.pop(context);
                    },

                    child: Text('Add Product',style: TextStyle(fontSize: 20,color: Colors.deepOrange),));
              })


            ],
          )
      ),
    );
  }

  /*Widget _buildInputTextField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [

          ],),
      ),
    );
  }*/

 Widget _buildImageAlertdialog(BuildContext context) {
    return AlertDialog(
      title: Text('choose a product image from:',),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            Divider(color: Colors.deepOrange,)
            ,_buildDailogItem(context, 'Camera', Icons.camera_alt_outlined, ImageSource.camera),
             SizedBox(height: 10),
            _buildDailogItem(context, 'Gaallery', Icons.image, ImageSource.gallery),

          ],
        ),
      ),

    );
 }

 Widget _buildDailogItem(BuildContext context,String sourcename,IconData icon,ImageSource src,) {
return Builder(builder: (inercontext){
return Container(
  decoration: BoxDecoration(
    boxShadow: [BoxShadow(
      color: Colors.deepOrange,
       blurRadius: 2,

    ),],
    borderRadius: BorderRadius.circular(15),
  ),
child: ListTile(
  leading: Icon(icon,),
  title: Text(sourcename,style: TextStyle(color: Colors.white),),
  onTap: (){
  context.read<products>().getProductImage(src);
  Navigator.pop(context);
  },
),
);
});
  }


}
