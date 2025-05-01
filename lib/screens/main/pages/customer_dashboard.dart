import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp/screens/add/add_customer.dart';
import 'package:erp/screens/view/view_customer.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/listTile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

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
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection('customer')
                .where("uid", isEqualTo: currentUserId)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_off, size: 40, color: buttonColor),
                  Text("No Customer available"),
                ],
              ),
            );
          }

          var posts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              var post = posts[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTileWidget(
                  title: post['customerName'] ?? "No Name",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (builder) => ViewCustomer()),
                    );
                  },
                  subTitle: post['assignedDate'],
                ),
              );
            },
          );
        },
      ),
      // body: ListView.builder(
      //   itemBuilder: (context, index) {
      // return ListTileWidget(
      //   title: "Fawad Kaleem",
      //   onTap: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (builder) => ViewCustomer()),
      //     );
      //   },
      //   subTitle: "Created At: 21 December 2023",
      // );
      //   },
      // ),
    );
  }
}
