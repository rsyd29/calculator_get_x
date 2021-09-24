import 'package:flutter/material.dart';

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
                        child: Text(
                          // Angka untuk melihat hasil dari perhitungan
                          "900",
                          style: TextStyle(
                            fontSize: 70,
                          ),
                        ),
                      ),
                      // Angka untuk melihat perhitungan matematika
                      Text(
                        "90x10",
                        style: TextStyle(
                            fontSize: 25, color: context.theme.accentColor),
                      ),
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
                        ItemButtonCustom(text: "^"),
                        ItemButtonCustom(text: "C"),
                        ItemButtonCustom(text: "AC"),
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
                        ItemButtonCustom(text: "("),
                        ItemButtonCustom(text: ")"),
                        ItemButtonCustom(text: "%"),
                        ItemButtonCustom(text: ":"),
                      ],
                    ),
                    // Baris ketiga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(text: "7"),
                        ItemButtonCustom(text: "8"),
                        ItemButtonCustom(text: "9"),
                        ItemButtonCustom(text: "x"),
                      ],
                    ),
                    // Baris keempat
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(text: "4"),
                        ItemButtonCustom(text: "5"),
                        ItemButtonCustom(text: "6"),
                        ItemButtonCustom(text: "-"),
                      ],
                    ),
                    // Baris kelima
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(text: "1"),
                        ItemButtonCustom(text: "2"),
                        ItemButtonCustom(text: "3"),
                        ItemButtonCustom(text: "+"),
                      ],
                    ),
                    // Baris keenam
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(text: "0"),
                        ItemButtonCustom(text: "."),
                        Material(
                          elevation: 7,
                          borderRadius: BorderRadius.circular(10),
                          color: context.theme.primaryColor,
                          child: InkWell(
                            onTap: () {},
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

class ItemButtonCustom extends StatelessWidget {
  const ItemButtonCustom({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      borderRadius: BorderRadius.circular(10),
      color: context.theme.backgroundColor,
      child: InkWell(
        onTap: () {},
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
