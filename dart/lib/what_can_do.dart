class WhatCanDo {
  final int id;
  final String name;

  WhatCanDo({required this.id, required this.name});

  bool operator ==(Object other) {
    if (other is! WhatCanDo) {
      return false;
    }
    return id == other.id && name == other.name;
  }

  @override
  int get hashCode => id.hashCode + name.hashCode;
}
