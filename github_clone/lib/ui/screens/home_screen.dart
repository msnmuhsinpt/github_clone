import 'dart:developer';

import 'package:flutter/material.dart';
import '../../core/app_color.dart';
import '../../core/widget/app_app_bar.dart';
import '../../data/model/search_model.dart';
import '../widget/profile_part.dart';
import '../widget/repo_part.dart';

//search
bool isSearch = false;
String searchName = '';
TextEditingController searchController = TextEditingController();
List<SearchModel> searchModel = [];
List<SearchModel> tempSearchModelList = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: const Duration(microseconds: 1000),
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: homeSearchBar(),
        ),
        body: TabBarView(
          children: [
            ProfilePart(
              searchedName: searchController.text.toString(),
            ),
            RepoPart(searchedName: searchController.text.toString()),
          ],
        ),
      ),
    );
  }

  Widget homeSearchBar() {
    return AppBar(
      title: SizedBox(
        width: double.infinity,
        child: TextField(
          controller: searchController,
          onChanged: (value) {
            //data fetch
            onItemChanged(value);
            log('Name>>>${searchController.text}');
          },
          decoration: InputDecoration(
            fillColor: aWhite,
            filled: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 2),
            suffixIcon: IconButton(
              onPressed: () {
                isSearch ? clearSearch() : doSearch();
              },
              icon: isSearch
                  ? const Icon(
                      Icons.clear,
                      color: Colors.black,
                    )
                  : const Icon(Icons.search, color: Colors.black),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 1),
            ),
            hintText: 'Search....',
          ),
        ),
      ),
      bottom: TabBar(
        isScrollable: true,
        indicator: BoxDecoration(
          color: aWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        tabs: [
          Tab(
            child: appTextView(
              name: "Profile",
              isBold: true,
              size: 16,
            ),
          ),
          Tab(
            child: appTextView(
              name: 'Repository',
              isBold: true,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  onItemChanged(String value) {
    if (value == "") {
      setState(() {
        isSearch = false;
        tempSearchModelList.clear();
      });
    } else {
      setState(() {
        isSearch = true;
        tempSearchModelList = searchModel
            .where((SearchModel data) =>
                data.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  ///search
  clearSearch() {
    setState(() {
      searchController.clear();
      isSearch = false;
    });

  }

  doSearch() {
    setState(() {
      onItemChanged(searchController.text.toString());

    });
  }
}
