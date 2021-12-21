
// import cpp
// from FunctionCall call, Function memcpy

// where call.getTarget().getName()="memcpy"

// select call

import cpp

from Function memcpy, FunctionCall call

where call.getTarget()=memcpy and memcpy.getName()="memcpy"

select call