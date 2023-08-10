import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class CreateSubjectForm extends StatefulWidget {
  const CreateSubjectForm({super.key});

  @override
  State<CreateSubjectForm> createState() => _CreateSubjectFormState();
}

class _CreateSubjectFormState extends State<CreateSubjectForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController =
      TextEditingController(text: '');
  late final TextEditingController _codeController =
      TextEditingController(text: '');
  late final TextEditingController _unitController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          PrimaryTextFormField(
            controller: _titleController,
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
          PrimaryTextFormField(
            controller: _unitController,
            hint: 'Unit',
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
    );
  }
}
