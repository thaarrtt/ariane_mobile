import 'package:hive_flutter/hive_flutter.dart';
import 'package:ariane_mobile/common/utils/app_key.dart';
import 'package:loggy/loggy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_service.g.dart';

@Riverpod(keepAlive: true)
UserService userService(UserServiceRef ref) => UserService();

class UserService {
  late final Box<bool> boarding;
  late final Box<String> jwtBox;
  late final Box<String> idBox;

  Future<void> init() async {
    jwtBox = await Hive.openBox<String>(AppKey.jwt);
    idBox = await Hive.openBox<String>(AppKey.id);
    boarding = await Hive.openBox<bool>(AppKey.board);
    logInfo('init success');
  }

  // AUTH TOKEN VAR
  String? fetch() => jwtBox.getAt(0);
  Future<void> set(String jwt) async => await jwtBox.put(0, jwt);
  Future<void> del() async => await jwtBox.deleteAt(0);

  // ON BOARDING PAGE VAR
  bool isBoard() {
    try {
      return boarding.getAt(0) ?? true;
    } catch (e) {
      return true;
    }
  }

  Future<void> disableBoard() async => await boarding.put(0, false);
  Future<void> deleteBoardKeys() async => await boarding.deleteFromDisk();

  // UID Var
  String? fetchId() => idBox.getAt(0);
  Future<void> setId(String id) async => await idBox.put(0, id);
}
