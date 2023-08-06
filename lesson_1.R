# Based on article https://blog.bguarisma.com/quantum-computing-with-qsimulatr

seznam_knihoven <- c("qsimulatR", "ggplot2")

knihovny <- function(seznam_knihoven) {
      
      # Kontrola a instalace chybějících knihoven
      
      # Načtení seznamu nainstalovaných knihovoven
      seznam_instalovanych_knihoven <- installed.packages()
      
      # Vyhledání chybějících knihoven
      chybejici_knihovny <- seznam_knihoven[!(seznam_knihoven %in% seznam_instalovanych_knihoven[, "Package"])]
      
      # Načtení seznamu nainstalovaných knihoven
      if (length(chybejici_knihovny) > 0) {
            install.packages(chybejici_knihovny)
      }
      
      # Kontrola a načtení chybějících knihoven
      chybejici_knihovny <- seznam_knihoven[!sapply(seznam_knihoven, function(x) {
            if (!requireNamespace(x, quietly = TRUE)) {
                  library(x, character.only = TRUE)
                  FALSE
            } else {
                  TRUE
            }
      })]
}


knihovny(seznam_knihoven)




