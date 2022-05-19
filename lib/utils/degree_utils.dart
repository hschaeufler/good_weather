String formatDegree(double? degree){
  return "${degree != null ? degree.round() : '-'} °";
}