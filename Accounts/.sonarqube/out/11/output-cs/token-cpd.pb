¢
QC:\Fac\SysopSquadAccounts\Accounts\Persistence\Context\AccountDatabaseSettings.cs
	namespace 	
Persistence
 
. 
Context 
{ 
public 

class #
AccountDatabaseSettings (
:) *$
IAccountDatabaseSettings+ C
{ 
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
DatabaseName "
{# $
get% (
;( )
set* -
;- .
}/ 0
}		 
}

 Ø
NC:\Fac\SysopSquadAccounts\Accounts\Persistence\Context\ApplicationDbContext.cs
	namespace 	
Persistence
 
. 
Context 
{ 
public 

class  
ApplicationDbContext %
:& '!
IApplicationDbContext( =
{ 
private 
readonly 
IMongoDatabase '
	_database( 1
;1 2
public		 
MongoClient		 
Client		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

  
ApplicationDbContext

 #
(

# $$
IAccountDatabaseSettings

$ <
settings

= E
)

E F
{ 	
Client 
= 
new 
MongoClient $
($ %
settings% -
.- .
ConnectionString. >
)> ?
;? @
	_database 
= 
Client 
. 
GetDatabase *
(* +
settings+ 3
.3 4
DatabaseName4 @
)@ A
;A B
} 	
public 
IMongoCollection 
<  
T  !
>! "
GetCollection# 0
<0 1
T1 2
>2 3
(3 4
)4 5
{ 	
return 
	_database 
. 
GetCollection *
<* +
T+ ,
>, -
(- .
typeof. 4
(4 5
T5 6
)6 7
.7 8
Name8 <
+< =
$str= @
)@ A
;A B
} 	
} 
} ÿ3
EC:\Fac\SysopSquadAccounts\Accounts\Persistence\DependencyInjection.cs
	namespace 	
Persistence
 
{ 
public 

static 
class 
DependencyInjection +
{ 
public 
static 
void 
AddPersistence )
() *
this* .
IServiceCollection/ A
servicesB J
,J K
IConfigurationL Z
configuration[ h
)h i
{ 	
services 
. 
	Configure 
< #
AccountDatabaseSettings 6
>6 7
(7 8
configuration8 E
.E F

GetSectionF P
(P Q
$strQ j
)j k
)k l
;l m
services 
. 
AddSingleton !
<! "$
IAccountDatabaseSettings" :
>: ;
(; <
sp< >
=>? A
sp 
. 
GetRequiredService %
<% &
IOptions& .
<. /#
AccountDatabaseSettings/ F
>F G
>G H
(H I
)I J
.J K
ValueK P
)P Q
;Q R
services 
. 
	AddScoped 
< !
IApplicationDbContext 4
,4 5 
ApplicationDbContext6 J
>J K
(K L
)L M
;M N
services 
. 
	AddScoped 
< 
IUserRepository .
,. /
UserRepository0 >
>> ?
(? @
)@ A
;A B
services 
. 
	AddScoped 
< !
IConsultantRepository 4
,4 5 
ConsultantRepository6 J
>J K
(K L
)L M
;M N
services 
. 
	AddScoped 
< 
IAccountRepository 1
,1 2
AccountRepository3 D
>D E
(E F
)F G
;G H
var 
mongoCon 
= 
configuration (
.( )

GetSection) 3
(3 4
$str4 M
)M N
[N O
$strO a
]a b
;b c
services 
. 
AddSingleton !
<! "
IMongoClient" .
>. /
(/ 0
new0 3
MongoClient4 ?
(? @
mongoCon@ H
)H I
)I J
;J K
var!! 
key!! 
=!! 
Encoding!! 
.!! 
ASCII!! $
.!!$ %
GetBytes!!% -
(!!- .
AppSettings!!. 9
.!!9 :
Secret!!: @
)!!@ A
;!!A B
services"" 
."" 
AddAuthentication"" &
(""& '
x""' (
=>"") +
{## 
x$$ 
.$$ %
DefaultAuthenticateScheme$$ /
=$$0 1
JwtBearerDefaults$$2 C
.$$C D 
AuthenticationScheme$$D X
;$$X Y
x%% 
.%% "
DefaultChallengeScheme%% ,
=%%- .
JwtBearerDefaults%%/ @
.%%@ A 
AuthenticationScheme%%A U
;%%U V
}&& 
)&& 
.'' 
AddJwtBearer'' 
('' 
x'' 
=>''  "
{(( 
x)) 
.)) 
Events)) 
=)) 
new)) "
JwtBearerEvents))# 2
{** 
OnTokenValidated++ (
=++) *
context+++ 2
=>++3 5
{,, 
var-- 
userService--  +
=--, -
context--. 5
.--5 6
HttpContext--6 A
.--A B
RequestServices--B Q
.--Q R
GetRequiredService--R d
<--d e
IUserRepository--e t
>--t u
(--u v
)--v w
;--w x
var.. 
userId..  &
=..' (
context..) 0
...0 1
	Principal..1 :
...: ;
Identity..; C
...C D
Name..D H
;..H I
var// 
user//  $
=//% &
userService//' 2
.//2 3
GetByIdAsync//3 ?
(//? @
userId//@ F
)//F G
;//G H
if00 
(00  
user00  $
==00% '
null00( ,
)00, -
{11 
context22  '
.22' (
Fail22( ,
(22, -
$str22- ;
)22; <
;22< =
}33 
var55 
consultantService55  1
=552 3
context554 ;
.55; <
HttpContext55< G
.55G H
RequestServices55H W
.55W X
GetRequiredService55X j
<55j k"
IConsultantRepository	55k Ä
>
55Ä Å
(
55Å Ç
)
55Ç É
;
55É Ñ
var66 
consultantId66  ,
=66- .
context66/ 6
.666 7
	Principal667 @
.66@ A
Identity66A I
.66I J
Name66J N
;66N O
var77 

consultant77  *
=77+ ,
consultantService77- >
.77> ?
GetByIdAsync77? K
(77K L
consultantId77L X
)77X Y
;77Y Z
if88 
(88  

consultant88  *
==88+ -
null88. 2
)882 3
{99 
context::  '
.::' (
Fail::( ,
(::, -
$str::- ;
)::; <
;::< =
};; 
return== "
Task==# '
.==' (
CompletedTask==( 5
;==5 6
}?? 
}@@ 
;@@ 
xAA 
.AA  
RequireHttpsMetadataAA *
=AA+ ,
falseAA- 2
;AA2 3
xBB 
.BB 
	SaveTokenBB 
=BB  !
trueBB" &
;BB& '
xCC 
.CC %
TokenValidationParametersCC /
=CC0 1
newCC2 5%
TokenValidationParametersCC6 O
{DD $
ValidateIssuerSigningKeyEE 0
=EE1 2
trueEE3 7
,EE7 8
IssuerSigningKeyFF (
=FF) *
newFF+ . 
SymmetricSecurityKeyFF/ C
(FFC D
keyFFD G
)FFG H
,FFH I
ValidateIssuerGG &
=GG' (
falseGG) .
,GG. /
ValidateAudienceHH (
=HH) *
falseHH+ 0
}II 
;II 
}JJ 
)JJ 
;JJ 
}KK 	
}LL 
}MM ø
EC:\Fac\SysopSquadAccounts\Accounts\Persistence\Helpers\AppSettings.cs
	namespace 	
Persistence
 
. 
Helpers 
{ 
internal 
static 
class 
AppSettings %
{ 
internal 
static 
readonly  
string! '
Secret( .
=/ 0
$str1 D
;D E
} 
} ™
QC:\Fac\SysopSquadAccounts\Accounts\Persistence\Repository\v1\AccountRepository.cs
	namespace 	
Persistence
 
. 

Repository  
.  !
v1! #
{ 
public 

class 
AccountRepository "
:# $
IAccountRepository% 7
{ 
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
public 
AccountRepository  
(  !!
IApplicationDbContext! 6
context7 >
)> ?
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
TEntity !
>! "
GetByEmailAsync# 2
<2 3
TEntity3 :
>: ;
(; <
string< B
emailC H
)H I
whereJ O
TEntityP W
:W X

BaseEntityX b
{ 	
return 
await 
_context !
.! "
GetCollection" /
</ 0
TEntity0 7
>7 8
(8 9
)9 :
.: ;
Find; ?
<? @
TEntity@ G
>G H
(H I
entityI O
=>P R
entityS Y
.Y Z
EmailZ _
==` b
emailc h
)h i
.i j
FirstOrDefaultAsyncj }
(} ~
)~ 
;	 Ä
} 	
public 
ResponseEntity 
Login #
(# $
ResponseEntity$ 2
entity3 9
)9 :
{ 	
var 
tokenHandler 
= 
new "#
JwtSecurityTokenHandler# :
(: ;
); <
;< =
var 
key 
= 
Encoding 
. 
ASCII $
.$ %
GetBytes% -
(- .
AppSettings. 9
.9 :
Secret: @
)@ A
;A B
var   
tokenDescriptor   
=    !
new  " %#
SecurityTokenDescriptor  & =
{!! 
Subject"" 
="" 
new"" 
ClaimsIdentity"" ,
("", -
new""- 0
Claim""1 6
[""6 7
]""7 8
{## 
new$$ 
Claim$$ 
($$ 

ClaimTypes$$ (
.$$( )
Name$$) -
,$$- .
entity$$/ 5
.$$5 6
Id$$6 8
.$$8 9
ToString$$9 A
($$A B
)$$B C
)$$C D
}%% 
)%% 
,%% 
Expires&& 
=&& 
DateTime&& "
.&&" #
UtcNow&&# )
.&&) *
AddDays&&* 1
(&&1 2
$num&&2 3
)&&3 4
,&&4 5
SigningCredentials'' "
=''# $
new''% (
SigningCredentials'') ;
(''; <
new''< ? 
SymmetricSecurityKey''@ T
(''T U
key''U X
)''X Y
,''Y Z
SecurityAlgorithms''[ m
.''m n 
HmacSha256Signature	''n Å
)
''Å Ç
}(( 
;(( 
var** 
token** 
=** 
tokenHandler** $
.**$ %
CreateToken**% 0
(**0 1
tokenDescriptor**1 @
)**@ A
;**A B
var++ 
tokenString++ 
=++ 
tokenHandler++ *
.++* +

WriteToken+++ 5
(++5 6
token++6 ;
)++; <
;++< =
entity,, 
.,, 
Token,, 
=,, 
tokenString,, &
;,,& '
return-- 
entity-- 
;-- 
}.. 	
}// 
}00 „?
TC:\Fac\SysopSquadAccounts\Accounts\Persistence\Repository\v1\ConsultantRepository.cs
	namespace		 	
Persistence		
 
.		 

Repository		  
.		  !
v1		! #
{

 
public 

class  
ConsultantRepository %
:& '

Repository( 2
<2 3

Consultant3 =
>= >
,> ?!
IConsultantRepository@ U
{ 
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
public  
ConsultantRepository #
(# $!
IApplicationDbContext$ 9
context: A
)A B
:C D
baseE I
(I J
contextJ Q
)Q R
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 

Consultant $
>$ %
FindBestConsultant& 8
(8 9"
GetBestConsultantQuery9 O
queryP U
)U V
{ 	
var 
skillFilter 
= 
Builders &
<& '

Consultant' 1
>1 2
.2 3
Filter3 9
.9 :
Eq: <
(< =

consultant= G
=>H J

consultantK U
.U V
SkillV [
,[ \
query] b
.b c
Skillc h
)h i
;i j
var 
availabilityFilter "
=# $
Builders% -
<- .

Consultant. 8
>8 9
.9 :
Filter: @
.@ A
EqA C
(C D

consultantD N
=>O Q

consultantR \
.\ ]
Availability] i
,i j
$strk v
)v w
;w x
var 
locationFilter 
=  
Builders! )
<) *

Consultant* 4
>4 5
.5 6
Filter6 <
.< =
Eq= ?
(? @

consultant@ J
=>K M

consultantN X
.X Y
LocationY a
,a b
queryc h
.h i
Locationi q
)q r
;r s
var !
numberOfTicketsFilter %
=& '
Builders( 0
<0 1

Consultant1 ;
>; <
.< =
Filter= C
.C D
GtD F
(F G

consultantG Q
=>R T

consultantU _
._ `
NumberOfTickets` o
,o p
$numq r
)r s
;s t
var 
filter 
= 
Builders !
<! "

Consultant" ,
>, -
.- .
Filter. 4
.4 5
And5 8
(8 9
skillFilter9 D
,D E
availabilityFilterF X
,X Y
locationFilterZ h
,h i!
numberOfTicketsFilterj 
)	 Ä
;
Ä Å
var 
consultants 
= 
await #
_context$ ,
., -
GetCollection- :
<: ;

Consultant; E
>E F
(F G
)G H
.H I
	FindAsyncI R
<R S

ConsultantS ]
>] ^
(^ _
filter_ e
)e f
.f g
Resultg m
.m n
ToListAsyncn y
(y z
)z {
;{ |
var 
maxNumberOfTickets "
=# $
consultants% 0
.0 1
Max1 4
(4 5

consultant5 ?
=>@ B

consultantC M
.M N
NumberOfTicketsN ]
)] ^
;^ _
return 
consultants 
. 
Find #
(# $

consultant$ .
=>/ 1

consultant2 <
.< =
NumberOfTickets= L
==M O
maxNumberOfTicketsP b
)b c
;c d
}   	
public"" 
async"" 
Task"" 
<"" 

Consultant"" $
>""$ %
UpdateConsultant""& 6
(""6 7

Consultant""7 A

consultant""B L
)""L M
{## 	
var$$ 
foundEntity$$ 
=$$ 
await$$ #
GetByIdAsync$$$ 0
($$0 1

consultant$$1 ;
.$$; <
Id$$< >
)$$> ?
;$$? @
if&& 
(&& 
UpdateHelper&& 
.&& 
	CheckNull&& &
(&&& '

consultant&&' 1
.&&1 2
Email&&2 7
)&&7 8
)&&8 9
{&&9 :
foundEntity(( 
.(( 
Email(( !
=((" #

consultant(($ .
.((. /
Email((/ 4
;((4 5
})) 
if++ 
(++ 
UpdateHelper++ 
.++ 
	CheckNull++ &
(++& '

consultant++' 1
.++1 2
Username++2 :
)++: ;
)++; <
{,, 
foundEntity.. 
... 
Username.. $
=..% &

consultant..' 1
...1 2
Username..2 :
;..: ;
}// 
if11 
(11 
UpdateHelper11 
.11 
	CheckNull11 &
(11& '

consultant11' 1
.111 2
Location112 :
)11: ;
)11; <
{22 
foundEntity44 
.44 
Location44 $
=44% &

consultant44' 1
.441 2
Location442 :
;44: ;
}55 
if77 
(77 
UpdateHelper77 
.77 
	CheckNull77 &
(77& '

consultant77' 1
.771 2
Availability772 >
)77> ?
)77? @
{88 
foundEntity:: 
.:: 
Availability:: (
=::) *

consultant::+ 5
.::5 6
Availability::6 B
;::B C
};; 
if== 
(== 
UpdateHelper== 
.== 
	CheckNull== &
(==& '

consultant==' 1
.==1 2
Skill==2 7
)==7 8
)==8 9
{>> 
foundEntity@@ 
.@@ 
Skill@@ !
=@@" #

consultant@@$ .
.@@. /
Skill@@/ 4
;@@4 5
}AA 
ifCC 
(CC 

consultantCC 
.CC 
NumberOfTicketsCC *
!=CC+ -
$numCC. /
)CC/ 0
{DD 
foundEntityEE 
.EE 
NumberOfTicketsEE +
=EE, -

consultantEE. 8
.EE8 9
NumberOfTicketsEE9 H
;EEH I
}FF 
ifHH 
(HH 

consultantHH 
.HH 
PasswordHashHH '
!=HH( *
nullHH+ /
&&HH0 2

consultantHH3 =
.HH= >
PasswordSaltHH> J
!=HHK M
nullHHN R
)HHR S
{II 
foundEntityJJ 
.JJ 
PasswordHashJJ (
=JJ) *

consultantJJ+ 5
.JJ5 6
PasswordHashJJ6 B
;JJB C
foundEntityKK 
.KK 
PasswordSaltKK (
=KK) *

consultantKK+ 5
.KK5 6
PasswordSaltKK6 B
;KKB C
}LL 
awaitNN 
_contextNN 
.NN 
GetCollectionNN (
<NN( )

ConsultantNN) 3
>NN3 4
(NN4 5
)NN5 6
.NN6 7
ReplaceOneAsyncNN7 F
(NNF G
filterNNG M
:NNM N

consultantNNO Y
=>NNZ \

consultantNN] g
.NNg h
IdNNh j
==NNk m
foundEntityNNn y
.NNy z
IdNNz |
,NN| }
replacement	NN~ â
:
NNâ ä
foundEntity
NNã ñ
)
NNñ ó
;
NNó ò
returnPP 
foundEntityPP 
;PP 
}QQ 	
}TT 
}UU ˇG
JC:\Fac\SysopSquadAccounts\Accounts\Persistence\Repository\v1\Repository.cs
	namespace

 	
Persistence


 
.

 

Repository

  
.

  !
v1

! #
{ 
public 

class 

Repository 
< 
TEntity #
># $
:% &
IRepository' 2
<2 3
TEntity3 :
>: ;
where< A
TEntityB I
:J K

BaseEntityL V
{ 
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
public 

Repository 
( !
IApplicationDbContext /
context0 7
)7 8
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
TEntity& -
>- .
>. /
GetAllAsync0 ;
(; <
)< =
{ 	
return 
await 
_context !
.! "
GetCollection" /
</ 0
TEntity0 7
>7 8
(8 9
)9 :
.: ;
	FindAsync; D
(D E
entityE K
=>L N
trueO S
)S T
.T U
ResultU [
.[ \
ToListAsync\ g
(g h
)h i
;i j
} 	
public 
async 
Task 
< 
TEntity !
>! "
GetByIdAsync# /
(/ 0
string0 6
id7 9
)9 :
{ 	
return 
await 
_context !
.! "
GetCollection" /
</ 0
TEntity0 7
>7 8
(8 9
)9 :
.: ;
Find; ?
<? @
TEntity@ G
>G H
(H I
entityI O
=>P R
entityS Y
.Y Z
IdZ \
==] _
id` b
)b c
.c d
FirstOrDefaultAsyncd w
(w x
)x y
;y z
} 	
private 
async 
Task 
< 
T 
> 
GetByEmailAsync -
<- .
T. /
>/ 0
(0 1
string1 7
email8 =
)= >
where? D
TE F
:F G

BaseEntityG Q
{   	
return!! 
await!! 
_context!! !
.!!! "
GetCollection!!" /
<!!/ 0
T!!0 1
>!!1 2
(!!2 3
)!!3 4
.""! "
	FindAsync""" +
<""+ ,
T"", -
>""- .
("". /
person""/ 5
=>""6 8
person""9 ?
.""? @
Email""@ E
==""F H
email""I N
)""N O
.""O P
Result""P V
.##! "
FirstOrDefaultAsync##" 5
(##5 6
)##6 7
;##7 8
}$$ 	
public&& 
async&& 
Task&& 
<&& 
bool&& 
>&& 
CheckUniqueEmail&&  0
(&&0 1
string&&1 7
email&&8 =
)&&= >
{'' 	
var(( 
user(( 
=(( 
await(( 
GetByEmailAsync(( ,
<((, -
User((- 1
>((1 2
(((2 3
email((3 8
)((8 9
;((9 :
var)) 

consultant)) 
=)) 
await)) "
GetByEmailAsync))# 2
<))2 3

Consultant))3 =
>))= >
())> ?
email))? D
)))D E
;))E F
if** 
(** 
user** 
==** 
null** 
&&** 

consultant**  *
==**+ -
null**. 2
)**2 3
{++ 
return,, 
false,, 
;,, 
}-- 
return.. 
true.. 
;.. 
}// 	
public11 
async11 
Task11 
<11 
TEntity11 !
>11! "
CreateAsync11# .
(11. /
TEntity11/ 6
entity117 =
)11= >
{22 	
await33 
_context33 
.33 
GetCollection33 (
<33( )
TEntity33) 0
>330 1
(331 2
)332 3
.333 4
InsertOneAsync334 B
(33B C
entity33C I
)33I J
;33J K
return44 
entity44 
;44 
}55 	
public77 
async77 
Task77 
<77 
TEntity77 !
>77! "
UpdateAsync77# .
(77. /
TEntity77/ 6
entity777 =
)77= >
{88 	
var99 
foundEntity99 
=99 
await99 #
GetByIdAsync99$ 0
(990 1
entity991 7
.997 8
Id998 :
)99: ;
;99; <
if:: 
(:: 
foundEntity:: 
==:: 
null:: #
)::# $
{;; 
throw<< 
new<< 
ArgumentException<< +
(<<+ ,
RepositoryErrors<<, <
.<<< =
UserNotFound<<= I
)<<I J
;<<J K
}== 
if?? 
(?? 
!?? 
string?? 
.?? 
IsNullOrWhiteSpace?? *
(??* +
entity??+ 1
.??1 2
Email??2 7
)??7 8
&&??9 ;
entity??< B
.??B C
Email??C H
!=??I K
foundEntity??L W
.??W X
Email??X ]
)??] ^
{@@ 
ifAA 
(AA 
awaitAA 
CheckUniqueEmailAA *
(AA* +
entityAA+ 1
.AA1 2
EmailAA2 7
)AA7 8
)AA8 9
throwBB 
newBB 
ArgumentExceptionBB /
(BB/ 0
RepositoryErrorsBB0 @
.BB@ A
EmailNotUniqueBBA O
)BBO P
;BBP Q
foundEntityDD 
.DD 
EmailDD !
=DD" #
entityDD$ *
.DD* +
EmailDD+ 0
;DD0 1
}EE 
ifFF 
(FF 
!FF 
stringFF 
.FF 
IsNullOrWhiteSpaceFF *
(FF* +
entityFF+ 1
.FF1 2
UsernameFF2 :
)FF: ;
)FF; <
{GG 
foundEntityHH 
.HH 
UsernameHH $
=HH% &
entityHH' -
.HH- .
UsernameHH. 6
;HH6 7
}JJ 
ifKK 
(KK 
!KK 
stringKK 
.KK 
IsNullOrWhiteSpaceKK *
(KK* +
entityKK+ 1
.KK1 2
LocationKK2 :
)KK: ;
)KK; <
{LL 
foundEntityMM 
.MM 
LocationMM $
=MM% &
entityMM' -
.MM- .
LocationMM. 6
;MM6 7
}NN 
ifOO 
(OO 
entityOO 
.OO 
PasswordHashOO #
!=OO$ &
nullOO' +
&&OO, .
entityOO/ 5
.OO5 6
PasswordSaltOO6 B
!=OOC E
nullOOF J
)OOJ K
{PP 
foundEntityQQ 
.QQ 
PasswordHashQQ (
=QQ) *
entityQQ+ 1
.QQ1 2
PasswordHashQQ2 >
;QQ> ?
foundEntityRR 
.RR 
PasswordSaltRR (
=RR) *
entityRR+ 1
.RR1 2
PasswordSaltRR2 >
;RR> ?
}SS 
awaitUU 
_contextUU 
.UU 
GetCollectionUU (
<UU( )
TEntityUU) 0
>UU0 1
(UU1 2
)UU2 3
.UU3 4
ReplaceOneAsyncUU4 C
(UUC D
filterUUD J
:UUJ K
personUUL R
=>UUS U
personUUV \
.UU\ ]
IdUU] _
==UU` b
foundEntityUUc n
.UUn o
IdUUo q
,UUq r
replacementUUs ~
:UU~ 
foundEntity
UUÄ ã
)
UUã å
;
UUå ç
returnVV 
foundEntityVV 
;VV 
}WW 	
publicYY 
asyncYY 
TaskYY 
<YY 
boolYY 
>YY 
DeleteAsyncYY  +
(YY+ ,
stringYY, 2
idYY3 5
)YY5 6
{ZZ 	
var[[ 
deleteResult[[ 
=[[ 
await[[ $
_context[[% -
.[[- .
GetCollection[[. ;
<[[; <
TEntity[[< C
>[[C D
([[D E
)[[E F
.[[F G
DeleteOneAsync[[G U
([[U V
user[[V Z
=>[[[ ]
user[[^ b
.[[b c
Id[[c e
==[[f h
id[[i k
)[[k l
;[[l m
return]] 
deleteResult]] 
.]]  
IsAcknowledged]]  .
&&]]/ 1
deleteResult]]2 >
.]]> ?
DeletedCount]]? K
>]]L M
$num]]N O
;]]O P
}^^ 	
}__ 
}`` ú#
NC:\Fac\SysopSquadAccounts\Accounts\Persistence\Repository\v1\UserRepository.cs
	namespace 	
Persistence
 
. 

Repository  
.  !
v1! #
{ 
public		 

class		 
UserRepository		 
:		  !

Repository		" ,
<		, -
User		- 1
>		1 2
,		2 3
IUserRepository		4 C
{

 
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
public 
UserRepository 
( !
IApplicationDbContext 3
context4 ;
); <
:= >
base? C
(C D
contextD K
)K L
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
User 
> 

UpdateUser  *
(* +
User+ /
user0 4
)4 5
{ 	
var 
foundEntity 
= 
await #
GetByIdAsync$ 0
(0 1
user1 5
.5 6
Id6 8
)8 9
;9 :
if 
( 
UpdateHelper 
. 
	CheckNull &
(& '
user' +
.+ ,
Email, 1
)1 2
)2 3
{ 
foundEntity 
. 
Email !
=" #
user$ (
.( )
Email) .
;. /
} 
if 
( 
UpdateHelper 
. 
	CheckNull &
(& '
user' +
.+ ,
Username, 4
)4 5
)5 6
{ 
foundEntity 
. 
Username $
=% &
user' +
.+ ,
Username, 4
;4 5
}   
if"" 
("" 
UpdateHelper"" 
."" 
	CheckNull"" &
(""& '
user""' +
.""+ ,
Location"", 4
)""4 5
)""5 6
{## 
foundEntity%% 
.%% 
Location%% $
=%%% &
user%%' +
.%%+ ,
Location%%, 4
;%%4 5
}&& 
if(( 
((( 
user(( 
.(( 
PasswordHash(( !
!=((" $
null((% )
&&((* ,
user((- 1
.((1 2
PasswordSalt((2 >
!=((? A
null((B F
)((F G
{)) 
foundEntity** 
.** 
PasswordHash** (
=**) *
user**+ /
.**/ 0
PasswordHash**0 <
;**< =
foundEntity++ 
.++ 
PasswordSalt++ (
=++) *
user+++ /
.++/ 0
PasswordSalt++0 <
;++< =
},, 
if.. 
(.. 
user.. 
... 
	TicketsId.. 
... 
Count.. $
>..% &
$num..' (
)..( )
{// 
if00 
(00 
foundEntity00 
.00 
	TicketsId00 (
.00( )
Count00) .
==00/ 1
$num002 3
)003 4
{11 
foundEntity22 
.22  
	TicketsId22  )
=22* +
user22, 0
.220 1
	TicketsId221 :
;22: ;
}33 
else44 
{55 
foreach66 
(66 
var66 
ticket66  &
in66' )
user66* .
.66. /
	TicketsId66/ 8
)668 9
{77 
foundEntity88 #
.88# $
	AddTicket88$ -
(88- .
ticket88. 4
)884 5
;885 6
}99 
}:: 
};; 
await== 
_context== 
.== 
GetCollection== (
<==( )
User==) -
>==- .
(==. /
)==/ 0
.==0 1
ReplaceOneAsync==1 @
(==@ A
filter==A G
:==G H
user==I M
=>==N P
user==Q U
.==U V
Id==V X
====Y [
foundEntity==\ g
.==g h
Id==h j
,==j k
replacement==l w
:==w x
foundEntity	==y Ñ
)
==Ñ Ö
;
==Ö Ü
return?? 
foundEntity?? 
;?? 
}@@ 	
}AA 
}BB 