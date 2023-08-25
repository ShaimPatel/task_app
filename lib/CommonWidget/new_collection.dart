// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:vega/CommonWidget/collection_widget.dart';
import 'package:vega/Utils/AppColors/app_colors.dart';
import 'package:vega/View/Product/product_details_page.dart';

import '../Utils/AppTxetStyle/text_style.dart';

class NewCollectionPage extends StatefulWidget {
  final Map<String, dynamic> jsonData;

  const NewCollectionPage({
    Key? key,
    required this.jsonData,
  }) : super(key: key);

  @override
  State<NewCollectionPage> createState() => _NewCollectionPageState();
}

class _NewCollectionPageState extends State<NewCollectionPage> {
  //!
  TextEditingController editingController = TextEditingController();
  List<dynamic> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = widget.jsonData['newCollection']['items'];
  }

  //! To Search The Item Into the List ..

  void filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = widget.jsonData['newCollection']['items'];
      } else {
        filteredItems = widget.jsonData['newCollection']['items'].where((item) {
          final String name = item['name'].toString().toLowerCase();
          final String description =
              item['description'].toString().toLowerCase();
          return name.contains(query.toLowerCase()) ||
              description.contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.jsonData.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Loading...'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            widget.jsonData['newCollection']['BannerTitle'],
            style: AppTextStyle.produxtTitleName,
          ),
          elevation: 1,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterItems(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                  labelText: "Search new collection",
                  hintText: "Search",
                  hintStyle: AppTextStyle.offerDescription,
                  labelStyle: AppTextStyle.offerDescription,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: filteredItems.length - 1,
                  itemBuilder: (BuildContext context, int index) {
                    final item = filteredItems[index];
                    // print(item);
                    return InkWell(
                      onTap: () {
                        // print(jsonData['newCollection']['items'][0]['sizes']);
                        // print(item['id'].toString());
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ProductDetailsPage(
                                  id: item['id'],
                                  jsonData: widget.jsonData,
                                )));
                      },
                      child: CollectionWidget(
                        id: item['id'].toString(),
                        description: item['description'].toString(),
                        discount: item['discount'].toString(),
                        name: item['name'].toString(),
                        price: item['Price'].toString(),
                        image: Image(
                          image: NetworkImage(item['image']),
                        ).image,
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    }
  }
}
