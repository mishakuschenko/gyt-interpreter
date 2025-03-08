class Stack {
  late List<int> buf;
  late int sp;

  Stack(int size) {
    buf = List.filled(size, 0);
    sp = -1;
  }

  void push(int number) {
    sp++;
    buf[sp] = number;
  }

  int pop() {
    var number = buf[sp];
    sp--;
    return number;
  }

  int top() {
    return buf[sp];
  }
}