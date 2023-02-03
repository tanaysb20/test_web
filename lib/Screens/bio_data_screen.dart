import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_project/Items/custom_list.dart';
import 'package:test_project/Providers/biodata_provier.dart';

class BioDataHomeScreen extends StatefulWidget {
  const BioDataHomeScreen({super.key});

  @override
  State<BioDataHomeScreen> createState() => _BioDataHomeScreenState();
}

class _BioDataHomeScreenState extends State<BioDataHomeScreen> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    Provider.of<BiodataProvider>(context, listen: false)
        .getBioData()
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<BiodataProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text("EV Studios")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.biodataList.length,
              itemBuilder: (context, index) {
                return CustomList(
                  item: items.biodataList[index],
                );
              },
            ),
    );
  }
}
