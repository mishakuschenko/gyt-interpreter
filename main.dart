import 'dart:io';
import 'stack.dart';

void main(List<String> args) async {
  final path = args[0];
  List<String> lines = [];

  final file = File(path);
  lines = await file.readAsLines();
  lines = lines.map((line) => line.trim()).toList();  

  List program = [];
  int tokenCounter = 0;
  Map labelTracker = {};

  for (var line in lines) {
    var parts = line.split(" ");
    var opcode = parts[0];

    if (opcode == "") {
      continue;
    }

    if (opcode.endsWith(":")) {
      labelTracker[opcode.substring(0,opcode.length - 1)] = tokenCounter;
      continue;
    }

    program.add(opcode);
    tokenCounter++;

    switch (opcode) {
      case "push":
        int number = int.parse(parts[1]);
        program.add(number);
        tokenCounter++; 
      case "print":
        String stringLiteral = parts.sublist(1).join(' ');
        stringLiteral = stringLiteral.substring(1, stringLiteral.length - 1);
        program.add(stringLiteral);
        tokenCounter++;
      case "jump.eq.0":
        String label = parts[1];
        program.add(label);
        tokenCounter++;
      case "jump.gt.0":
        String label = parts[1];
        program.add(label);
        tokenCounter++;
    }
  }
  int pc = 0;
  Stack stack = Stack(256);

  while (program[pc] != 'halt') {
    var opcode = program[pc];
    pc++;

    switch (opcode) {
      case 'push':
        // var number = program[pc];
        pc++;
      case 'pop':
        stack.pop();
      case 'add':
        int a = stack.pop();
        int b = stack.pop();
        stack.push(a + b);
      case 'sub':
        int a = stack.pop();
        int b = stack.pop();
        stack.push(b - a);
      case 'print':
        String stringLiteral = program[pc];
        pc++;
        print(stringLiteral);
      case 'read':
        String? input = stdin.readLineSync();
        var number = int.parse(input!);
        stack.push(number);
      case 'jump.eq.0':
        var number = stack.top();
        if (number == 0) {
          pc = labelTracker[program[pc]];
        } else {
          pc++;
        }
      case 'jump.gt.0':
        var number = stack.top();
        if (number > 0) {
          pc = labelTracker[program[pc]];
        } else {
          pc++;
        }
    } 
  }
}

