import 'package:flutter/material.dart';
import 'package:github_clone/core/constans.dart';
import 'package:github_clone/core/widget/app_app_bar.dart';

class RepoPart extends StatelessWidget {
  const RepoPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) => ListTile(
          leading: appTextView(name: 'RepoName', isBold: true),
          trailing: appTextView(name: 'RepoFull Name'),
        ),
        separatorBuilder: (context, index) => dividerSH(),
      )
    ]);
  }
}
