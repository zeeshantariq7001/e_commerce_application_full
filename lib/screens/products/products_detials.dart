import 'package:e_commerce_application_full/utils/decoration.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  static const id = 'productdetailpage';
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    var name = data['productname'];
    var description = data['description'];
    var brand = data['brand'];
    var isPopular = data['isPopular'];
    var isSale = data['isSale'];
    var price = data['price'];
    var quantity = data['quantity'];
    var imagesUrl = data['imagesUrl'][0];
    var weight = data['weight'];
    var serialCode = data['serialCode'];
    bool isSelected = false;

    return Scaffold(
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imagesUrl),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "JUST ONLY: $price Rs",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Description",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Text(
                  description,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(color: isSale ? Colors.green : Colors.red),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      isSale ? "ON SALE" : "OUT OF STOCK",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
