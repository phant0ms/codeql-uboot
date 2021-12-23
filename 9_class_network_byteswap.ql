
import cpp

class NetworkBySwap extends Expr{

      NetworkBySwap(){

            exists( MacroInvocation m | m.getMacroName().regexpMatch("ntoh(s|l|ll)")  and this = m.getExpr() )
      }

}

from NetworkBySwap n
select n , "by class"