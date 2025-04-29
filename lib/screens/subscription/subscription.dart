import 'package:erp/screens/subscription/subscription_plan.dart';
import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          kToolbarHeight + 20,
        ), // Extra space for gradient
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0E9F99), // Purple
                Color(0xFFFFFFFF), // Darker purple
              ],
            ),
          ),
          child: AppBar(
            title: Text('How your trial works'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'First 7 days free, then \$12.99/month',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 1),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Annual', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Monthly', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            Divider(thickness: 1),
            SizedBox(height: 20),
            _buildTimelineItem(
              title: 'Today',
              description:
                  'Unlock our library of meditations, sleep sounds, and more.',
            ),
            SizedBox(height: 20),
            _buildTimelineItem(
              title: 'In 5 days',
              description:
                  'We\'ll send you a reminder that your trial is ending soon.',
            ),
            SizedBox(height: 20),
            _buildTimelineItem(
              title: 'In 7 days',
              description:
                  'You\'ll be charged on March 28, cancel anytime before.',
            ),
            SizedBox(height: 20),
            Divider(thickness: 1),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Restore Purchase',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: buttonColor, // Button color
                ),
                onPressed: () {
                  // Handle the button press here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SubscriptionPlan()),
                  );
                },
                child: Text(
                  'Start my free trial',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(description, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
