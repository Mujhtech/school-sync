import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/core.dart';
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
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext ctx, WidgetRef ref, _) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const Height15(),
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
                    const Height15(),
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
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: context.cardColor,
                  border: Border(
                    top: BorderSide(
                      width: 0.2,
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
                        loading: _isLoading,
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          try {
                            _isLoading = true;
                            setState(() {});

                            int? unit;

                            if (_unitController.text.trim().isNotEmpty) {
                              unit = int.tryParse(_unitController.text.trim());
                            }

                            await ref
                                .read(subjectsProvider.notifier)
                                .createSubject(
                                  title: _titleController.text.trim(),
                                  code: _codeController.text.trim(),
                                  unit: unit,
                                );

                            // ignore: use_build_context_synchronously
                            context.snackBar.success(
                              'Created successfully',
                              duration: const Duration(milliseconds: 10),
                            );

                            // ignore: use_build_context_synchronously
                            context.router.goBack();
                          } catch (error, stackTrace) {
                            context.snackBar.error(
                              error.toString(),
                            );
                            AppLog.e(error, stackTrace);
                          } finally {
                            _isLoading = false;
                            setState(() {});
                          }
                        },
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
                        disable: _isLoading,
                        onPressed: () async => context.router.goBack(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
