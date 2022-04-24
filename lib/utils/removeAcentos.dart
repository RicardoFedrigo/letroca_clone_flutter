String removerAcentos(String str) {

  var comAcento =
      'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  var semAcento =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

  for (int i = 0; i < comAcento.length; i++) {
    str = str.replaceAll(comAcento[i], semAcento[i]);
  }
  str = str.replaceAll(' ', '');
  return (str.toLowerCase());
}
