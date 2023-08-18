import 'package:flutter/material.dart';
import 'package:partymania_users/screens/tickettab/ticket_rating.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/controllers.dart';
import 'package:partymania_users/utils/textformfield.dart';

class TablePayment extends StatefulWidget {
  const TablePayment({super.key});

  @override
  State<TablePayment> createState() => _TablePaymentState();
}

class _TablePaymentState extends State<TablePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Payment",
          style: TextStyle(color: textColor),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Through UPI",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/upi.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Debit/Credit Card",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/upi.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Referral Code",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormInputField(
                        suIcon: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Applied",
                              style: TextStyle(color: otpColor),
                            )),
                        controller: referroalCode,
                        hintText: "Sisdas",
                        textInputType: TextInputType.text),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Coupon",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormInputField(
                        suIcon: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Applied",
                              style: TextStyle(color: otpColor),
                            )),
                        controller: coupon,
                        hintText: "Sisdas123",
                        textInputType: TextInputType.text),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  "Donate & Contribute to a Smile",
                  style:
                      TextStyle(color: textColor.withOpacity(.7), fontSize: 12),
                ),
                subtitle: Text(
                  "(Rs. 1 per ticket has been added) Remove",
                  style:
                      TextStyle(color: textColor.withOpacity(.7), fontSize: 10),
                ),
                trailing: Text(
                  "Rs 7.00",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: textColor),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Total Amount:",
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
                subtitle: Text(
                  "Coupon applied discount Rs. 150",
                  style: TextStyle(color: otpColor, fontSize: 12),
                ),
                trailing: Text(
                  "Rs 7.00",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: textColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SaveButton(
                    title: "Payable Amount: Rs. 4771.00",
                    onTap: () {
                      showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      TicketRating()));
                                        },
                                        child: Image.asset("assets/tp.png"))
                                  ],
                                ),
                              ),
                            );
                          }); //Image.asset("assets/tp.png");
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
