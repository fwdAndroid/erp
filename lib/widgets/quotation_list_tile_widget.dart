import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class QuotationListTileWidget extends StatelessWidget {
  final String subTitle;
  final VoidCallback? onTap;
  final String title; // Optional onChanged callback
  final String startDate;
  final VoidCallback? onShare;
  final String totalBudget;

  const QuotationListTileWidget({
    Key? key,
    required this.subTitle,
    required this.startDate,
    required this.onShare,
    required this.totalBudget,

    this.onTap,

    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subTitle,
              style: const TextStyle(fontSize: 14, color: Color(0xffA3A8AC)),
            ),
            Text(
              totalBudget,
              style: TextStyle(
                fontSize: 15,
                color: colorBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              startDate,
              style: TextStyle(
                fontSize: 15,
                color: colorBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.share, color: buttonColor),
          onPressed: onShare,
        ),
      ),
    );
  }
}
