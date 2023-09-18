import 'dart:math';

import 'package:quiver/collection.dart';
import 'package:simple_authority_dart/what_can_do.dart';

class BaseAuthority<T extends WhatCanDo> {
  final int priority;
  final Set<T> whatCanDo;

  BaseAuthority({required this.priority, required this.whatCanDo});

  BaseAuthority copyWith({required int priority, required Set<T> whatCanDo}) {
    return BaseAuthority(priority: priority, whatCanDo: whatCanDo);
  }

  BaseAuthority operator +(Object other) {
    if (other is! BaseAuthority) {
      return this;
    }
    int p = max(priority, other.priority);
    Set<T> w = whatCanDo.union(other.whatCanDo as Set<T>);
    return copyWith(priority: p, whatCanDo: w);
  }

  void addCanDo(T canDo) {
    whatCanDo.add(canDo);
  }

  void operator <<(T canDo) {
    addCanDo(canDo);
  }

  bool operator ==(Object other) {
    if (other is! BaseAuthority) {
      return false;
    }

    return other.priority == priority && setsEqual(whatCanDo, other.whatCanDo);
  }
}
