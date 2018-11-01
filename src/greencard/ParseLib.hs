{-----------------------------------------------------------------------------

                 A LIBRARY OF MONADIC PARSER COMBINATORS

                              29th July 1996

                 Graham Hutton               Erik Meijer
            University of Nottingham    University of Utrecht

This Haskell 1.3 script defines a library of parser combinators, and is taken
from sections 1-6 of our article "Monadic Parser Combinators".  Some changes
to the library have been made in the move from Gofer to Haskell:

   * Do notation is used in place of monad comprehension notation;

   * The parser datatype is defined using "newtype", to avoid the overhead
     of tagging and untagging parsers with the P constructor.

-----------------------------------------------------------------------------}

module ParseLib
   (Parser(..), item, papply, (+++), {-sat,-} tok, many, many1, sepby, sepby1, chainl,
    chainl1, chainr, chainr1, ops, bracket, elserror, cut {-, char, digit, lower, upper,
    letter, alphanum, string, ident, nat, int, spaces, comment, junk,
    parse, token, natural, integer, symbol, identifier-}) where

import Char
import HandLex (Token(..), TokenT, Posn)
import Monad

infixr 5 +++

#if defined (__HASKELL98__)
#define MPLUS `mplus`
#else
#define fmap map
#define mzero zero
#define MPLUS ++
#endif

--- The parser monad ---------------------------------------------------------

newtype Parser a   = P ([Token] -> [(a,[Token])])

instance Functor Parser where
   -- fmap         :: (a -> b) -> (Parser a -> Parser b)
   fmap f (P p)     = P (\inp -> [(f v, out) | (v,out) <- p inp])

instance Monad Parser where
   -- return      :: a -> Parser a
   return v        = P (\inp -> [(v,inp)])

   -- >>=         :: Parser a -> (a -> Parser b) -> Parser b
   (P p) >>= f     = P (\inp -> concat [papply (f v) out | (v,out) <- p inp])

#if defined(__HASKELL98__)
   fail s          = P (\inp -> [])
#endif

#if defined(__HASKELL98__)
instance MonadPlus Parser where
#else
instance MonadZero Parser where
#endif
   -- mzero            :: Parser a
   mzero                = P (\inp -> [])
#if !defined(__HASKELL98__)
instance MonadPlus Parser where
#endif
   -- mplus            :: Parser a -> Parser a -> Parser a
   (P p) MPLUS (P q)    = P (\inp -> (p inp ++ q inp))

--- Other primitive parser combinators ---------------------------------------

--item              :: Parser Char
--item               = P (\inp -> case inp of
--                                   []     -> []
--                                   (x:xs) -> [(x,xs)])

item               :: Parser Token
item                = P (\inp -> case inp of
                                   []     -> []
                                   (x:xs) -> [(x,xs)])

force             :: Parser a -> Parser a
force (P p)        = P (\inp -> let x = p inp in
                                (fst (head x), snd (head x)) : tail x)

first             :: Parser a -> Parser a
first (P p)        = P (\inp -> case p inp of
                                   []     -> []
                                   (x:xs) -> [x])

papply            :: Parser a -> [Token] -> [(a,[Token])]
papply (P p) inp   = p inp

cut               :: Parser a -> Parser b -> Parser b
(P p) `cut` q      = P (\inp -> case p inp of
                                   []         -> []
                                   ((x,ss):_) -> papply q ss)

--- Derived combinators ------------------------------------------------------

(+++)             :: Parser a -> Parser a -> Parser a
p +++ q            = first (p MPLUS q)

--sat               :: (Char -> Bool) -> Parser Char
--sat p              = do {x <- item; if p x then return x else mzero}

tok               :: TokenT -> Parser TokenT
tok t              = do {x <- item; if t==snd x then return t else mzero}

many              :: Parser a -> Parser [a]
many p             = many1 p +++ return []
--many p           = force (many1 p +++ return [])

many1             :: Parser a -> Parser [a]
many1 p            = do {x <- p; xs <- many p; return (x:xs)}

sepby             :: Parser a -> Parser b -> Parser [a]
p `sepby` sep      = (p `sepby1` sep) +++ return []

sepby1            :: Parser a -> Parser b -> Parser [a]
p `sepby1` sep     = do {x <- p; xs <- many (do {sep; p}); return (x:xs)}

chainl            :: Parser a -> Parser (a -> a -> a) -> a -> Parser a
chainl p op v      = (p `chainl1` op) +++ return v

chainl1           :: Parser a -> Parser (a -> a -> a) -> Parser a
p `chainl1` op     = do {x <- p; rest x}
                     where
                        rest x = do {f <- op; y <- p; rest (f x y)}
                                 +++ return x

chainr            :: Parser a -> Parser (a -> a -> a) -> a -> Parser a
chainr p op v      = (p `chainr1` op) +++ return v

chainr1           :: Parser a -> Parser (a -> a -> a) -> Parser a
p `chainr1` op     = do {x <- p; rest x}
                     where
                        rest x = do {f <- op; y <- p `chainr1` op; return (f x y)}
                                 +++ return x

ops               :: [(Parser a, b)] -> Parser b
ops xs             = foldr1 (+++) [do {p; return op} | (p,op) <- xs]

bracket           :: Parser a -> Parser b -> Parser c -> Parser b
bracket open p close = do {open;
                           x <- p;
                           close;
                           return x}

elserror          :: Parser a -> String -> Parser a
p `elserror` s     = p +++
                     (P (\inp->
                         case inp of
                           [] -> error "Parse error: unexpected EOF\n"
                           ((p,t):_) ->
                                 error ("Parse error at "++show p++": "++s++"\n"++
                                        "    next token: "++show t)))


{-- Useful parsers -----------------------------------------------------------

char              :: Char -> Parser Char
char x             = sat (\y -> x == y)

digit             :: Parser Char
digit              = sat isDigit

lower             :: Parser Char
lower              = sat isLower

upper             :: Parser Char
upper              = sat isUpper

letter            :: Parser Char
letter             = sat isAlpha

alphanum          :: Parser Char
alphanum           = sat isAlphaNum

string            :: String -> Parser String
string ""          = return ""
string (x:xs)      = do {char x; string xs; return (x:xs)}

ident             :: Parser String
ident              = do {x <- lower; xs <- many alphanum; return (x:xs)}

nat               :: Parser Int
nat                = do {x <- digit; return (fromEnum x - fromEnum '0')} `chainl1` return op
                     where
                        m `op` n = 10*m + n

int               :: Parser Int
int                = do {char '-'; n <- nat; return (-n)} +++ nat

--- Lexical combinators ------------------------------------------------------

spaces            :: Parser ()
spaces             = do {many1 (sat isSpace); return ()}

comment           :: Parser ()
--comment            = do {string "--"; many (sat (\x -> x /= '\n')); return ()}
comment            = do 
                       _ <- string "--"
                       _ <- many (sat (\x -> x /= '\n'))
                       return ()

junk              :: Parser ()
junk               = do {many (spaces +++ comment); return ()}

parse             :: Parser a -> Parser a
parse p            = do {junk; p}

token             :: Parser a -> Parser a
token p            = do {v <- p; junk; return v}

--- Token parsers ------------------------------------------------------------

natural           :: Parser Int
natural            = token nat

integer           :: Parser Int
integer            = token int

symbol            :: String -> Parser String
symbol xs          = token (string xs)

identifier        :: [String] -> Parser String
identifier ks      = token (do {x <- ident;
                                if not (elem x ks) then return x
                                else return mzero})

-----------------------------------------------------------------------------}
