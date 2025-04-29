import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentHistoryScreen extends StatelessWidget {
  final NumberFormat currencyFormat = NumberFormat.currency(
    symbol: '\$',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Payment History'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Card(
              color: Color(0xff1DAB87),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current balance',
                      style: TextStyle(fontSize: 16, color: colorWhite),
                    ),
                    SizedBox(height: 8),
                    Text(
                      currencyFormat.format(12256.00),
                      style: TextStyle(
                        fontSize: 28,
                        color: colorWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.credit_card, size: 20, color: colorWhite),
                        SizedBox(width: 8),
                        Text(
                          'Bank account : 2564  8546  8421',
                          style: TextStyle(fontSize: 16, color: colorWhite),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Partial Transaction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Today's Transactions
            _buildTransactionGroup(
              title: 'Today, Mar 20',
              transactions: [
                _Transaction('Amazon Payment', -59.00, false),
                _Transaction('Sports Payment', -15.99, false),
                _Transaction('Bank of America Deposit', 2045.00, true),
              ],
            ),
            SizedBox(height: 24),
            // Yesterday's Transactions
            _buildTransactionGroup(
              title: 'Yesterday, Dec 28',
              transactions: [
                _Transaction('Bitcoin Deposit', -2550.99, false),
                _Transaction('Paypal Freelance', 2328.00, true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionGroup({
    required String title,
    required List<_Transaction> transactions,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 12),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children:
                transactions
                    .map((transaction) => _buildTransactionItem(transaction))
                    .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(_Transaction transaction) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              transaction.isDeposit ? Icons.arrow_downward : Icons.arrow_upward,
              color: transaction.isDeposit ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4),
                Text(
                  transaction.date,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Text(
            '${transaction.isDeposit ? '+' : '-'}${currencyFormat.format(transaction.amount.abs())}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: transaction.isDeposit ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class _Transaction {
  final String title;
  final double amount;
  final bool isDeposit;
  final String date;

  _Transaction(this.title, this.amount, this.isDeposit)
    : date = DateFormat('hh:mm a').format(DateTime.now());
}
