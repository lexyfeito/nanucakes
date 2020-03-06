import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Pay"),
            onPressed: () async {
              StripePayment.setOptions(
                StripeOptions(
                  publishableKey: "pk_test_mIyXbPOD7ZL3l4omU0ZOzZth00cUlz5cRV",
                  merchantId: "merchant.com.lfapplications.norkys",
                  androidPayMode: 'test',
                ),
              );

              await StripePayment.paymentRequestWithCardForm(
                CardFormPaymentRequest(),
              ).then((PaymentMethod paymentMethod) {
                print(paymentMethod);
              }).catchError(setError);
            },
          )
        ],
      ),
    );
  }

  void setError(dynamic error) {
    //Handle your errors
    print(error);
  }
}