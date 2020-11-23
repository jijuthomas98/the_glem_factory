import 'package:flutter/material.dart';

class SubPackageSelector extends StatefulWidget {
  @override
  _SubPackageSelectorState createState() => _SubPackageSelectorState();
}

class _SubPackageSelectorState extends State<SubPackageSelector> {
  List<String> subPackage = [
    'Best Deal',
    'Bridal Package',
    'Premium Package',
    'Facial + Wax Combo'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 25,
        child: ListView.builder(
          itemCount: subPackage.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return buildSubPackage(index);
          },
        ),
      ),
    );
  }

  Widget buildSubPackage(int index) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          subPackage[index],
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: selectedIndex == index ? 17 : 15,
            color: selectedIndex == index ? Color(0xffff7d85) : Colors.black87,
          ),
        ),
      ),
    );
  }
}
