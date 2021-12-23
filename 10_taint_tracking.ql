/***
 * @kind path-problem
 */

 import cpp
 import semmle.code.cpp.dataflow.TaintTracking
 import DataFlow::PathGraph

 class NetworkBySwap extends Expr{

  NetworkBySwap(){

        exists( MacroInvocation m | m.getMacroName().regexpMatch("ntoh(s|l|ll)")  and this = m.getExpr() )
  }

}

class Config extends TaintTracking::Configuration {
  Config() { this = "Config" }
  
  override predicate isSource(DataFlow::Node source) {
    source.asExpr() instanceof NetworkBySwap
  }
  
  override predicate isSink(DataFlow::Node node) {
     exists(FunctionCall c | c.getTarget().getName()="memcpy" and c.getArgument(2) = node.asExpr()  )
  }
}

from Config cfg , DataFlow::PathNode source , DataFlow::PathNode sink

where cfg.hasFlowPath(source, sink)

select sink ,source, sink, "msg"
