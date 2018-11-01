#include "newmacros.h"
#include "runtime.h"

#define CT_v174	((void*)startLabel+32)
void FR_Prelude_46primIntegerMul(void);

static Node startLabel[] = {
  bytes2word(0,0,2,0)
, bytes2word(1,1,0,2)
, useLabel(CT_v174)
,};
Node FN_Prelude_46primIntegerMul[] = {
  bytes2word(PUSH_ARG_I1,EVAL,POP_I1,PUSH_ARG_I2)
, bytes2word(EVAL,POP_I1,PRIMITIVE,NOP)
, useLabel(FR_Prelude_46primIntegerMul)
, bytes2word(RETURN_EVAL,ENDCODE,0,0)
, bytes2word(0,0,0,0)
,	/* CT_v174: (byte 0) */
  HW(0,2)
, 0
,};
Node F0_Prelude_46primIntegerMul[] = {
  CAPTAG(useLabel(FN_Prelude_46primIntegerMul),2)
,};

#include <haskell2c.h>
#include <HsFFI.h>

/* foreign import ccall "primIntegerMulC" Prelude.primIntegerMul 2 :: Prelude.Integer -> Prelude.Integer -> Prelude.Integer */
extern Node* primIntegerMulC(Node*,Node*);
#ifdef PROFILE
static SInfo pf_Prelude_46primIntegerMul = {"Prelude","Prelude.primIntegerMul","Prelude.Integer"};
#endif
C_HEADER(FR_Prelude_46primIntegerMul) {
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

  result = primIntegerMulC(arg1,arg2);

  nodeptr = result;
  INIT_PROFINFO(nodeptr,&pf_Prelude_46primIntegerMul);
  C_RETURN(nodeptr);
}
