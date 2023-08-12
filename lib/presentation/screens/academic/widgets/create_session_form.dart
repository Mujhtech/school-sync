import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/core.dart';
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
                        label: AppString.continueText,
                        loading: _isLoading,
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          try {
                            _isLoading = true;
                            setState(() {});

                            await ref
                                .read(sessionsProvider.notifier)
                                .createSession(
                                  name: _nameController.text.trim(),
                                  code: _codeController.text.trim(),
                                );

                            // ignore: use_build_context_synchronously
                            context.router.goBack();

                            // ignore: use_build_context_synchronously
                            context.snackBar.success(
                              AppString.createdSuccessfully,
                              duration: const Duration(milliseconds: 10),
                            );
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
                        label: AppString.cancel,
                        loading: _isLoading,
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
