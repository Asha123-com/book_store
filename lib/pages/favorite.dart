import 'package:book_store/class/class.dart';
import 'package:book_store/google%20font.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Favorite extends StatelessWidget {
  const Favorite ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Favorites", style: myStyle( 30,Colors.black),
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
                    itemCount: ms.cardBook.length,
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
                                  height: MediaQuery.of(context).size.height * 0.29,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(19),bottomLeft: Radius.circular(19)),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${ms.cardBook[index].image}"),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.29,
                                  width: MediaQuery.of(context).size.width * 0.57,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${ms.cardBook[index].bookName}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Text(
                                          "${ms.cardBook[index].author}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Text(
                                          "${ms.cardBook[index].publishDate}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Text(
                                          "\$${ms.cardBook[index].price}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                       IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Confirm Delete",style: myStyle(20)),
                                              actions: [
                                                TextButton(
                                                  child: Text("Cancel",style: style(14),),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                SizedBox(width: 90,),
                                                TextButton(
                                                  child: Text("Delete",style: style(14),),
                                                  onPressed: () {
                                                    ms.deleteBook(ms.cardBook[index]);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        //  if (confirm) {
                                        // ms.deleteBook(ms.cardProducts[index]);
                                        //  }
                                      },
                                         icon: Icon(
                                           Icons.delete_outline_outlined,
                                           size: 30,
                                           color: Colors.red,
                                         ),
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
              ],
            );
          },
        ));
  }
}