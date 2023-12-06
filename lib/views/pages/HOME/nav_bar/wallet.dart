import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/views/pages/HOME/nav_bar/payments/add_cash.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColour,
        elevation: 0, // No elevation for the app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: ColorConstants.primaryColour,
            height: 244 - 80,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Image.asset(
                          'assets/icons/wallet_icon.png',
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        " HealthCash Balance",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "₹ 200",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: const Offset(0, 2), // Offset of the shadow
                ),
              ],
            ),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: const Text(
                "HealthCash History",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: transList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customContainer(
                  onPressed: () {
                    // Add your custom action here
                  },
                  text: "Refer and Earn",
                ),
                customContainer(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddCashPage()));
                  },
                  text: "Add Balance",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customContainer({
    required VoidCallback onPressed,
    required String text,
  }) {
    return Container(
      width: 154,
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.primaryColour),
        borderRadius: BorderRadius.circular(8.0),
        color: ColorConstants.primaryColour,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget transList() {
    return Column(
      children: [
        customListTile(
          date: "01 Jun 2023",
          title: "Expired",
          amount: -200,
        ),
        customListTile(
          date: "24 Jun 2023",
          title: "from: Promotion",
          amount: 400,
        ),
      ],
    );
  }

  Widget customListTile({
    required String date,
    required String title,
    required double amount,
  }) {
    Color textColor = amount < 0 ? Colors.red : Colors.green;

    String formattedAmount = amount >= 0 ? '+${amount}' : amount.toString();

    List<String> dateParts = date.split(' ');

    if (dateParts.length >= 3) {
      dateParts[2] = '\n${dateParts[2]}';
    }

    String formattedDate = dateParts.join(' ');

    return ListTile(
      leading: Text(
        formattedDate,
        textAlign: TextAlign.center,
      ),
      title: Text(title),
      trailing: Text(
        formattedAmount,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
