// class Product {
//   String? id;
//   String? imageUrl;
//   String? productName;
//   String? price;
//   Product({this.id, this.imageUrl, this.productName, this.price});
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toString();
//     imageUrl = json['productImage'].toString();
//     productName = json['productName'].toString();
//     price = json['price'].toString();
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id.toString();
//     data['productImage'] = imageUrl;
//     data['productName'] = productName;
//     data['price'] = price;
//     return data;
//   }
// }
