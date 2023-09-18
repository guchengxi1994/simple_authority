import 'package:simple_authority_dart/base_authority.dart';
import 'package:simple_authority_dart/what_can_do.dart';
import 'package:test/test.dart';

void main() {
  test("all test", () {
    WhatCanDo do1 = WhatCanDo(id: 1, name: "test1");
    WhatCanDo do2 = WhatCanDo(id: 2, name: "test2");
    WhatCanDo do3 = WhatCanDo(id: 3, name: "test3");
    WhatCanDo do4 = WhatCanDo(id: 4, name: "test4");
    WhatCanDo do5 = WhatCanDo(id: 5, name: "test5");

    BaseAuthority b1 = BaseAuthority(priority: 1, whatCanDo: {do1, do2, do3});
    BaseAuthority b2 = BaseAuthority(priority: 2, whatCanDo: {do4, do5});

    final b = b1 + b2;
    expect(b.priority, equals(2));
    expect(b.whatCanDo.length, equals(5));
    WhatCanDo do6 = WhatCanDo(id: 5, name: "test6");
    b << do6;
    expect(b.whatCanDo.contains(do6), true);
  });
}
