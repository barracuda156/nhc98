#include "newmacros.h"
#include "runtime.h"

#define CT_v176	((void*)startLabel+40)
#define ST_v175	((void*)startLabel+68)
#define PS_v174	((void*)startLabel+92)
void FR_Prelude_46primIntegerAnd(void);
extern Node PM_Prelude[];

static Node startLabel[] = {
  bytes2word(0,0,2,0)
, bytes2word(1,1,0,2)
, useLabel(CT_v176)
,};
Node FN_Prelude_46primIntegerAnd[] = {
  bytes2word(PUSH_ARG_I1,EVAL,POP_I1,PUSH_ARG_I2)
, bytes2word(EVAL,POP_I1,PRIMITIVE,NOP)
, useLabel(FR_Prelude_46primIntegerAnd)
, bytes2word(RETURN_EVAL,ENDCODE,0,0)
, bytes2word(0,0,0,0)
, 50001
, useLabel(ST_v175)
,	/* CT_v176: (byte 0) */
  HW(0,2)
, 0
,};
Node F0_Prelude_46primIntegerAnd[] = {
  CAPTAG(useLabel(FN_Prelude_46primIntegerAnd),2)
, useLabel(PS_v174)
, 0
, 0
, 0
,};
Node PP_Prelude_46primIntegerAnd[] = {
 };
Node PC_Prelude_46primIntegerAnd[] = {
 	/* ST_v175: (byte 0) */
  bytes2word(80,114,101,108)
, bytes2word(117,100,101,46)
, bytes2word(112,114,105,109)
, bytes2word(73,110,116,101)
, bytes2word(103,101,114,65)
, bytes2word(110,100,0,0)
,	/* PS_v174: (byte 0) */
  useLabel(PM_Prelude)
, useLabel(PP_Prelude_46primIntegerAnd)
, useLabel(PC_Prelude_46primIntegerAnd)
,};

#include <haskell2c.h>
#include <HsFFI.h>

/* foreign import ccall "primIntegerAndC" Prelude.primIntegerAnd 2 :: Prelude.Integer -> Prelude.Integer -> Prelude.Integer */
extern Node* primIntegerAndC(Node*,Node*);
#ifdef PROFILE
static SInfo pf_Prelude_46primIntegerAnd = {"Prelude","Prelude.primIntegerAnd","Prelude.Integer"};
#endif
C_HEADER(FR_Prelude_46primIntegerAnd) {
  NodePtr nodeptr;
  Node* result;
  Node* arg1;
  Node* arg2;
  nodeptr = C_GETARG1(1);
  IND_REMOVE(nodeptr);
  arg1 = (Node*)nodeptr;
  nodeptr = C_GETARG1(2);
  IND_REMOVE(nodeptr);
  arg2 = (Node*)nodeptr;

  result = primIntegerAndC(arg1,arg2);

  nodeptr = result;
  INIT_PROFINFO(nodeptr,&pf_Prelude_46primIntegerAnd);
  C_RETURN(nodeptr);
}
