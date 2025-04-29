import 'package:erp/screens/main/main_dashboard.dart';
import 'package:erp/screens/subscription/subscription_payment_method.dart';
import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class SubscriptionPlan extends StatefulWidget {
  @override
  _SubscriptionPlanState createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  String? _selectedPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0E9F99),
      appBar: AppBar(
        backgroundColor: Color(0xff0E9F99),
        iconTheme: IconThemeData(color: colorWhite),
        title: Text('Subscription', style: TextStyle(color: colorWhite)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/Group 54223.png",
                width: 78,
                height: 78,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Unlimited SSAS SYSTEM ACCESS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorWhite,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Get access to unlimited access',
              style: TextStyle(fontSize: 16, color: colorWhite),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSelectableCard('STARTER', '\$20'),
                _buildSelectableCard('GROWTH', '\$120'),
                _buildSelectableCard('PRO', '\$1220'),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _selectedPlan == 'STARTER'
                            ? '\$20'
                            : _selectedPlan == 'GROWTH'
                            ? '\$120'
                            : _selectedPlan == 'PRO'
                            ? '\$1220'
                            : '\$120',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubscriptionPaymentMethod(),
                          ),
                        );
                      },

                      child: Text(
                        'CONTINUE',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  print('Continuing without subscription');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainDashboard()),
                  );
                },
                child: Text(
                  'CONTINUE WITHOUT SUBSCRIPTION',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableCard(String title, String price) {
    bool isSelected = _selectedPlan == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = title;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 100,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[100] : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected ? Colors.green[800] : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.green[800] : Colors.deepPurple,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
