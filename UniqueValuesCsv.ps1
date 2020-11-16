(Import-CSV '\\.csv' | # | Select -ExpandProperty Domain |
      ForEach-Object { $_.psobject.properties.value -ne '' } |
        Sort-Object -Unique).Count