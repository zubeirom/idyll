class Util {
  static List sublist(List list, int start, int end) {
    if (list.length > end) {
      return list.sublist(start, end);
    }
    return list;
  }
}
