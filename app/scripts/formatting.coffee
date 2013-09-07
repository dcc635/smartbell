define ->
  
  padLeftZeros: (number, padding) ->
    numberStr = '' + number
    while numberStr.length < padding
      numberStr = '0' + numberStr
    return numberStr