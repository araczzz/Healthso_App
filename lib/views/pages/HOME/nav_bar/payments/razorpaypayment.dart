import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPayment extends StatefulWidget {
  final double amount;

  RazorpayPayment({required this.amount});

  @override
  _RazorpayPaymentState createState() => _RazorpayPaymentState();
}

class _RazorpayPaymentState extends State<RazorpayPayment> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    initiateRazorpayPayment(); // Initiate the Razorpay payment when the widget is created
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    // Payment successful
    print("Payment successful: ${response.paymentId}");
   
  }

  void handlePaymentError(PaymentFailureResponse response) {
    // Payment failed
    print("Error: ${response.message}");
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // External wallet selected
    print("External wallet: ${response.walletName}");

  }

  void initiateRazorpayPayment() {
    var options = {
      'key': "rzp_test_V4AfRMCT7NCvF9", // API key
      'amount':
          (widget.amount * 100).toInt(), 
      'name': 'Healthso',
      'description': 'Payment for your order',
      'prefill': {
        'contact': 'user_phone_number',
        'email': 'user_email',
      },
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Initializing Razorpay Payment..."),
      ),
    );
  }
}
