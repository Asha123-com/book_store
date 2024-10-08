import 'package:book_store/data/book%20list.dart';
import 'package:book_store/google%20font.dart';
import 'package:book_store/pages/Login.dart';
import 'package:book_store/pages/book%20details.dart';
import 'package:book_store/pages/cartpage.dart';
import 'package:book_store/pages/favorite.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../class/class.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(
      builder: (context, ms, _) {
        return Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SettingsPage()));
                        },
                        leading: Icon(
                          Icons.settings,
                          size: 35,
                        ),
                        title: Text(
                          "Setting",
                          style: style(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          size: 35,
                        ),
                        title: Text(
                          "Privacy and Security",
                          style: style(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.call,
                          size: 35,
                        ),
                        title: Text(
                          "Calls",
                          style: style(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.wallet,
                          size: 35,
                        ),
                        title: Text(
                          "Wallet",
                          style: style(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.message,
                          size: 35,
                        ),
                        title: Text(
                          "Saved messages",
                          style: style(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.people,
                          size: 35,
                        ),
                        title: Text(
                          "People Nearby",
                          style: style(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.question_answer_outlined,
                          size: 35,
                        ),
                        title: Text(
                          "Help and Feedback",
                          style: style(20),
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlertDialog(
                                title: Text("Do you want to Log Out?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder)=>Login()),(route)=> false);
                                      },
                                      child: Text(
                                        "Yes",
                                        style: style(19),
                                      )),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: style(19),
                                      ))
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: 35,color: Colors.red,
                    ),
                    title: Text(
                      "Log Out",
                      style: style(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.grey,
            iconTheme: IconThemeData(
                color: Colors.black,size: 30
            ),
            actions: [
              Icon(Icons.search, size: 30, color: Colors.black),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => Favorite()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.bookmark_outline,
                      size: 30, color: Colors.black,
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${ms.bookmarkCounter}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => CartPage()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 30, color: Colors.black,
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${ms.counter}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Collections of Stories",
                  style: myStyle(29, Colors.black, FontWeight.bold),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: store.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>BookDetails(bookList: store[index],)));
                          },
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  height: 171,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("${store[index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Gap(10),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  height: 140,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("${store[index].bookName}",style: myStyle(20),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$ ${store[index].price}",
                                            style: myStyle(25),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  bool added = ms.addToBookmark(store[index]);
                                                  String message = added
                                                      ? "Book has been added"
                                                      : "Book has been already added";
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      duration: Duration(seconds: 2),
                                                      content: Text(message),
                                                    ),
                                                  );
                                                },
                                                icon: store[index].isBookmarked ?Icon(
                                                  Icons.bookmark_outline,
                                                  size: 30, color: Colors.red,
                                                ): Icon(
                                                  Icons.bookmark_outline,
                                                  size: 30, color: Colors.grey,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  bool added = ms.addToCard(store[index]);
                                                  String message = added
                                                      ? "Book has been added"
                                                      : "Book has been already added";
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      duration: Duration(seconds: 2),
                                                      content: Text(message),
                                                    ),
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.shopping_cart_outlined,
                                                  size: 30, color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
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
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

