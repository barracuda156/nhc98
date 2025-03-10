#include "newmacros.h"
#include "runtime.h"

#define CT_v250	((void*)startLabel+32)
#define CT_v252	((void*)startLabel+80)
#define CT_v254	((void*)startLabel+124)
#define CT_v256	((void*)startLabel+168)
#define CT_v258	((void*)startLabel+220)
#define CT_v260	((void*)startLabel+272)
#define CT_v262	((void*)startLabel+324)
#define CT_v264	((void*)startLabel+388)
#define ST_v263	((void*)startLabel+436)
#define ST_v257	((void*)startLabel+460)
#define ST_v261	((void*)startLabel+486)
#define ST_v259	((void*)startLabel+512)
#define ST_v253	((void*)startLabel+538)
#define ST_v249	((void*)startLabel+566)
#define ST_v255	((void*)startLabel+602)
#define ST_v251	((void*)startLabel+633)
extern Node TM_Prelude[];
extern Node FN_Prelude_46primIntFromInteger[];
extern Node CF_Prelude_46Eq_46Prelude_46Int[];
extern Node CF_Prelude_46Show_46Prelude_46Int[];

static Node startLabel[] = {
  bytes2word(1,0,0,1)
, useLabel(CT_v250)
,};
Node FN_Prelude_46Num_46Prelude_46Int_46fromInteger[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDHEAP_I32,PUSH_HEAP,HEAP_CVAL_I3,HEAP_ARG)
, bytes2word(1,RETURN_EVAL,ENDCODE,0)
, bytes2word(0,0,0,0)
, 150002
, useLabel(ST_v249)
,	/* CT_v250: (byte 0) */
  HW(1,1)
, 0
,};
Node F0_Prelude_46Num_46Prelude_46Int_46fromInteger[] = {
  CAPTAG(useLabel(FN_Prelude_46Num_46Prelude_46Int_46fromInteger),1)
, VAPTAG(useLabel(FN_Prelude_46primIntFromInteger))
, bytes2word(1,0,0,1)
, useLabel(CT_v252)
,};
Node FN_Prelude_46Num_46Prelude_46Int_46signum[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDSTACK_I16,PUSH_ZAP_ARG_I1,EVAL,NEEDHEAP_I32)
, bytes2word(SIGNUM_W,RETURN,ENDCODE,0)
, bytes2word(0,0,0,0)
, 130002
, useLabel(ST_v251)
,	/* CT_v252: (byte 0) */
  HW(0,1)
, 0
,};
Node F0_Prelude_46Num_46Prelude_46Int_46signum[] = {
  CAPTAG(useLabel(FN_Prelude_46Num_46Prelude_46Int_46signum),1)
, bytes2word(1,0,0,1)
, useLabel(CT_v254)
,};
Node FN_Prelude_46Num_46Prelude_46Int_46abs[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDSTACK_I16,PUSH_ZAP_ARG_I1,EVAL,NEEDHEAP_I32)
, bytes2word(ABS_W,RETURN,ENDCODE,0)
, bytes2word(0,0,0,0)
, 120002
, useLabel(ST_v253)
,	/* CT_v254: (byte 0) */
  HW(0,1)
, 0
,};
Node F0_Prelude_46Num_46Prelude_46Int_46abs[] = {
  CAPTAG(useLabel(FN_Prelude_46Num_46Prelude_46Int_46abs),1)
, bytes2word(1,0,0,1)
, useLabel(CT_v256)
,};
Node FN_Prelude_46Num_46Prelude_46Int_46negate[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDSTACK_I16,PUSH_ZAP_ARG_I1,EVAL,NEEDHEAP_I32)
, bytes2word(NEG_W,RETURN,ENDCODE,0)
, bytes2word(0,0,0,0)
, 110002
, useLabel(ST_v255)
,	/* CT_v256: (byte 0) */
  HW(0,1)
, 0
,};
Node F0_Prelude_46Num_46Prelude_46Int_46negate[] = {
  CAPTAG(useLabel(FN_Prelude_46Num_46Prelude_46Int_46negate),1)
, bytes2word(0,0,2,0)
, bytes2word(1,1,0,2)
, useLabel(CT_v258)
,};
Node FN_Prelude_46Num_46Prelude_46Int_46_42[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDSTACK_I16,PUSH_ZAP_ARG_I2,EVAL,PUSH_ZAP_ARG_I1)
, bytes2word(EVAL,NEEDHEAP_I32,MUL_W,RETURN)
, bytes2word(ENDCODE,0,0,0)
, bytes2word(0,0,0,0)
, 90002
, useLabel(ST_v257)
,	/* CT_v258: (byte 0) */
  HW(0,2)
, 0
,};
Node F0_Prelude_46Num_46Prelude_46Int_46_42[] = {
  CAPTAG(useLabel(FN_Prelude_46Num_46Prelude_46Int_46_42),2)
, bytes2word(0,0,2,0)
, bytes2word(1,1,0,2)
, useLabel(CT_v260)
,};
Node FN_Prelude_46Num_46Prelude_46Int_46_45[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDSTACK_I16,PUSH_ZAP_ARG_I2,EVAL,PUSH_ZAP_ARG_I1)
, bytes2word(EVAL,NEEDHEAP_I32,SUB_W,RETURN)
, bytes2word(ENDCODE,0,0,0)
, bytes2word(0,0,0,0)
, 80002
, useLabel(ST_v259)
,	/* CT_v260: (byte 0) */
  HW(0,2)
, 0
,};
Node F0_Prelude_46Num_46Prelude_46Int_46_45[] = {
  CAPTAG(useLabel(FN_Prelude_46Num_46Prelude_46Int_46_45),2)
, bytes2word(0,0,2,0)
, bytes2word(1,1,0,2)
, useLabel(CT_v262)
,};
Node FN_Prelude_46Num_46Prelude_46Int_46_43[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDSTACK_I16,PUSH_ZAP_ARG_I2,EVAL,PUSH_ZAP_ARG_I1)
, bytes2word(EVAL,NEEDHEAP_I32,ADD_W,RETURN)
, bytes2word(ENDCODE,0,0,0)
, bytes2word(0,0,0,0)
, 70002
, useLabel(ST_v261)
,	/* CT_v262: (byte 0) */
  HW(0,2)
, 0
,};
Node F0_Prelude_46Num_46Prelude_46Int_46_43[] = {
  CAPTAG(useLabel(FN_Prelude_46Num_46Prelude_46Int_46_43),2)
, bytes2word(0,0,0,0)
, useLabel(CT_v264)
,};
Node FN_Prelude_46Num_46Prelude_46Int[] = {
  useLabel(TM_Prelude)
, bytes2word(NEEDHEAP_I32,PUSH_HEAP,HEAP_CVAL_IN3,HEAP_CVAL_I3)
, bytes2word(HEAP_CVAL_I4,HEAP_CVAL_I5,HEAP_CVAL_P1,6)
, bytes2word(HEAP_CVAL_P1,7,HEAP_CVAL_P1,8)
, bytes2word(HEAP_CVAL_P1,9,HEAP_CVAL_P1,10)
, bytes2word(HEAP_CVAL_P1,11,RETURN,ENDCODE)
, bytes2word(0,0,0,0)
, 0
, CONSTR(0,9,0)
, 60010
, useLabel(ST_v263)
,	/* CT_v264: (byte 0) */
  HW(9,0)
, 0
,};
Node CF_Prelude_46Num_46Prelude_46Int[] = {
  VAPTAG(useLabel(FN_Prelude_46Num_46Prelude_46Int))
, useLabel(CF_Prelude_46Eq_46Prelude_46Int)
, useLabel(CF_Prelude_46Show_46Prelude_46Int)
, useLabel(F0_Prelude_46Num_46Prelude_46Int_46_42)
, useLabel(F0_Prelude_46Num_46Prelude_46Int_46_43)
, useLabel(F0_Prelude_46Num_46Prelude_46Int_46_45)
, useLabel(F0_Prelude_46Num_46Prelude_46Int_46negate)
, useLabel(F0_Prelude_46Num_46Prelude_46Int_46signum)
, useLabel(F0_Prelude_46Num_46Prelude_46Int_46fromInteger)
, useLabel(F0_Prelude_46Num_46Prelude_46Int_46abs)
,	/* ST_v263: (byte 0) */
  bytes2word(80,114,101,108)
, bytes2word(117,100,101,46)
, bytes2word(78,117,109,46)
, bytes2word(80,114,101,108)
, bytes2word(117,100,101,46)
,	/* ST_v257: (byte 4) */
  bytes2word(73,110,116,0)
, bytes2word(80,114,101,108)
, bytes2word(117,100,101,46)
, bytes2word(78,117,109,46)
, bytes2word(80,114,101,108)
, bytes2word(117,100,101,46)
, bytes2word(73,110,116,46)
,	/* ST_v261: (byte 2) */
  bytes2word(42,0,80,114)
, bytes2word(101,108,117,100)
, bytes2word(101,46,78,117)
, bytes2word(109,46,80,114)
, bytes2word(101,108,117,100)
, bytes2word(101,46,73,110)
,	/* ST_v259: (byte 4) */
  bytes2word(116,46,43,0)
, bytes2word(80,114,101,108)
, bytes2word(117,100,101,46)
, bytes2word(78,117,109,46)
, bytes2word(80,114,101,108)
, bytes2word(117,100,101,46)
, bytes2word(73,110,116,46)
,	/* ST_v253: (byte 2) */
  bytes2word(45,0,80,114)
, bytes2word(101,108,117,100)
, bytes2word(101,46,78,117)
, bytes2word(109,46,80,114)
, bytes2word(101,108,117,100)
, bytes2word(101,46,73,110)
, bytes2word(116,46,97,98)
,	/* ST_v249: (byte 2) */
  bytes2word(115,0,80,114)
, bytes2word(101,108,117,100)
, bytes2word(101,46,78,117)
, bytes2word(109,46,80,114)
, bytes2word(101,108,117,100)
, bytes2word(101,46,73,110)
, bytes2word(116,46,102,114)
, bytes2word(111,109,73,110)
, bytes2word(116,101,103,101)
,	/* ST_v255: (byte 2) */
  bytes2word(114,0,80,114)
, bytes2word(101,108,117,100)
, bytes2word(101,46,78,117)
, bytes2word(109,46,80,114)
, bytes2word(101,108,117,100)
, bytes2word(101,46,73,110)
, bytes2word(116,46,110,101)
, bytes2word(103,97,116,101)
,	/* ST_v251: (byte 1) */
  bytes2word(0,80,114,101)
, bytes2word(108,117,100,101)
, bytes2word(46,78,117,109)
, bytes2word(46,80,114,101)
, bytes2word(108,117,100,101)
, bytes2word(46,73,110,116)
, bytes2word(46,115,105,103)
, bytes2word(110,117,109,0)
,};
