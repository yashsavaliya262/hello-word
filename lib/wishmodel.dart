import 'package:get/get.dart';

class WishModel extends GetxController {
  final List<Map> _wishList = [];

  void add(Map item) {
    _wishList.add(item);
    update();
  }

  void remove(Map row) {
    _wishList.remove(row);
    update();
  }

  List<Map> getList() {
    return _wishList;
  }
}
