#include "newmacros.h"
#include "runtime.h"

#define v172	((void*)startLabel+47)
#define CT_v175	((void*)startLabel+64)
#define ST_v174	((void*)startLabel+88)
extern Node TM_Prelude[];
extern Node FN_Prelude_46showChar[];
extern Node FN_NHC_46Internal_46_95apply1[];
extern Node FN_Prelude_46_46[];

static Node startLabel[] = {
  bytes2word(0,0,2,0)
, bytes2word(1,1,0,2)
, useLabel(CT_v175)
,};
Node FN_Prelude_46showParen[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDSTACK_I16,PUSH_ZAP_ARG_I1,EVAL,NEEDHEAP_I32)
, bytes2word(JUMPFALSE,26,0,HEAP_CVAL_I3)
, bytes2word(HEAP_CVAL_I4,HEAP_OFF_N1,2,HEAP_CHAR_P1)
, bytes2word(40,HEAP_CVAL_I3,HEAP_CVAL_I4,HEAP_OFF_N1)
, bytes2word(2,HEAP_CHAR_P1,41,HEAP_CVAL_I5)
, bytes2word(HEAP_ARG,2,HEAP_OFF_N1,5)
, bytes2word(PUSH_HEAP,HEAP_CVAL_I5,HEAP_OFF_N1,11)
,	/* v172: (byte 3) */
  bytes2word(HEAP_OFF_N1,5,RETURN_EVAL,PUSH_ARG_I2)
, bytes2word(RETURN_EVAL,ENDCODE,0,0)
, bytes2word(0,0,0,0)
, 40001
, useLabel(ST_v174)
,	/* CT_v175: (byte 0) */
  HW(3,2)
, 0
,};
Node F0_Prelude_46showParen[] = {
  CAPTAG(useLabel(FN_Prelude_46showParen),2)
, VAPTAG(useLabel(FN_Prelude_46showChar))
, VAPTAG(useLabel(FN_NHC_46Internal_46_95apply1))
, VAPTAG(useLabel(FN_Prelude_46_46))
,	/* ST_v174: (byte 0) */
  bytes2word(80,114,101,108)
, bytes2word(117,100,101,46)
, bytes2word(115,104,111,119)
, bytes2word(80,97,114,101)
, bytes2word(110,0,0,0)
,};
