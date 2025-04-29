import 'package:erp/screens/main/pages/customer_dashboard.dart';
import 'package:erp/screens/main/pages/expense_dashboard.dart';
import 'package:erp/screens/main/pages/invoice_dashboard.dart';
import 'package:erp/screens/main/pages/quotation_dashboaard.dart';
import 'package:erp/screens/main/pages/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    CustomerDashboard(),
    QuotationDashboaard(),
    InvoiceDashboard(),
    ExpenseDashboard(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await _showExitDialog(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                height: 27,
                width: 27,
                _currentIndex == 0
                    ? "assets/home_blue.png"
                    : "assets/home_blue.png",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                height: 27,
                width: 27,
                _currentIndex == 1
                    ? "assets/fav_blue.png"
                    : "assets/fav_blue.png",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                height: 27,
                width: 27,
                _currentIndex == 2
                    ? "assets/add_blue.png"
                    : "assets/add_blue.png",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                height: 27,
                width: 27,
                _currentIndex == 3
                    ? "assets/chat_blue.png"
                    : "assets/chat_blue.png",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                height: 27,
                width: 27,
                _currentIndex == 4
                    ? "assets/category.png"
                    : "assets/category.png",
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> _showExitDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
    );
  }
}
