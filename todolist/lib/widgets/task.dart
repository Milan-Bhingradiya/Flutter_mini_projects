
class task {
  late String msg;
  late bool ischecked;

  task(this.msg, this.ischecked);

  void toggle() {
    ischecked = !ischecked;
  }
}
