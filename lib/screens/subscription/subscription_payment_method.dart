import 'package:erp/screens/subscription/subscription_conformation_screen.dart';
import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class SubscriptionPaymentMethod extends StatefulWidget {
  @override
  _SubscriptionPaymentMethodState createState() =>
      _SubscriptionPaymentMethodState();
}

class _SubscriptionPaymentMethodState extends State<SubscriptionPaymentMethod> {
  String? _selectedPaymentMethod;
  final TimeOfDay _time = TimeOfDay(hour: 9, minute: 41);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(_time.format(context), style: TextStyle(fontSize: 16)),
        ),
        leadingWidth: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Unlimited SSAS SYSTEM ACCESS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: buttonColor, // Deep purple
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Get access to unlimited access',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 30),
            Text(
              'Select Payment Type',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            _buildPaymentOption(
              'Jazz Cash',
              'assets/jazzcash.png',
            ), // Add your asset
            SizedBox(height: 15),
            _buildPaymentOption(
              'Stripe',
              'assets/stripe.png',
            ), // Add your asset
            SizedBox(height: 15),
            _buildPaymentOption(
              'SADDAD',
              'assets/saddad.png',
            ), // Add your asset
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor, // Deep purple
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => SubscriptionConformationScreen(),
                    ),
                  );
                },
                child: Text(
                  'Done',
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
    );
  }

  Widget _buildPaymentOption(String title, String iconPath) {
    bool isSelected = _selectedPaymentMethod == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = title;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? buttonColor
                  : Colors.white, // Light purple when selected
          border: Border.all(
            color:
                isSelected
                    ? buttonColor
                    : Colors.grey[300]!, // Deep purple border when selected
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Uncomment when you have icons
            // Image.asset(
            //   iconPath,
            //   width: 24,
            //   height: 24,
            // ),
            // SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? colorWhite : Colors.black,
              ),
            ),
            Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: buttonColor,
              ), // Deep purple checkmark
          ],
        ),
      ),
    );
  }
}
