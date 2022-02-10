import 'package:flutter/material.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';

class SimpleLoadingWidget extends StatelessWidget {
  const SimpleLoadingWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.circularProgressIndicator,
        ),
      ),
    );
  }
}