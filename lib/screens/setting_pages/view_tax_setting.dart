import 'package:erp/screens/setting_pages/add_tax_setting.dart';
import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class ViewTaxSetting extends StatefulWidget {
  const ViewTaxSetting({super.key});

  @override
  State<ViewTaxSetting> createState() => _ViewTaxSettingState();
}

class _ViewTaxSettingState extends State<ViewTaxSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaxSetting()),
          );
        },
        backgroundColor: buttonColor,
        child: Icon(Icons.add, color: colorWhite),
      ),
    );
  }
}
