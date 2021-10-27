import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('${bloc.runtimeType}$change');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('Close ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('Create ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('Error in : ${bloc.runtimeType}'
        'Error: $error'
        'StackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
