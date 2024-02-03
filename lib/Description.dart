


import 'package:api_calling/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  Product productInfo;

  Description({super.key,required this.productInfo});
  @override
  State<Description> createState() => (Description_State());



}

class Description_State extends State<Description> {


  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Description')
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(
                color: Colors.white70,
                height: 150,
                alignment: Alignment.center,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.productInfo.images.length,
                 gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 1,
                   mainAxisSpacing: 10,
                   crossAxisSpacing: 10,
                 ),
                 itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(widget.productInfo.images[index],fit: BoxFit.cover,width: width,));
                },
                ),
              ),
              SizedBox(height: 8,),
              Text("Description :",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left),
              SizedBox(height: 2),
              Text(widget.productInfo.description),
              SizedBox(height: 10,),
              Text("Brand :",style: TextStyle(fontWeight: FontWeight.bold),),
              Text(widget.productInfo.brand),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ratings :",style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 10,),
                      Container(
                        height: 50,
                        child: generateRatingIcons(widget.productInfo.rating),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text("Units left :",style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(widget.productInfo.stock.toString(),style:TextStyle(fontWeight: FontWeight.bold))
                    ],

                  ),
                  SizedBox(width: 60,)
                ],
              ),
              Row(
                children:[
                  ElevatedButton(onPressed: () {

                  }, child: Column(
                    children: [
                      Text("Wishlist"),
                      Icon(Icons.heart_broken),
                    ],
                  )),
                  Spacer(),
                  ElevatedButton(onPressed: () {

                  }, child: Column(
                    children: [
                      Text("Add to Cart"),
                      Icon(Icons.shopping_cart),
                    ],
                  )),
                ]
              ),

            ]
          ),
        ),
      ),

    );

  }
  Widget generateRatingIcons(double rating) {
    print(rating);
    List<Widget> icons = [];
    for (int i = 0; i < rating.toInt(); i++) {
      IconData iconData =
      i < rating ? Icons.star : Icons.star_border; // Use Icons.star for filled stars and Icons.star_border for empty stars
      icons.add(Icon(iconData));
    }
    return Row(children: icons);
  }
}
