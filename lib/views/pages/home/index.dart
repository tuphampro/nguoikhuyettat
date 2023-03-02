import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());

  HomePage({Key? key}) : super(key: key);
  showBottomSheet() {
    Get.bottomSheet(
      isScrollControlled: true,
      SizedBox(
        height: Get.size.height * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Title",
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  Icon(Icons.close),
                ],
              ),
            ),
            Divider(height: 2, thickness: 1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bottom Sheet',
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      isDismissible: true,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3),
          topRight: Radius.circular(3),
        ),
      ),
    );
  }

  showDialog() async {}

  Widget itemBuilder(BuildContext context, int index) {
    final user = controller.listData[index];

    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.age.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: controller.listData.length,
        shrinkWrap: true,
      ),
    );
  }
}
