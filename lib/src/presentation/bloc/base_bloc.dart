import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBloc extends Cubit<bool> {
	BaseBloc() : super(false);

	void setProgress(bool status) => emit(status);
}