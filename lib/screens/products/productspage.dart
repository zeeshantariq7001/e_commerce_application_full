import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_application_full/models/categories.dart';
import 'package:e_commerce_application_full/screens/products/products_detials.dart';
import 'package:e_commerce_application_full/utils/decoration.dart';
import 'package:e_commerce_application_full/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductPage extends StatefulWidget {
  static const id = 'productpage';

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    var category = data['category'];
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: StreamBuilder(
        stream: db
            .collection('products')
            .where('category', isEqualTo: category)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            Fluttertoast.showToast(msg: 'Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final values = snapshot.data.docs;
          return values.length > 0
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: values.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ProductDetailPage.id, arguments: {
                            "productname": values[index]['productName'],
                            "description": values[index]['detail'],
                            "brand": values[index]['brandName'],
                            "isPopular": values[index]['isPopular'],
                            "isSale": values[index]['isSale'],
                            "price": values[index]['price'],
                            "quantity": values[index]['quantity'],
                            "imagesUrl": values[index]['imagesUrl'],
                            "weight": values[index]['weight'],
                            "serialCode": values[index]['serialCode'],
                          });
                        },
                        child: Container(
                          decoration: decoration(),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  values[index]['imagesUrl'][0],
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.black54),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(FontAwesomeIcons.heart),
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        values[index]['productName'],
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(FontAwesomeIcons.cartPlus),
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "No Product Found",
                    style: heading2,
                  ),
                );
        },
      ),
    );
  }
}
