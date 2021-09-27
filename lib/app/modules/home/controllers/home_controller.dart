import 'package:get/get.dart';
import 'package:function_tree/function_tree.dart';

class HomeController extends GetxController {
  var text = "".obs;
  var hasil = "".obs;

  void changeText(String data) {
    try {
      if (data == "Clear") {
        hasil.value = "";
        print(text.substring(0, text.value.length - 1));
        text.value = text.substring(0, text.value.length - 1);
      } else if (data == "AllClear") {
        hasil.value = "";
        text.value = "";
      } else {
        text.value += data;
      }
    } catch (e) {
      hasil.value = "Error";
    }
  }

  void eksekusi() {
    try {
      print(text);
      hasil.value = "${text.value.interpret()}";
    } catch (e) {
      // jika panjang text tidak sama 0 maka error
      if (text.value.length != 0) {
        hasil.value = "Error";
      }
      // jika sama dengan 0 maka tidak terjadi apa-apa
    }
  }
}
