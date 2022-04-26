import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String category;
  String productName;
  String detail;

  String serialCode;
  int price;
  String weight;
  String brandName;
  int quantity;
  List<String> imagesUrl;
  bool isSale;
  bool isPopular;
  ProductModel(
      {this.category,
      this.productName,
      this.detail,
      this.serialCode,
      this.price,
      this.weight,
      this.brandName,
      this.quantity,
      this.imagesUrl,
      this.isSale,
      this.isPopular});
  CollectionReference db = FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(ProductModel productModel) async {
    Map<String, dynamic> data = {
      'category': productModel.category,
      'productName': productModel.productName,
      'detail': productModel.detail,
      'serialCode': productModel.serialCode,
      'price': productModel.price,
      'weight': productModel.weight,
      'brandName': productModel.brandName,
      'quantity': productModel.quantity,
      'imagesUrl': productModel.imagesUrl,
      'isSale': productModel.isSale,
      'isPopular': productModel.isPopular,
    };
    await db.add(data);
  }

  Future<void> updateProduct(String id, ProductModel updateProduct) async {
    Map<String, dynamic> data = {
      'category': updateProduct.category,
      'productName': updateProduct.quantity,
      'serialCode': updateProduct.serialCode,
      'price': updateProduct.price,
      'weight': updateProduct.weight,
      'brandName': updateProduct.brandName,
      'quantity': updateProduct.quantity,
      'imagesUrl': updateProduct.imagesUrl,
      'isSale': updateProduct.isSale,
      'isPopular': updateProduct.isPopular,
    };
    await db.doc(id).update(data);
  }

  Future<void> delete(String id) async {
    db.doc(id).delete();
  }
}
