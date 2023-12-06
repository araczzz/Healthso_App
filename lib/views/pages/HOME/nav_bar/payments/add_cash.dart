import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/views/pages/HOME/nav_bar/payments/payment_methods.dart';

class AddCashPage extends StatefulWidget {
  const AddCashPage({super.key});

  @override
  AddCashPageState createState() => AddCashPageState();
}

class AddCashPageState extends State<AddCashPage> {
  int totalAmount = 0;
  double amount = 0;
  final controller = TextEditingController(text: "100");
  final String tokenizationKey = 'sandbox_8hxpnkht_kzdtzv2btm4p7s5j';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Cash",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorConstants.primaryColour,
      ),
      body: Column(
        children: [
          Container(
            height: AppBar().preferredSize.height,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: const Icon(
                      Icons.account_balance_wallet_rounded,
                      color: ColorConstants.accentColor,
                      size: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Current Balance',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "₹0",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).textTheme.titleLarge!.color,
                          letterSpacing: 0.6,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 80,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: ColorConstants.accentColor.withOpacity(0.2),
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: controller,
                        onChanged: (s) {
                          if (s.isNotEmpty) {
                            amount = double.parse(s);
                          }
                          setState(() {});
                        },
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 155, 4)),
                          labelText: "Amount to add",
                          contentPadding: EdgeInsets.zero,
                          icon: Icon(Icons.currency_rupee),
                          focusColor: Color.fromARGB(255, 255, 155, 4),
                          iconColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        controller.text = "200";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).disabledColor,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 14, right: 14),
                        child: Text(
                          "₹200",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .color,
                                    letterSpacing: 0.6,
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        controller.text = "500";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).disabledColor,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 14, right: 14),
                        child: Text(
                          "₹500",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .color,
                                    letterSpacing: 0.6,
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.primaryColour),
              borderRadius: BorderRadius.circular(8.0),
              color: ColorConstants.primaryColour,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PaymentMethods(
                      amount: double.parse(controller.text),
                    ),
                  ),
                );
              },
              child: Text(
                'Add ₹${controller.text}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
