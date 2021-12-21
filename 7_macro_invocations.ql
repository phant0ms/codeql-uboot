
import cpp

from MacroInvocation macroIvk, Function func
where macroIvk.getMacroName().regexpMatch("ntoh(s|l|ll)")
select macroIvk