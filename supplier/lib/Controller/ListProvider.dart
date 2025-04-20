import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:supplier/Controller/LanguageProvider.dart';
import 'package:supplier/View/Auth/Signup/Controller/SignupController.dart';
import 'package:supplier/View/MainCategorey/Controller/MainCategoriesController.dart';
import 'package:supplier/View/MainCategorey/Edit/Controller/EditMainCategoryController.dart';
import 'package:supplier/View/MainCategorey/MainCategoriesPage.dart';
import 'package:supplier/View/Product/Edit/Controller/EditProductController.dart';
import 'package:supplier/View/SubCategorey/Edit/Controller/EditeSubCategoreyController.dart';

List<SingleChildWidget> listproviders = [
  ChangeNotifierProvider<LanguageProvider>(
    create: (context) => LanguageProvider(),
  ),
  ChangeNotifierProvider<SignupController>(
    create: (context) => SignupController(),
  ),
  ChangeNotifierProvider<MainCategoriesController>(
    create: (context) => MainCategoriesController(),
    child: MainCategoriesPage(),
  ),
  ChangeNotifierProvider<EditMainCategoryController>(
    create: (context) => EditMainCategoryController(),
  ),
  ChangeNotifierProvider<EditeSubCategoreyController>(
    create: (context) => EditeSubCategoreyController(),
  ),
  ChangeNotifierProvider<EditProductController>(
    create: (context) => EditProductController(),
  )
];
