part of 'ui_bloc.dart';

@immutable
abstract class UiState {
  const UiState();
}

class UiIdle extends UiState {
  const UiIdle(): super();
}

class UiLoading extends UiState {
  const UiLoading(): super();
}

class UiError extends UiState {
  final String error;

  const UiError(this.error): super();
}

class UiMessage extends UiState {
  final String message;

  const UiMessage(this.message): super();
}
