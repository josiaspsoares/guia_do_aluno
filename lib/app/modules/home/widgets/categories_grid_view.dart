import 'package:flutter/material.dart';
import 'package:guia_do_aluno/app/modules/auth/models/user_model.dart';
import 'package:guia_do_aluno/app/modules/home/models/category_model.dart';
import 'package:guia_do_aluno/app/modules/home/widgets/category_card.dart';
import 'package:guia_do_aluno/app/shared/themes/app_images.dart';
import 'package:sizer/sizer.dart';

List<CategoryModel> categories = [
  CategoryModel(
    text: 'Disciplinas',
    imageUrl: AppImages.classesCategory,
    route: '/disciplinas',
  ),
  CategoryModel(
    text: 'Professores',
    imageUrl: AppImages.professorsCategory,
    route: '/professores',
  ),
  CategoryModel(
    text: 'Materiais',
    imageUrl: AppImages.coursewareCategory,
    route: '/materiais',
  ),
  CategoryModel(
    text: 'Avisos',
    imageUrl: AppImages.noticesCategory,
    route: '/avisos',
  ),
];

class CategoriesGridView extends StatelessWidget {
  final UserModel user;
  const CategoriesGridView({Key? key, required this.user}) : super(key: key);

  List<CategoryCard> getCategoryCards(
      {required List<CategoryModel> categories}) {
    List<CategoryCard> categoryCards = [];

    for (var category in categories) {
      categoryCards.add(
        CategoryCard(
          model: category,
          user: user,
        ),
      );
    }

    return categoryCards;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2.h,
      crossAxisSpacing: 3.5.w,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: getCategoryCards(categories: categories),
    );
  }
}
