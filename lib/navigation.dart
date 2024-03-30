import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/features/personalization/screens/settings/settings.dart';
import 'features/booking/screens/Home/home.dart';
import 'features/booking/screens/notification/notifications.dart';
import 'features/booking/screens/appointment/schedual.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = MedicaHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? MedicaColors.dark : MedicaColors.white,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior
              .alwaysHide, // Set label behavior,
          destinations: [
            NavigationDestination(
                icon: Icon(
                  controller.selectedIndex.value == 0
                      ? Iconsax.home1
                      : Iconsax.home,
                  color: MedicaColors.primary,
                ),
                label: "home"),
            NavigationDestination(
                icon: Icon(
                  controller.selectedIndex.value == 1
                      ? Iconsax.notification1
                      : Iconsax.notification,
                  color: MedicaColors.primary,
                ),
                label: "notifications"),
            NavigationDestination(
                icon: Icon(
                  controller.selectedIndex.value == 2
                      ? Iconsax.calendar5
                      : Iconsax.calendar,
                  color: MedicaColors.primary,
                ),
                label: "schedual"),
            NavigationDestination(
                icon: Icon(
                  controller.selectedIndex.value == 3
                      ? Iconsax.heart5
                      : Iconsax.heart,
                  color: MedicaColors.primary,
                ),
                label: "pharmacy"),
            NavigationDestination(
                icon: Icon(
                  controller.selectedIndex.value == 4
                      ? Iconsax.user1
                      : Iconsax.user,
                  color: MedicaColors.primary,
                ),
                label: "user"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const Home(title: "home"),
    const NotificationsPage(),
    const SchedualPage(),
    Container(color: Colors.yellow),
    const SettingsScreen(),
  ];
}
