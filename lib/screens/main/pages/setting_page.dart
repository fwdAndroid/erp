import 'package:erp/screens/payment/payment_screen.dart';
import 'package:erp/screens/setting_pages/add_discount_setting.dart';
import 'package:erp/screens/setting_pages/view_tax_setting.dart';
import 'package:erp/screens/subscription/subscription.dart';
import 'package:erp/widgets/logout_widget.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text("Account"),
              subtitle: const Text("Account Information and Preferences"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.taxi_alert,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text("Add Tax"),
              subtitle: const Text("Add Tax"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => ViewTaxSetting()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.discount,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text("Add Discount "),
              subtitle: const Text("Add Discount "),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => AddDiscountSetting()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.subscript,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text("Subscription "),
              subtitle: const Text("Subscription "),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => SubscriptionPage()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.payment,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text("Payments"),
              subtitle: const Text("Payments"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => PaymentHistoryScreen(),
                  ),
                );
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LogoutWidget();
                  },
                );
              },
              child: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
