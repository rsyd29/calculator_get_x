import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // Variable ThemeData untuk Dark
  final ThemeData dark = ThemeData(
    backgroundColor: Color(0xff243441),
    primaryColor: Color(0xffEb8034),
    brightness: Brightness.dark,
    accentColor: Colors.white60,
  );

  // Variable ThemeData untuk Light
  final ThemeData light = ThemeData(
    backgroundColor: Color(0xffEBEBEB),
    primaryColor: Color(0xffEb8034),
    brightness: Brightness.light,
    accentColor: Colors.black38,
  );

  @override
  Widget build(BuildContext context) {
    // Create device orientation always up (portrait)
    // Pasangnya ketika build view-nya
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /**
     *  final heightApp = Get.height;
     *  ini untuk mengambil tinggi dari suatu layar handphone, dll.
     *
     *  tambahkan contex.mediaQueryPadding.top dan context.mediaQueryPadding.bottom
     *  untuk mengambil safe area bagian atas dan bawah dari suatu device
     */

    final heightApp = Get.height -
        context.mediaQueryPadding.top -
        context.mediaQueryPadding.bottom;

    final widthApp = Get.width;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              // Tampilan untuk layar perhitungan
              Expanded(
                // Expanded untuk mengambil ukuran sisa dari container ke-2
                child: Container(
                  width: widthApp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 50),
                      SingleChildScrollView(
                        // Berfungsi untuk apabila angkanya terlalu panjang maka bisa di-scroll ke arah horizontal (kanan-kiri)
                        scrollDirection: Axis.horizontal,
                        child: Obx(() {
                          return Text(
                            // Angka untuk melihat hasil dari perhitungan
                            "${controller.hasil}",
                            style: TextStyle(
                              fontSize: 70,
                            ),
                          );
                        }),
                      ),
                      // Angka untuk melihat perhitungan matematika
                      Obx(() {
                        return Text(
                          "${controller.text}",
                          style: TextStyle(
                              fontSize: 25, color: context.theme.accentColor),
                        );
                      }),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
              // Tombol untuk melakukan perhitungan
              Container(
                width: widthApp,
                // Mengambil layar sebesar 60% untuk Container ke-2
                height: heightApp * 0.6,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Baris pertama
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(
                          text: "^",
                          value: "^",
                        ),
                        ItemButtonCustom(text: "C", value: "Clear"),
                        ItemButtonCustom(text: "AC", value: "AllClear"),
                        // Mengubah theme dark atau light
                        Material(
                          elevation: 7,
                          borderRadius: BorderRadius.circular(10),
                          color: context.theme.primaryColor,
                          child: InkWell(
                            // Membuat kondisi apakah sudah dalam darkMode atau tidak?
                            onTap: () => Get.changeTheme(
                              Get.isDarkMode ? light : dark,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              // menambahkan width dan heigh agar responsive untuk tombol =
                              width: Get.width * 0.165,
                              height: Get.width * 0.165,
                              child: Center(
                                child: Icon(
                                  Icons.color_lens_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Baris kedua
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(text: "(", value: "("),
                        ItemButtonCustom(text: ")", value: ")"),
                        ItemButtonCustom(text: "%", value: "%"),
                        ItemButtonCustom(text: ":", value: "/"),
                      ],
                    ),
                    // Baris ketiga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(text: "7", value: "7"),
                        ItemButtonCustom(text: "8", value: "8"),
                        ItemButtonCustom(text: "9", value: "9"),
                        ItemButtonCustom(text: "x", value: "*"),
                      ],
                    ),
                    // Baris keempat
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(text: "4", value: "4"),
                        ItemButtonCustom(text: "5", value: "5"),
                        ItemButtonCustom(text: "6", value: "6"),
                        ItemButtonCustom(text: "-", value: "-"),
                      ],
                    ),
                    // Baris kelima
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(text: "1", value: "1"),
                        ItemButtonCustom(text: "2", value: "2"),
                        ItemButtonCustom(text: "3", value: "3"),
                        ItemButtonCustom(text: "+", value: "+"),
                      ],
                    ),
                    // Baris keenam
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(text: "0", value: "0"),
                        ItemButtonCustom(text: ".", value: "."),
                        Material(
                          elevation: 7,
                          borderRadius: BorderRadius.circular(10),
                          color: context.theme.primaryColor,
                          child: InkWell(
                            onTap: () => controller.eksekusi(),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              // menambahkan width dan heigh agar responsive untuk tombol =
                              width: Get.width * 0.165 * 2.5,
                              height: Get.width * 0.15,
                              child: Center(
                                child: Text(
                                  "=",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemButtonCustom extends GetView<HomeController> {
  const ItemButtonCustom({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text, value;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      borderRadius: BorderRadius.circular(10),
      color: context.theme.backgroundColor,
      child: InkWell(
        onTap: () {
          controller.changeText(value);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: Get.width * 0.165,
          height: Get.width * 0.165,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
