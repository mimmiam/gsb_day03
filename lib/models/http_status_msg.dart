class HttpStatusMsg{
  bool success;
  String ? err;
  Object ? result;
  HttpStatusMsg({this.success = true, this.err, this.result});
}