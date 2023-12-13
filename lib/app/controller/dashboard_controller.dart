import 'package:get/get.dart';

class DashboardController extends GetxController {
  var page = Rxn<dynamic>();

  setPage(page) => this.page.value = page;
}