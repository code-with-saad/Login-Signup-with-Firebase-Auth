import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllProductView extends StatelessWidget {
  AllProductView({super.key});

  CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  getallproducts() async {
    return products.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: Center(
          child: FutureBuilder(
              future: getallproducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, ind) {
                        return ListTile(
                          title: Text(snapshot.data.docs[ind]["name"]),
                          subtitle: Text(snapshot.data.docs[ind]["price"]),
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              })),
    );
  }
}
