import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super(const UiIdle()) {
    on<UiEvent>((event, emit) {
      if (event is UiLoadingEvent) {
        if (state is! UiLoading) {
          emit(const UiLoading());
        }
      } else if (event is UiErrorEvent) {
        emit(UiError(event.error));
      } else if (event is UiMessageEvent) {
        emit(UiMessage(event.message));
      } else {
        emit(const UiIdle());
      }
    });
  }

  void setIdle() {
    add(const UiIdleEvent());
  }

  void setLoading() {
    add(const UiLoadingEvent());
  }

  void setError(String error) {
    add(UiErrorEvent(error));
  }

  void setMessage(String message) {
    add(UiMessageEvent(message));
  }
}
