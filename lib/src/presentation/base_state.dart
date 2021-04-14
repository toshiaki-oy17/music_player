import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:music_player/src/presentation/bloc/base_bloc.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, bool>(
        builder: (context, status) => Scaffold(
          appBar: setAppBar(context),
          body: ModalProgressHUD(
            inAsyncCall: status,
            child: GestureDetector(
              // Hide keyboard when touch other view when typing on TextEdit
              onTap: () => FocusScope.of(context).unfocus(),
              child: setBodyWidget(context),
            ),
          ),
        ),
      );
  }

  Widget? setBodyWidget(BuildContext context);

  AppBar? setAppBar(BuildContext context);

  void setProgress(bool status) {
    context.read<BaseBloc>().setProgress(status);
  }
}
