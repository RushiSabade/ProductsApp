import 'dart:convert';

import 'package:api_calling/Description.dart';
import 'package:flutter/material.dart';
import  'package:http/http.dart' as http;

import 'Product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product>  productDetails = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      floatingActionButton: FloatingActionButton(onPressed: getApiData),
      body:
          Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(itemCount: productDetails.length,itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 
                  Padding(
                    padding:EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(productDetails[index].thumbnail,height: 100,width: 200,fit: BoxFit.fill,),
                    ),
                  ),
                  SizedBox(width: 8,),
                 Flexible(
                   flex: 1,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Text(productDetails[index].title,softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 2,),
                     Text("₹ ${productDetails[index].price.toString()}",style: TextStyle(color: Colors.red),),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children:[

                         ElevatedButton(onPressed:() {
                           print("DABAYA MEREKO${productDetails[index].images}");
                           Navigator.push(context,MaterialPageRoute(builder: (context) {
                           return Description(productInfo: productDetails[index]);
                           },));
                         }, child: Icon(Icons.navigate_next,)),
                       ]
                     )
                   ],

                   ),
                 ),

                ],
              );
            },),
          ),


    );
  }

  getApiData() async{

    final url = "https://dummyjson.com/products";

    final uri = Uri.parse(url);

    final response = await http.get(uri);
   
  final welcomeData =  json.decode(response.body.toString());
    final allData = Welcome.fromJson(welcomeData);
    print(allData.products);

    productDetails = allData.products;

    setState(() {

    });

  }
}
