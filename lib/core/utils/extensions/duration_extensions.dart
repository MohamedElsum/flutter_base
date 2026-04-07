extension DurationExtensions on Duration {
  String get formatted {
    final h = inHours.toString().padLeft(2, '0');
    final m = (inMinutes % 60).toString().padLeft(2, '0');
    final s = (inSeconds % 60).toString().padLeft(2, '0');
    return inHours > 0 ? '$h:$m:$s' : '$m:$s';
  }

  String get humanReadable {
    if (inDays > 0) return '${inDays}d ${inHours % 24}h';
    if (inHours > 0) return '${inHours}h ${inMinutes % 60}m';
    if (inMinutes > 0) return '${inMinutes}m ${inSeconds % 60}s';
    return '${inSeconds}s';
  }

  Future<void> delay([void Function()? callback]) async {
    await Future.delayed(this);
    callback?.call();
  }
}
