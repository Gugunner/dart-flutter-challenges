
///Problem 2-1
///Using only single-character output statements that output a hash mark, a space, or end-of-line,
///write a program that produces the following shape:
///########
/// ######
///  ####
///   ##

void shapeTwoOne() {
  print("Problem 2-1");
  for (var i=0; i < 4; i++) {
    String hash = ' '*i;
    for (var j=0; j < (8-2*i); j++) {
      hash += "#";
    }
    print(hash);
  }
  print("************************");
  print('Finished\n');
}

///Problem 2-2
///Using only single-character output statements that output a hash mark, a space, or end-of-line,
///write a program that produces the following shape:
///   ##
///  ####
/// ######
///########
///########
/// ######
///  ####
///   ##
void shapeTwoTwo() {
  String hash = '';
  print("Problem 2-2-1");
  for (var i=0; i < 4; i++) {
    hash = ' '*(3-i).abs();
    for (var j=0; j < (2-(4+2*i)).abs(); j++) {
      hash += "#";
    }
    print(hash);
  }
  print("************************\n");
  print("Problem 2-2-2");
  for (var i=4; i < 8; i++) {
    hash = ' '*(4-i).abs();
    for (var j=0; j < (16-2*i).abs(); j++) {
      hash += "#";
    }
    print(hash);
  }
  print("************************\n");
  print("Problem 2-2-3");
  for (var i=0; i < 8; i++) {
    if (i < 4) {
      hash = ' '*(3-i).abs();
      for (var j=0; j < (2-(4+2*i)).abs(); j++) {
        hash += "#";
      }
    } else {
      hash = ' '*(4-i).abs();
      for (var j=0; j < (16-2*i).abs(); j++) {
        hash += "#";
      }
    }
    print(hash);
  }
  print("************************");
  print('Finished\n');
}

///Problem 2-3
///Using only single-character output statements that output a hash mark, a space, or end-of-line,
///write a program that produces the following shape:
///#             #
/// ##         ##
///  ###     ###
///   ########
///   ########
///  ###    ###
/// ##        ##
///#            #
void shapeTwoThree() {
  print("Problem 2-3-1");
  String hash = '';
  for(var i=0; i<4; i++) {
    hash = " "*i;
    for (var j=0; j < 1+i; j++) {
      hash += "#";
    }
    print(hash);
  }
  print("************************\n");
  print("Problem 2-3-2");
  hash = '';
  for(var i=4; i<8; i++) {
    hash = " "*(7-i);
    for (var j=0; j < 8-i; j++) {
      hash += "#";
    }
    print(hash);
  }
  print("************************\n");
  print("Problem 2-3-3");
  hash = "";
  for(var i=0; i<4; i++) {
    hash = " "*(14-2*i);
    for (var j=0; j < 1+i; j++) {
      hash += "#";
    }
    print(hash);
  }
  print("************************\n");
  print("Problem 2-3-4");
  hash = "";
  for(var i=0; i<4; i++) {
    hash = " "*i;
    for (var j=0; j < 1+i; j++) {
      hash += "#";
    }
    hash += " "*(12-4*i);
    for (var j=0; j < 1+i; j++) {
      hash += "#";
    }
    print(hash);
  }
  print("************************\n");
  print("Problem 2-3-5");
  hash = '';
  for(var i=4; i<8; i++) {
    hash = " "*(2*i-1);
    for (var j=0; j < 8-i; j++) {
      hash += "#";
    }
    print(hash);
  }
  print("************************\n");
  print("Problem 2-3-6");
  hash = '';
  for(var i=4; i<8; i++) {
    hash = " "*(7-i);
    for (var j=0; j < 8-i; j++) {
      hash += "#";
    }
    hash += " "*(4*i - 16).abs();
    for (var j=0; j < 8-i; j++) {
      hash += "#";
    }
    print(hash);
  }
  print("************************\n");
  print("Problem 2-3-7");
  hash = '';
  for(var i=0; i<8; i++) {
    if (i < 4) {
      hash = " "*i;
      for (var j=0; j < 1+i; j++) {
        hash += "#";
      }
      hash += " "*(12-4*i);
      for (var j=0; j < 1+i; j++) {
        hash += "#";
      }
      print(hash);
    } else {
      hash = " "*(7-i);
      for (var j=0; j < 8-i; j++) {
        hash += "#";
      }
      hash += " "*(4*i - 16).abs();
      for (var j=0; j < 8-i; j++) {
        hash += "#";
      }
      print(hash);
    }
  }
  print("************************");
  print('Finished\n');
}