import 'package:flutter/material.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/controllers.dart';
import 'package:partymania_users/utils/textformfield.dart';

class ManageWallets extends StatefulWidget {
  const ManageWallets({super.key});

  @override
  State<ManageWallets> createState() => _ManageWalletsState();
}

class _ManageWalletsState extends State<ManageWallets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        centerTitle: true,
        title: Text(
          "Wallet",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Center(
          child: Container(
            width: 335,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: textColor, width: .3)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wallet Current Balance",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rs. 450.00",
                          style: TextStyle(
                              color: otpColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "23 March 2023",
                          style: TextStyle(
                              color: grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: TextFormInputField(
                          suIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Withdraw",
                                style:
                                    TextStyle(color: textColor, fontSize: 12),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: otpColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  fixedSize: Size(100, 32)),
                            ),
                          ),
                          controller: walletController,
                          hintText: "Enter Amount",
                          textInputType: TextInputType.text),
                    )
                  ],
                )),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          "You can withdraw the amount, when you get Rs. 1000 in your wallet",
          style: TextStyle(color: grey, fontSize: 9),
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Wallet Statement",
              style: TextStyle(
                  color: grey, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: grey,
            )),
        SizedBox(
          height: 400,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                        trailing: const Text(
                          "+150.00",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        title: Text(
                          "1 Invites initiated",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "23 march 2023",
                          style: TextStyle(
                              color: textColor.withOpacity(.7),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: grey,
                        )),
                  ],
                );
              }),
        ),
      ]),
    );
  }
}
