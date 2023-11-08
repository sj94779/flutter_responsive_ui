import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_responsive_ui/blogs/controllers/MenuController.dart' as menu;
import '../blogs/components/header.dart';
import 'components/constants.dart';
import 'components/home_screen.dart';
import 'components/side_menu.dart';


class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final menu.MenuController _controller = Get.put(menu.MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Header(),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              child: const SafeArea(child: HomeScreen()),
            ),
          ],
        ),
      ),
    );
  }

}
