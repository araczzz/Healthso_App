// ignore_for_file: must_be_immutable

// import 'package:easy_upi_payment/easy_upi_payment.dart';
import 'package:healthso/views/pages/HOME/nav_bar/payments/razorpaypayment.dart';
import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';

class PaymentMethods extends StatelessWidget {
  final double amount;

  PaymentMethods({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Methods"),
        backgroundColor: ColorConstants.primaryColour,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("Amount to Add"),
                  const Expanded(child: SizedBox()),
                  Text("$amount"),
                ],
              ),
            ),
            const Divider(),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Payment Methods"),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  paymentOptionCard(
                      title: "UPI",
                      onClick: () {
                        // _con.initiateUPITransactionEasyPayments(amount);
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UPIInterface(amount: amount.toString(),)));
                      }),
                 paymentOptionCard(
  title: "Razorpay",
  onClick: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: RazorpayPayment(amount: amount),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  },
),

                  paymentOptionCard(
                      title: "Easy Payment", onClick: () async {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget paymentOptionCard({
    required void Function() onClick,
    required String title,
  }) {
    return InkWell(
      onTap: onClick,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Text(title),
              ),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
