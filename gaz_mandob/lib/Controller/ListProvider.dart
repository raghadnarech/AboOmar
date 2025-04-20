import 'package:gaz_mandob/Controller/LanguageProvider.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> listproviders = [
  ChangeNotifierProvider<LanguageProvider>(
    create: (context) => LanguageProvider(),
  ),
];
