import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/screens/main_dashboard.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/controllers.dart';
import 'package:partymania_users/utils/textformfield.dart';
import 'package:uuid/uuid.dart';

class TicketPayment extends StatefulWidget {
  final eventUuid;
  final eventCost;
  final coupleValue;
  final numofseats;
  final coupon;
  final clubuid;
  final fromTime;
  const TicketPayment({
    super.key,
    required this.coupleValue,
    required this.eventCost,
    required this.eventUuid,
    required this.fromTime,
    required this.numofseats,
    required this.coupon,
    required this.clubuid,
  });

  @override
  State<TicketPayment> createState() => _TicketPaymentState();
}

class _TicketPaymentState extends State<TicketPayment> {
  bool _isLoading = false;
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
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return new CircularProgressIndicator();
            }
            var document = snapshot.data;
            return SingleChildScrollView(
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
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 335,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: textColor, width: .3)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            widget.coupleValue,
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
                                          widget.fromTime,
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
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    MainScreen()));
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: otpColor,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                        style: TextStyle(
                            color: textColor.withOpacity(.7), fontSize: 12),
                      ),
                      subtitle: Text(
                        "(Rs. 1 per ticket has been added) Remove",
                        style: TextStyle(
                            color: textColor.withOpacity(.7), fontSize: 10),
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
                        "Rs" + widget.eventCost.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: textColor),
                      ),
                    ),
                    Center(
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SaveButton(
                                  title: "Payable Amount: Rs" +
                                      widget.eventCost.toString(),
                                  onTap: () async {
                                    var bookid = Uuid().v4();
                                    await FirebaseFirestore.instance
                                        .collection("bookings")
                                        .doc(bookid)
                                        .set({
                                      "uid": FirebaseAuth
                                          .instance.currentUser!.uid,
                                      "seats": widget.numofseats,
                                      "cost": widget.eventCost,
                                      "offer": "No",
                                      "clubid": widget.clubuid,
                                      "eventuuid": widget.eventUuid,
                                      "paymentmode": "Online Payment",
                                      'coupon': coupon.text == "" ||
                                              coupon.text == null
                                          ? null
                                          : "$coupon.text",
                                      "bookinguuid": bookid,
                                      "name": document['fullName'],
                                      "phone": document['phone_Number'],
                                      "email": document['email']
                                    }).then((value) => {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Booking is Completed"))),
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (builder) =>
                                                          MainScreen()))
                                            });
                                  }),
                            ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
