import 'package:get/get.dart';

import '../modules/FamilyInfoScreen/bindings/family_info_screen_binding.dart';
import '../modules/FamilyInfoScreen/views/family_info_screen_view.dart';
import '../modules/FinanceReportScreen/bindings/finance_report_screen_binding.dart';
import '../modules/FinanceReportScreen/views/finance_report_screen_view.dart';
import '../modules/HomeScreen/bindings/home_screen_binding.dart';
import '../modules/HomeScreen/views/home_screen_view.dart';
import '../modules/ListFamilyScreen/bindings/list_family_screen_binding.dart';
import '../modules/ListFamilyScreen/views/list_family_screen_view.dart';
import '../modules/ListMemberScreen/bindings/list_member_screen_binding.dart';
import '../modules/ListMemberScreen/views/list_member_screen_view.dart';
import '../modules/ListVehicleScreen/bindings/list_vehicle_screen_binding.dart';
import '../modules/ListVehicleScreen/views/list_vehicle_screen_view.dart';
import '../modules/LoginScreen/bindings/login_screen_binding.dart';
import '../modules/LoginScreen/views/login_screen_view.dart';
import '../modules/MainScreen/bindings/main_screen_binding.dart';
import '../modules/MainScreen/views/main_screen_view.dart';
import '../modules/PersonalInfoScreen/bindings/personal_info_screen_binding.dart';
import '../modules/PersonalInfoScreen/views/personal_info_screen_view.dart';
import '../modules/ProfileScreen/bindings/profile_screen_binding.dart';
import '../modules/ProfileScreen/views/profile_screen_view.dart';
import '../modules/RegisterScreen/bindings/register_screen_binding.dart';
import '../modules/RegisterScreen/views/register_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SCREEN,
      page: () => const RegisterScreenView(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_SCREEN,
      page: () => const MainScreenView(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFO_SCREEN,
      page: () => const PersonalInfoScreenView(),
      binding: PersonalInfoScreenBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_INFO_SCREEN,
      page: () => const FamilyInfoScreenView(),
      binding: FamilyInfoScreenBinding(),
    ),
    GetPage(
      name: _Paths.LIST_MEMBER_SCREEN,
      page: () => const ListMemberScreenView(),
      binding: ListMemberScreenBinding(),
    ),
    GetPage(
      name: _Paths.LIST_FAMILY_SCREEN,
      page: () => const ListFamilyScreenView(),
      binding: ListFamilyScreenBinding(),
    ),
    GetPage(
      name: _Paths.FINANCE_REPORT_SCREEN,
      page: () => const FinanceReportScreenView(),
      binding: FinanceReportScreenBinding(),
    ),
    GetPage(
      name: _Paths.LIST_VEHICLE_SCREEN,
      page: () => const ListVehicleScreenView(),
      binding: ListVehicleScreenBinding(),
    ),
  ];
}
