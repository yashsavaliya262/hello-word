import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wish_list_demo4/wishmodel.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}
class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wish List"),
      ),
      body: GetBuilder<WishModel>(
        // specify type as Controller
        init: WishModel(), // intialize with the Controller
        builder: (wm) => ListView(
          children: wm.getList().map((e) {
            return ListTile(
              leading: Text(e["product_id"]),
              trailing: Text(e["product_price"]),
              title: Text(e["product_name"]),
            );
          }).toList(),
        ),
      ),
    );
  }
}
