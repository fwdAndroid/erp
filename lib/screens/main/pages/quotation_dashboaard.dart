import 'package:erp/screens/add/add_quotation.dart';
import 'package:erp/screens/view/view_quotation.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/quotation_list_tile_widget.dart';
import 'package:flutter/material.dart';

class QuotationDashboaard extends StatefulWidget {
  const QuotationDashboaard({super.key});

  @override
  State<QuotationDashboaard> createState() => _QuotationDashboaardState();
}

class _QuotationDashboaardState extends State<QuotationDashboaard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddQuotation()),
          );
        },
        backgroundColor: buttonColor,
        child: Icon(Icons.add, color: colorWhite),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [Image.asset("assets/notification.png")],
        title: const Text(
          "Quotation Dashboard",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return QuotationListTileWidget(
            title: "Managing Oil Transformer",
            startDate: "Start Date : 21 December 2023",
            onShare: () {
              // Share.share("Fawad Kaleem");
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => ViewQuotation()),
              );
            },
            subTitle: "Created At: 21 December 2023",
            totalBudget: "Total Budget: 1000\$",
          );
        },
      ),
    );
  }
}
