import 'package:book_store/google%20font.dart';
import 'package:book_store/model/book%20model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../class/class.dart';
class BookDetails extends StatefulWidget {
  BookList bookList;
  BookDetails({super.key,required this.bookList});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("About Stories",style: myStyle(30,Colors.black),),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.black,size: 30
        ),
      ),
      body: Consumer<ManageState>(
        builder: (context,ms,_){
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage("${widget.bookList.image}"),
                    ),
                  ),
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            itemSize: 25,
                            initialRating: widget.bookList.rating, // Initialize with the book's rating
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              // Update the rating for the specific book
                              setState(() {
                                widget.bookList.rating = rating;
                              });
                            },
                          ),
                          Text(
                            widget.bookList.rating.toStringAsFixed(1),
                            style: myStyle(25),
                          ),
                        ],
                      ),
                      Text("Name:  ${widget.bookList.bookName}",style: myStyle(28),),
                      Text("Author: ${widget.bookList.author}",style: myStyle(26),),
                      Text("Published Date: ${widget.bookList.publishDate}",style: myStyle(24),),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ${widget.bookList.price}",
                            style: myStyle(28),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  bool added = ms.addToBookmark(widget.bookList);
                                  String message = added
                                      ? "Book has been added"
                                      : "Book is already added";
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text(message),
                                  ),
                                  );
                                },
                                icon: Icon(
                                  Icons.bookmark_outline,
                                  size: 30, color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  bool added = ms.addToCard(widget.bookList);
                                  String message = added
                                      ? "Book has been added"
                                      : "Book is already added";
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text(message),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.book,
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
          );
        },
      ),
    );
  }
}