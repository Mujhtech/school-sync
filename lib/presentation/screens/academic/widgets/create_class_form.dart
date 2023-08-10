import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class CreateClassForm extends StatefulWidget {
  const CreateClassForm({super.key});

  @override
  State<CreateClassForm> createState() => _CreateClassFormState();
}

class _CreateClassFormState extends State<CreateClassForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController =
      TextEditingController(text: '');
  late final TextEditingController _codeController =
      TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                PrimaryTextFormField(
                  controller: _nameController,
                  hint: 'Name',
                  validator: (String? p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                ),
                const Height15(),
                PrimaryTextFormField(
                  controller: _codeController,
                  hint: 'Code',
                  validator: (String? p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: context.cardColor,
              border: Border(
                top: BorderSide(
                  width: 0.5,
                  color: context.textColorWithOpacity,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: PrimaryButton(
                    height: 40,
                    label: 'Continue',
                    loading: isLoading,
                    onPressed: () async {},
                  ),
                ),
                const Width15(),
                Expanded(
                  child: PrimaryButton(
                    borderColor: context.buttonColor,
                    textColor: context.textColor,
                    buttonColor: Colors.transparent,
                    height: 40,
                    label: 'Cancel',
                    loading: isLoading,
                    onPressed: () async {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
