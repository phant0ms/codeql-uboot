
import cpp
from MacroInvocation macro
where macro.getMacroName().regexpMatch("ntoh(s|l|ll)")
select macro.getExpr()