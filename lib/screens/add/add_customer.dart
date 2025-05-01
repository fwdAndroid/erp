import 'package:erp/screens/conformation_screen/customer_conformation_screen.dart';
import 'package:erp/services/database.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/add_item_widget.dart';
import 'package:erp/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bussinessController = TextEditingController();
  List<String> currencies = ['USD', 'EUR', 'INR', 'GBP', 'JPY'];
  TextEditingController taxCategoryController = TextEditingController();
  List<String> countries = [
    'United States',
    'India',
    'United Kingdom',
    'Canada',
    'Australia',
  ];
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String? selectedCountry;
  String? selectedCurrency;
  TextEditingController shippingNameController = TextEditingController();
  TextEditingController shippingBussinessController = TextEditingController();
  TextEditingController assignDateController = TextEditingController();
  TextEditingController shippingAddressController = TextEditingController();
  TextEditingController shippingCityController = TextEditingController();
  List<Map<String, dynamic>> selectedItems = [];
  TextEditingController taxIdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Customer',
          style: TextStyle(fontWeight: FontWeight.bold, color: colorBlack),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add Information",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorBlack,
                  fontSize: 19,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormInputFeildWidget(
                controller: nameController,
                hintText: "Customer Name",
                textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: TextFormInputFeildWidget(
                controller: emailController,
                hintText: "Email Address",
                textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: TextFormInputFeildWidget(
                controller: bussinessController,
                hintText: "Bussiness Name",
                textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: IntlPhoneField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                initialCountryCode: 'US', // Default country
                controller: phoneController,
                onChanged: (phone) {
                  print('Full phone number: ${phone.completeNumber}');
                },
                onCountryChanged: (country) {
                  print('Country changed to: ${country.name}');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Currency',
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: const BorderSide(color: Color(0xffF0F3F6)),
                  ),
                ),
                value: selectedCurrency,
                items:
                    currencies.map((currency) {
                      return DropdownMenuItem(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: TextFormInputFeildWidget(
                controller: taxCategoryController,
                hintText: "Tax Category",
                textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: TextFormInputFeildWidget(
                controller: taxIdController,
                hintText: "Tax ID",
                textInputType: TextInputType.text,
              ),
            ),
            ExpansionTile(
              title: Text(
                'Billing Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorBlack,
                  fontSize: 19,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: selectedCountry,
                    items:
                        countries.map((country) {
                          return DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: TextFormInputFeildWidget(
                    controller: addressController,
                    hintText: "Address",
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: TextFormInputFeildWidget(
                    controller: cityController,
                    hintText: "City",
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Shipping Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorBlack,
                  fontSize: 19,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: TextFormInputFeildWidget(
                    controller: shippingNameController,
                    hintText: "Name",
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: TextFormInputFeildWidget(
                    controller: shippingBussinessController,
                    hintText: "Bussiness Name",
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: TextFormInputFeildWidget(
                    controller: assignDateController,
                    hintText: "Assigned Date",
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: selectedCountry,
                    items:
                        countries.map((country) {
                          return DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: TextFormInputFeildWidget(
                    controller: shippingAddressController,
                    hintText: "Address",
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: TextFormInputFeildWidget(
                    controller: shippingCityController,
                    hintText: "City",
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () async {
                // Handle save action
                final result = await showDialog<Map<String, dynamic>>(
                  context: context,
                  builder: (BuildContext context) {
                    return AddItemWidget();
                  },
                );

                if (result != null) {
                  setState(() {
                    selectedItems.add(result);
                  });
                }
              },
              child: Text(
                'Add Item',
                style: TextStyle(color: buttonColor, fontSize: 18),
              ),
            ),
            if (selectedItems.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      selectedItems.map((item) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text("Name: ${item['name'] ?? ''}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (item['price'] != null)
                                  Text("Price: ${item['price']}"),
                                if (item['description'] != null)
                                  Text("Desc: ${item['description']}"),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            TextButton(
              onPressed: () {
                // Handle save action
              },
              child: Text(
                'Attach Document',
                style: TextStyle(color: buttonColor, fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () async {
                    await Database().addCustomer(
                      assignedDate: assignDateController.text,
                      customerName: nameController.text,
                      customerBussinessName: bussinessController.text,
                      customerEmail: emailController.text,
                      customerPhoneNumber: '1234567890',
                      currency: selectedCurrency!,
                      taxCategory: taxCategoryController.text,
                      taxId: taxIdController.text,
                      billingCountry: selectedCountry!,
                      billingAddress: addressController.text,
                      billingCity: cityController.text,
                      shippingAddress: shippingAddressController.text,
                      shippingCity: shippingCityController.text,
                      shippingCountry: selectedCountry!,
                      items: selectedItems ?? [],
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => CustomerConformationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: colorWhite),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
