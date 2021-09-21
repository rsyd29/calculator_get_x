import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Tampilan untuk layar perhitungan
              Container(
                width: double.infinity,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // Angka untuk melihat hasil dari perhitungan
                    Text(
                      "900",
                      style: TextStyle(
                        fontSize: 70,
                      ),
                    ),
                    // Angka untuk melihat perhitungan matematika
                    Text(
                      "90x10",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              // Tombol untuk melakukan perhitungan
              Container(
                width: double.infinity,
                height: 500,
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
                        Material(
                          elevation: 10,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 60,
                              height: 60,
                              // color: Colors.green,
                              child:
                                  Center(child: Icon(Icons.color_lens_outlined)),
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
                      ]
                    ),
                    // Baris keenam
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemButtonCustom(text: "0"),
                          ItemButtonCustom(text: "."),
                          Material(
                            elevation: 10,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 195,
                                height: 60,
                                // color: Colors.green,
                                child: Center(
                                    child: Text("=",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ))),
                              ),
                            ),
                          )
                        ]
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
      elevation: 10,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 60,
          height: 60,
          // color: Colors.green,
          child: Center(
              child: Text(text,
                  style: TextStyle(
                    fontSize: 16,
                  ))),
        ),
      ),
    );
  }
}
