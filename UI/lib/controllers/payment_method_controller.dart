import 'package:flutter/material.dart';
import 'package:graviton/models/payment_method.dart';

class PaymentMethodController {
  static Future<List<PaymentMethod>> getMethods() async {
    return [
      PaymentMethod(
          title: "UPI",
          description: "**** **** **** 4863",
          id: "1",
          icon:
              "https://www.google.com/imgres?imgurl=https%3A%2F%2Fuxwing.com%2Fwp-content%2Fthemes%2Fuxwing%2Fdownload%2Fbrands-and-social-media%2Fupi-icon.png&tbnid=Uw-fXoTGjwrGnM&vet=12ahUKEwj3o5qfnIf-AhWK-XMBHdbdBzwQMygCegUIARDKAQ..i&imgrefurl=https%3A%2F%2Fuxwing.com%2Fupi-icon%2F&docid=ElgdibdA_F1FzM&w=400&h=400&q=upi%20app%20logo&ved=2ahUKEwj3o5qfnIf-AhWK-XMBHdbdBzwQMygCegUIARDKAQ"),
      PaymentMethod(
          title: "Your Wallet",
          description: "Pay directly from your wallet and get 2% cashback",
          id: "2",
          icon:
              "https://www.google.com/imgres?imgurl=https%3A%2F%2Fuxwing.com%2Fwp-content%2Fthemes%2Fuxwing%2Fdownload%2Fbrands-and-social-media%2Fupi-icon.png&tbnid=Uw-fXoTGjwrGnM&vet=12ahUKEwj3o5qfnIf-AhWK-XMBHdbdBzwQMygCegUIARDKAQ..i&imgrefurl=https%3A%2F%2Fuxwing.com%2Fupi-icon%2F&docid=ElgdibdA_F1FzM&w=400&h=400&q=upi%20app%20logo&ved=2ahUKEwj3o5qfnIf-AhWK-XMBHdbdBzwQMygCegUIARDKAQ"),
      PaymentMethod(
          title: "Net Banking",
          description: "Union Bank of India",
          id: "3",
          icon:
              "https://www.google.com/imgres?imgurl=https%3A%2F%2Fpreviews.123rf.com%2Fimages%2Fbsd555%2Fbsd5551808%2Fbsd555180802720%2F107225455-online-banking-app-icon-account-balance-e-payment-bank-building-ui-ux-user-interface-web-or.jpg&tbnid=vNrYqKbjAnTB5M&vet=12ahUKEwjVmIiqnIf-AhUL_TgGHQyKBlMQMygDegUIARDcAQ..i&imgrefurl=https%3A%2F%2Fwww.123rf.com%2Fphoto_107225455_stock-vector-online-banking-app-icon-account-balance-e-payment-bank-building-ui-ux-user-interface-web-or-mobile-a.html&docid=qYrd4v2sl1gfnM&w=1300&h=1300&q=net%20banking%20app%20logo&ved=2ahUKEwjVmIiqnIf-AhUL_TgGHQyKBlMQMygDegUIARDcAQ"),
      PaymentMethod(
          title: "Cash",
          description: "No Incentives or Promo Codes will be applicable",
          id: "4",
          icon:
              "https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fbusiness-acounting-money-mobile-cash-logo-business-acounting-money-mobile-cash-logo-vector-template-167304203.jpg&tbnid=qNRh9R1q75s60M&vet=12ahUKEwj9sN22nIf-AhUc_jgGHZqDDJgQMygWegUIARCVAg..i&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fillustration%2Fcash-logo.html&docid=MNrI2Kndbdc9CM&w=800&h=800&q=cash%20%20logo&ved=2ahUKEwj9sN22nIf-AhUc_jgGHZqDDJgQMygWegUIARCVAg"),
    ];
  }
}
