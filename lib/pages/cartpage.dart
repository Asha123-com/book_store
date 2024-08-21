import 'package:book_store/class/class.dart';
import 'package:book_store/google%20font.dart';
import 'package:book_store/pages/delivery%20page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Cart",style: myStyle( 30,Colors.black),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Colors.black,size: 27,
          ),
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ms.cardProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(19),bottomLeft: Radius.circular(19)),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${ms.cardProducts[index].image}"),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  width: MediaQuery.of(context).size.width * 0.55,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${ms.cardProducts[index].bookName}",
                                          style: style(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Text(
                                          "\$${ms.cardProducts[index].price}",
                                          style: style(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Gap(20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  ms.decreaseQuantity(ms.cardProducts[index]);
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 30,
                                                  color: Colors.red,
                                                ),
                                            ),
                                            Gap(10),
                                            Text(
                                              "${ms.cardProducts[index].quantity}",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Gap(10),
                                            IconButton(
                                              onPressed: () {
                                                ms.increaseQuantity(ms.cardProducts[index]);
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Colors.green,
                                              ),
                                            ),
                                            Gap(10),
                                            IconButton(
                                              onPressed: () {
                                                ms.deleteProducts(ms.cardProducts[index]);
                                              },
                                              icon: Icon(
                                                Icons.delete_outline_outlined,
                                                size: 30,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Total",style: myStyle(23,Colors.black),),
                            Text("\S${ms.calculate()}", style: myStyle(26,Colors.black,FontWeight.bold),),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>AddressPage()));
                          },
                          child: Container(
                              padding: EdgeInsets.all(19),
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffadb5bd),
                              ),
                              child: Text("Pick one", style: myStyle(24,Colors.black),)
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}