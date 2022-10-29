import 'package:flutter/material.dart';
import '../../core/app_color.dart';
import '../../core/widget/app_app_bar.dart';
import '../widget/profile_part.dart';
import '../widget/repo_part.dart';

TextEditingController searchController = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          body: const TabBarView(
            children: [
              ProfilePart(),
              RepoPart(),
            ],
          )),
    );
  }

  Widget homeSearchBar() {
    return AppBar(
      leading: const Icon(
        Icons.search,
        color: aWhite,
        size: 27,
      ),
      title: SizedBox(
        width: double.infinity,
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            fillColor: aWhite,
            filled: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 1),
            ),
            hintText: 'Enter Password',
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: appTextView(
              name: 'Cancel', isBold: true, color: aWhite, size: 17),
        ),
      ],
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
}
