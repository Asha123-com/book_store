import 'package:book_store/class/class.dart';
import 'package:book_store/google%20font.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Purchase",
          style: myStyle(25, Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black, size: 27),
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _) {
          if (ms.cardProducts.isEmpty) {
            return Center(
              child: Text(
                "No products in cart",
                style: myStyle(20),
              ),
            );
          }
          return ms.cardProducts.length == 1
              ? ListView.builder(
            itemCount: ms.cardProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                            "${ms.cardProducts[index].image}")),
                    Lottie.asset("assets/animation/Animation - 1723566282768.json"),
                    Text(
                      "You have Purchased",
                      style: myStyle(20),
                    ),
                  ],
                ),
              );
            },
          )
              : GridView.builder(
            padding: const EdgeInsets.all(30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: ms.cardProducts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 170,
                    height: 200,
                    child: Image.asset("${ms.cardProducts[index].image}",fit: BoxFit.cover,),
                  ),
                  Lottie.asset("assets/animation/Animation - 1723566282768.json"),
                  Text(
                    "Purchased",
                    style: myStyle(20),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}