// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AddProdcutView extends StatelessWidget {
//   AddProdcutView({super.key});

//   TextEditingController productname = TextEditingController();

//   TextEditingController productprice = TextEditingController();

//   addproduct() {
//     CollectionReference products =
//         FirebaseFirestore.instance.collection("products");
//     products
//         .add({"name": productname.text, "price": productprice.text})
//         .then((value) => print("Product Added"))
//         .catchError((e) => print(e));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: productname,
//                 decoration:
//                     const InputDecoration(label: Text("Enter Product Name")),
//               ),
//               TextField(
//                 controller: productprice,
//                 decoration:
//                     const InputDecoration(label: Text("Enter Product Price")),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   addproduct();
//                 },
//                 child: const Text("Add Product"),
//               )
//             ],
//           ),
//         ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key});
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();

  addProducts() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");
    products.add({"name": productName.text, "price": productPrice.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Add Products"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: productName,
              decoration:
                  const InputDecoration(label: Text("Enter Product Name")),
            ),
            TextField(
              controller: productPrice,
              decoration:
                  const InputDecoration(label: Text("Enter Product Price")),
            ),
            ElevatedButton(
              onPressed: () {
                addProducts();
              },
              child: const Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }
}
