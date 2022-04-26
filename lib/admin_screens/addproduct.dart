import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_application_full/models/categories.dart';
import 'package:e_commerce_application_full/models/productmodel.dart';
import 'package:e_commerce_application_full/utils/custom_colors.dart';
import 'package:e_commerce_application_full/utils/decoration.dart';
import 'package:e_commerce_application_full/utils/textstyles.dart';
import 'package:e_commerce_application_full/widgets/app_drawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddProductPage extends StatefulWidget {
  static const id = "add product";

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  var categoryC = TextEditingController();
  var productNameC = TextEditingController();
  var serialCodeC = TextEditingController();
  var priceC = TextEditingController();
  var weightC = TextEditingController();
  var brandC = TextEditingController();
  var detailC = TextEditingController();

  var quantityC = TextEditingController();
  var onsaleC = TextEditingController();
  var popularC = TextEditingController();
  var discountC = TextEditingController();
  bool isSale = false;
  bool isPopular = false;
  final _key = GlobalKey<FormState>();
  List<Asset> images = <Asset>[];
  List<String> imageUrls = <String>[];

  save() async {
    bool isvalidate = _key.currentState.validate();
    if (isvalidate) {
      await uploadImages();
      ProductModel()
          .addProduct(ProductModel(
              category: categoryC.text,
              productName: productNameC.text,
              detail: detailC.text,
              serialCode: serialCodeC.text,
              price: int.parse(priceC.text),
              weight: weightC.text,
              brandName: brandC.text,
              quantity: int.parse(quantityC.text),
              imagesUrl: imageUrls,
              isSale: isSale,
              isPopular: isPopular))
          .whenComplete(() =>
              {Fluttertoast.showToast(msg: 'Data Uploaded Successfully')});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product"),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: _key,
              child: Column(
                children: [
                  Container(
                    decoration: decoration(),
                    child: DropdownButtonFormField(
                        validator: (String v) {
                          if (v.isEmpty) {
                            return 'should not be empty';
                          }
                          return null;
                        },
                        hint: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Select Category"),
                        ),
                        decoration: InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            categoryC.text = value;
                            print(categoryC.text);
                          });
                        },
                        // value: categories.first.name,
                        items: categories
                            .map((e) => DropdownMenuItem(
                                value: e.name,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(e.name),
                                )))
                            .toList()),
                  ),
                  editField(
                    validator: (String v) {
                      if (v.isEmpty) {
                        return 'should not be empty';
                      }
                      return null;
                    },
                    controller: productNameC,
                    hint: "Enter Poduct name",
                    onsubmit: (value) {
                      setState(() {
                        productNameC.text = value;
                      });
                    },
                  ),
                  editField(
                    lines: 5,
                    validator: (String v) {
                      if (v.isEmpty) {
                        return 'should not be empty';
                      }
                      return null;
                    },
                    controller: detailC,
                    hint: "Enter details",
                    onsubmit: (value) {
                      setState(() {
                        detailC.text = value;
                      });
                    },
                  ),
                  editField(
                    validator: (String v) {
                      if (v.isEmpty) {
                        return 'should not be empty';
                      }
                      return null;
                    },
                    controller: serialCodeC,
                    hint: "Enter Serial Code",
                    onsubmit: (value) {
                      setState(() {
                        serialCodeC.text = value;
                      });
                    },
                  ),
                  editField(
                    validator: (String v) {
                      if (v.isEmpty) {
                        return 'should not be empty';
                      }
                      return null;
                    },
                    controller: priceC,
                    hint: "Enter Poduct price",
                    onsubmit: (value) {
                      setState(() {
                        priceC.text = value;
                      });
                    },
                  ),
                  editField(
                    validator: (String v) {
                      if (v.isEmpty) {
                        return 'should not be empty';
                      }
                      return null;
                    },
                    controller: weightC,
                    hint: "Enter Poduct weight",
                    onsubmit: (value) {
                      setState(() {
                        weightC.text = value;
                      });
                    },
                  ),
                  editField(
                    validator: (String v) {
                      if (v.isEmpty) {
                        return 'should not be empty';
                      }
                      return null;
                    },
                    controller: brandC,
                    hint: "Enter brand name",
                    onsubmit: (value) {
                      setState(() {
                        brandC.text = value;
                      });
                    },
                  ),
                  editField(
                    validator: (String v) {
                      if (v.isEmpty) {
                        return 'should not be empty';
                      }
                      return null;
                    },
                    controller: quantityC,
                    hint: "Enter Poduct quantity",
                    onsubmit: (value) {
                      setState(() {
                        quantityC.text = value;
                      });
                    },
                  ),
                  // editField(
                  //   controller: onsaleC,
                  //   hint: "Is product on sale",
                  //   onsubmit: (value) {
                  //     setState(() {
                  //       onsaleC.text = value;
                  //     });
                  //   },
                  // ),
                  // editField(
                  //   controller: popularC,
                  //   hint: "Is product popular",
                  //   onsubmit: (value) {
                  //     setState(() {
                  //       popularC.text = value;
                  //     });
                  //   },
                  // ),
                  // Container(
                  //   height: 300,
                  //   decoration: decoration(),
                  //   child: Center(child: Text("No Image Selected")),
                  // ),
                  Container(
                    height: 250,
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              loadAsset();
                            },
                            child: Text("Pick Images")),
                        Expanded(child: buildGridView())
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Is on Sale"),
                      CupertinoSwitch(
                          value: isSale,
                          onChanged: (v) {
                            setState(() {
                              isSale = v;
                            });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Is Popular"),
                      CupertinoSwitch(
                          value: isPopular,
                          onChanged: (v) {
                            setState(() {
                              isPopular = v;
                            });
                          }),
                    ],
                  ),
                  MaterialButton(
                    shape: StadiumBorder(),
                    onPressed: () {
                      save();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Upload Product",
                        style: heading1,
                      ),
                    ),
                    color: primarycolor,
                  )
                ],
              )),
        ),
      ]),
    );
  }

  loadAsset() async {
    List<Asset> resultImages = <Asset>[];
    String error = 'Somwthing went wrong';
    try {
      resultImages = await MultiImagePicker.pickImages(
          maxImages: 6, enableCamera: true, selectedAssets: images);
      setState(() {
        images = resultImages;
      });
    } catch (e) {
      error = e.toString();
    }
  }

  Future postImages(Asset imageFile) async {
    FirebaseStorage db = FirebaseStorage.instance;
    String filename = DateTime.now().millisecondsSinceEpoch.toString();
    await db
        .ref()
        .child('images')
        .child(filename)
        .putData((await imageFile.getByteData()).buffer.asUint8List());
    return db.ref().child('images').child(filename).getDownloadURL();
  }

  Future<void> uploadImages() async {
    for (var image in images) {
      await postImages(image).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
      }).catchError((e) {
        print(e.toString());
      });
    }
  }

  Widget buildGridView() {
    return Container(
      width: double.infinity,
      decoration: decoration(),
      child: images.length == 0
          ? IconButton(onPressed: () {}, icon: Icon(Icons.add))
          : GridView.count(
              crossAxisCount: 3,
              children: List.generate(images.length, (index) {
                Asset asset = images[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: AssetThumb(asset: asset, width: 150, height: 150)),
                );
              }),
            ),
    );
  }
}

class editField extends StatelessWidget {
  String hint;
  Function onsubmit;
  Function validator;
  int lines;

  TextEditingController controller;
  editField(
      {this.hint, this.onsubmit, this.controller, this.validator, this.lines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: decoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            maxLines: lines,
            validator: validator,
            controller: controller,
            onFieldSubmitted: onsubmit,
            decoration:
                InputDecoration(hintText: hint, border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
