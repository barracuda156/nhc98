#include "newmacros.h"
#include "runtime.h"

#define CT_v181	((void*)startLabel+36)
extern Node FN_Prelude_46show[];
extern Node FN_NHC_46Internal_46_95apply1[];
extern Node FN_IO_46hPutStr[];

static Node startLabel[] = {
  bytes2word(3,0,2,1)
, bytes2word(1,2,0,3)
, useLabel(CT_v181)
,};
Node FN_IO_46hPrint[] = {
  bytes2word(NEEDHEAP_I32,HEAP_CVAL_I3,HEAP_ARG,1)
, bytes2word(HEAP_CVAL_I4,HEAP_OFF_N1,3,HEAP_ARG)
, bytes2word(3,PUSH_HEAP,HEAP_CVAL_I5,HEAP_ARG)
, bytes2word(2,HEAP_OFF_N1,5,RETURN_EVAL)
, bytes2word(ENDCODE,0,0,0)
, bytes2word(0,0,0,0)
,	/* CT_v181: (byte 0) */
  HW(3,3)
, 0
,};
Node F0_IO_46hPrint[] = {
  CAPTAG(useLabel(FN_IO_46hPrint),3)
, VAPTAG(useLabel(FN_Prelude_46show))
, VAPTAG(useLabel(FN_NHC_46Internal_46_95apply1))
, VAPTAG(useLabel(FN_IO_46hPutStr))
,};
