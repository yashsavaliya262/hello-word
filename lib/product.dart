import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wish_list_demo4/wishlist.dart';
import 'package:wish_list_demo4/wishmodel.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(WishModel());
  }

  @override
  Widget build(BuildContext context) {
    List list2 = [
      {"product_id": "1", "product_name": "Mobile", "product_price": "1200"},
      {"product_id": "2", "product_name": "Laptop", "product_price": "15000"},
      {"product_id": "3", "product_name": "Mobile", "product_price": "1200"}
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Product List"),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.to(WishList());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, top: 24),
                  child: GetBuilder<WishModel>(
                    init: WishModel(), // intialize with the Controller
                    builder: (wm) => Text(wm.getList().length.toString()),
                  ),
                ))
          ],
        ),
        body: ListView(
            children: list2.map((e) {
          return GestureDetector(
            onTap: () {
              WishModel wm = Get.find();
              wm.add(e);
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(e["product_name"]),
              subtitle: Text(e["product_price"]),
              trailing: Icon(Icons.favorite_border),
            ),
          );
        }).toList()));
  }
}
