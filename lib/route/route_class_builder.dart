import 'package:flutter_app/view/screens/employees/employees_screen.dart';
import 'package:flutter_app/view/screens/home/home_screen.dart';
import 'package:flutter_app/view/screens/info/info_portal_screen.dart';
import 'package:flutter_app/view/screens/profile/edit_profile_screen.dart';
import 'package:flutter_app/view/screens/team/my_team_screen.dart';
import 'package:flutter_app/view/screens/vacations/vacations_screeen.dart';

typedef Constructor<T> = T Function();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class RouteClassBuilder {
  static void registerClasses() {
    register<HomeScreen>(() => HomeScreen());
    register<EditProfileScreen>(() => EditProfileScreen());
    register<EmployeesScreen>(() => EmployeesScreen());
    register<MyTeamScreen>(() => MyTeamScreen());
    register<VacationsScreen>(() => VacationsScreen());
    register<InfoPortalScreen>(() => InfoPortalScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
