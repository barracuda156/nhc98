#include "newmacros.h"
#include "runtime.h"

#define v190	((void*)startLabel+26)
#define v191	((void*)startLabel+29)
#define CT_v194	((void*)startLabel+68)
#define ST_v192	((void*)startLabel+84)
extern Node TM_Prelude[];

static Node startLabel[] = {
  bytes2word(3,0,2,1)
, bytes2word(1,2,0,3)
, useLabel(CT_v194)
,};
Node FN_Prelude_46_95foldr[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDSTACK_I16,PUSH_ZAP_ARG_I2,EVAL,NEEDHEAP_I32)
, bytes2word(TABLESWITCH,2,TOP(4),BOT(4))
,	/* v190: (byte 2) */
  bytes2word(TOP(7),BOT(7),POP_I1,PUSH_ARG_I3)
,	/* v191: (byte 1) */
  bytes2word(RETURN_EVAL,UNPACK,2,PUSH_HEAP)
, bytes2word(HEAP_CVAL_I3,HEAP_ARG,1,HEAP_I2)
, bytes2word(HEAP_ARG,3,PUSH_P1,0)
, bytes2word(PUSH_P1,2,PUSH_ZAP_ARG_I1,ZAP_ARG_I3)
, bytes2word(ZAP_STACK_P1,5,ZAP_STACK_P1,4)
, bytes2word(ZAP_STACK_P1,3,EVAL,NEEDHEAP_I32)
, bytes2word(APPLY,2,RETURN_EVAL,ENDCODE)
, bytes2word(0,0,0,0)
, 50001
, useLabel(ST_v192)
,	/* CT_v194: (byte 0) */
  HW(1,3)
, 0
,};
Node F0_Prelude_46_95foldr[] = {
  CAPTAG(useLabel(FN_Prelude_46_95foldr),3)
, VAPTAG(useLabel(FN_Prelude_46_95foldr))
,	/* ST_v192: (byte 0) */
  bytes2word(80,114,101,108)
, bytes2word(117,100,101,46)
, bytes2word(95,102,111,108)
, bytes2word(100,114,0,0)
,};
