import 'package:flutter/material.dart';
import 'package:payment_apps_flutter/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xff007DFF)
                  : Color(0xff4D5B7C),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/check_two.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/check_one.png',
                          width: 18,
                          height: 18,
                        ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: planTextStyle,
                      ),
                      Text(
                        subTitle,
                        style: descTextStyle,
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    pricing,
                    style: priceTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/icon_one.png',
                width: 267,
                height: 200,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to ',
                  style: titleTextStyle,
                ),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Go unlock all features and \nbuild your own business bigger',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkOutButton() {
      return Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff007DFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(71))),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112F),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                SizedBox(
                  height: 50,
                ),
                option(
                  0,
                  'Monthly',
                  'Good for starting up',
                  '\$20',
                ),
                option(
                  1,
                  'Quarterly',
                  'Focusing on building',
                  '\$55',
                ),
                option(
                  2,
                  'Yearly',
                  'Steady company',
                  '\$220',
                ),
                selectedIndex == -1 ? SizedBox() : checkOutButton(),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
