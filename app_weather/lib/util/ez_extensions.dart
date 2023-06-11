extension KtStd<T, R> on T {
  R let(R Function(T it) f) => f(this);
}
