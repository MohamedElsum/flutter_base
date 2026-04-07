import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/core/utils/helpers/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogger.debug('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger.error('${bloc.runtimeType}', error: error, stackTrace: stackTrace);
  }
}
