import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class CreateSessionForm extends StatefulWidget {
  const CreateSessionForm({super.key});

  @override
  State<CreateSessionForm> createState() => _CreateSessionFormState();
}

class _CreateSessionFormState extends State<CreateSessionForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController =
      TextEditingController(text: '');
  late final TextEditingController _codeController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
    );
  }
}
