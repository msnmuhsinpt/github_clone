import 'package:flutter/material.dart';
import 'package:github_clone/core/constants.dart';
import 'package:github_clone/core/widget/app_app_bar.dart';

class RepoPart extends StatelessWidget {
  const RepoPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 14,
            itemBuilder: (context, index) => repoCard(),
            separatorBuilder: (context, index) => dividerSH(),
          ),
        )
      ],
    );
  }

  Widget repoCard() {
    return InkWell(
      child: SizedBox(
        height: 50,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(width: 0.5),
          ),
          child: Center(
              child: appTextView(name: 'Repository', isBold: true, size: 18)),
        ),
      ),
      onTap: () {},
    );
  }
}