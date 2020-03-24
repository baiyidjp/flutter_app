import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'counter_store.dart';
import 'user_info_store.dart';
import '../model/user_info_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => CounterStore()),
  ChangeNotifierProvider(create: (context) => UserInfoStore(UserInfoModel('名字', 20, 1.88))),
];