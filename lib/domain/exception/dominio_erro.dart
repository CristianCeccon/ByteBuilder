class DominioErro implements Exception {
  String msg;

  DominioErro(this.msg);

  @override
  String toString() {
    return msg;
  }
}
