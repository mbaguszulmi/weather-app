part of 'ui_bloc.dart';

@immutable
abstract class UiEvent {
  const UiEvent();
}

class UiIdleEvent extends UiEvent {
  const UiIdleEvent(): super();
}

class UiLoadingEvent extends UiEvent {
  const UiLoadingEvent(): super();
}

class UiErrorEvent extends UiEvent {
  final String error;

  const UiErrorEvent(this.error): super();
}

class UiMessageEvent extends UiEvent {
  final String message;

  const UiMessageEvent(this.message): super();
}
