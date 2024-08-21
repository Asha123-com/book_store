import 'package:book_store/class/class.dart';
import 'package:book_store/data/address%20list.dart';
import 'package:book_store/data/payment%20list.dart';
import 'package:book_store/google%20font.dart';
import 'package:book_store/model/payment%20model.dart';
import 'package:book_store/pages/buy%20page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentModel _selectedMethod = allMethods[0];
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Payment Information",
          style: myStyle(29, Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, size: 27,
        ),
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${customer[0].name}',
                    style: style(25, Colors.black, FontWeight.bold),
                  ),
                  Text(
                    'Email: ${customer[0].email}',
                    style: style(25, Colors.black, FontWeight.bold),
                  ),
                  InkWell(
                    onTap:(){
                      launchUrl(
                        Uri.parse("tel: ${customer[0].phoneNo}"),
                      );
                    },
                    child: Text(
                      'Contact: ${customer[0].phoneNo}',
                      style: style(25, Colors.black, FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Address: ${customer[0].address}',
                    style: style(25, Colors.black, FontWeight.bold),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                            "Number of Books:  ${ms.cardProducts.length}",
                              style: style(25, Colors.black, FontWeight.bold),
                            ),
                            Text(
                              "Total Price:  \$ ${ms.calculate()}",
                              style: style(25, Colors.black, FontWeight.bold),
                            ),
                            Gap(10),
                            Text(
                              "Choose your bank type",
                              style: myStyle(29, Colors.black),
                            ),
                            Gap(10),
                            Card(
                              elevation: 4,
                              child: DropdownButton<PaymentModel>(
                              value: _selectedMethod,
                              onChanged: (PaymentModel? newValue) {
                                setState(() {
                                  _selectedMethod = newValue!;
                                });
                              },
                              items: allMethods.map<DropdownMenuItem<PaymentModel>>(
                                    (PaymentModel card) {
                                  return DropdownMenuItem<PaymentModel>(
                                    value: card,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 36,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("${card.imgUrl}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Gap(10),
                                        Text("${card.paymentMethod}"),
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          Gap(10),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _cardNumber,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Card number',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null  ||value.isEmpty) {
                                      return "Please enter card number";
                                    }
                                    return null;
                                  },
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _amount,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Amount',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null  ||value.isEmpty) {
                                      return "Please enter the amount";
                                    }
                                    return null;
                                  },
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _password,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Gap(20),
                          MaterialButton(
                            height: 45,
                            color: Colors.grey,
                            minWidth: double.infinity,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Confirm Purchase",style: myStyle(20)),
                                      content: Text("Are you sure you want to purchase?",style: style(18),),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel",style: style(14),),
                                        ),
                                        SizedBox(width: 100,),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (builder) => BuyPage(),
                                              ),
                                            );
                                          },
                                          child: Text("Confirm",style: style(14),),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text(
                              "Buy Now",
                              style: myStyle(20, Colors.black),
                            ),
                          ),
                        ],
                      ),
                      ),
                      ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}