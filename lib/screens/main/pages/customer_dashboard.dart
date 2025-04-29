import 'package:erp/screens/add/add_customer.dart';
import 'package:erp/screens/view/view_customer.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/listTile_widget.dart';
import 'package:flutter/material.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCustomer()),
          );
        },
        backgroundColor: buttonColor,
        child: Icon(Icons.add, color: colorWhite),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [Image.asset("assets/notification.png")],
        title: const Text(
          "Customer Dashboard",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTileWidget(
            title: "Fawad Kaleem",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => ViewCustomer()),
              );
            },
            subTitle: "Created At: 21 December 2023",
          );
        },
      ),
    );
  }
}
