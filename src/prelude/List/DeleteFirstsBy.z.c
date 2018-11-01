#include "newmacros.h"
#include "runtime.h"

#define CT_v177	((void*)startLabel+40)
#define ST_v176	((void*)startLabel+64)
extern Node TM_List[];
extern Node FN_List_46deleteBy[];
extern Node FN_Prelude_46flip[];
extern Node FN_Prelude_46foldl[];

static Node startLabel[] = {
  bytes2word(1,0,0,1)
, useLabel(CT_v177)
,};
Node FN_List_46deleteFirstsBy[] = {
  useLabel(TM_List)
, bytes2word(NEEDHEAP_I32,HEAP_CVAL_I3,HEAP_ARG,1)
, bytes2word(HEAP_CVAL_I4,HEAP_OFF_N1,3,PUSH_HEAP)
, bytes2word(HEAP_CVAL_I5,HEAP_OFF_N1,3,RETURN)
, bytes2word(ENDCODE,0,0,0)
, bytes2word(0,0,0,0)
, 60001
, useLabel(ST_v176)
,	/* CT_v177: (byte 0) */
  HW(3,1)
, 0
,};
Node F0_List_46deleteFirstsBy[] = {
  CAPTAG(useLabel(FN_List_46deleteFirstsBy),1)
, CAPTAG(useLabel(FN_List_46deleteBy),2)
, CAPTAG(useLabel(FN_Prelude_46flip),2)
, CAPTAG(useLabel(FN_Prelude_46foldl),2)
,	/* ST_v176: (byte 0) */
  bytes2word(76,105,115,116)
, bytes2word(46,100,101,108)
, bytes2word(101,116,101,70)
, bytes2word(105,114,115,116)
, bytes2word(115,66,121,0)
,};
