import 'dart:developer' as devtools show log;

extension Log on Object {
  void logs() {
    // Use devtools log
    devtools.log(toString());
  }
}
