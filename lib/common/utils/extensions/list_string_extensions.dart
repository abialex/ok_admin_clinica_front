extension DateFormatting on List<String> {
  String toStringByMidFijo(String midfijo) {
    if (isEmpty) return '';
    if (length == 1) return this[0];
    if (length == 2) return '${this[0]} $midfijo ${this[1]}';

    String allButLast = sublist(0, length - 1).join(', ');
    String last = this.last;
    return '$allButLast $midfijo $last';
  }
}
