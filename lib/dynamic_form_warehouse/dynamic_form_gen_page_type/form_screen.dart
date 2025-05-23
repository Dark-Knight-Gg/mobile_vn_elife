import 'package:flutter/material.dart';

import '../../dynamic_form_features/dynamic_form_utilities/color_app.dart';
import '../dynamic_form_generate/data_builder.dart';
import '../dynamic_form_widget/core_button.dart';
import '../dynamic_form_widget/core_text.dart';

class FormScreen extends StatelessWidget {
  final title;
  final formdata;
  final mapAnswers;

  FormScreen({super.key, this.formdata, this.title, this.mapAnswers});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<bool> _onWillPop(context) async {
    return await showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          content: OneUiText.textWidget(
            title: 'Bạn có muốn quay lại không?',
            color: ColorApp.color404D64,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          title: OneUiText.textWidget(
            title: 'Quay lại',
            color: ColorApp.color001230,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          actions: <Widget>[
            OneUiButton(
              onPress: () => Navigator.of(context).pop(false),
              title: 'Không',
              titleSize: 16,
              titleColor: ColorApp.color0057E5,
              borderRadius: 12,
              backgroundColor: Colors.white,
              height: 42,
            ),
            OneUiButton(
              onPress: () => Navigator.of(context).pop(true),
              title: 'Có',
              titleSize: 16,
              titleColor: Colors.white,
              borderRadius: 12,
              backgroundColor: ColorApp.color0057E5,
              height: 42,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: const BackButton(),
          title: Text(title),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: ListView.custom(
                    childrenDelegate: SliverChildListDelegate(
                      [...dataBuilder(formdata, mapAnswers)],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
