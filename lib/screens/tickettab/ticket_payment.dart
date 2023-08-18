import 'package:flutter/material.dart';
import 'package:partymania_users/screens/tickettab/ticket_rating.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/controllers.dart';
import 'package:partymania_users/utils/textformfield.dart';

class TicketPayment extends StatefulWidget {
  const TicketPayment({super.key});

  @override
  State<TicketPayment> createState() => _TicketPaymentState();
}

class _TicketPaymentState extends State<TicketPayment> {
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
                  "Tickets",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 260,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: 335,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: textColor, width: .3)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/g.png",
                                              height: 18,
                                              width: 18,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "2 Couple",
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Guestlist",
                                          style: TextStyle(color: grey),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Free",
                                            style: TextStyle(
                                                color: otpColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "Before 9:30 PM",
                                            style: TextStyle(
                                                color: textColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                        width: 6,
                                      ),
                                      Icon(
                                        Icons.delete,
                                        color: otpColor,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
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
