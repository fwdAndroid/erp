import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp/screens/setting_pages/add_discount_setting.dart';
import 'package:erp/uitl/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewDiscountSetting extends StatefulWidget {
  const ViewDiscountSetting({super.key});

  @override
  State<ViewDiscountSetting> createState() => _ViewDiscountSettingState();
}

class _ViewDiscountSettingState extends State<ViewDiscountSetting> {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discount Settings",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddDiscountSetting()),
          );
        },
        backgroundColor: buttonColor,
        child: Icon(Icons.add, color: colorWhite),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection('discount')
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
                  Icon(Icons.discount, size: 40, color: buttonColor),
                  Text("No Discount available"),
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
                child: Card(
                  child: ListTile(
                    title: Text(post['discountName']),
                    subtitle: Text("Tax Percentage: ${post['discountValue']}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('discount')
                            .doc(posts[index].id)
                            .delete();
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
