Ô
JC:\Fac\SysopSquadAccounts\Accounts\WebApi\Controllers\BaseApiController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[		 
	Authorize		 
]		 
public

 

class

 
BaseApiController

 "
:

# $
ControllerBase

% 3
{ 
	protected 
	IMediator 
Mediator $
;$ %
public 
BaseApiController  
(  !
	IMediator! *
mediator+ 3
)3 4
{ 	
this 
. 
Mediator 
= 
mediator $
;$ %
} 	
} 
} û
NC:\Fac\SysopSquadAccounts\Accounts\WebApi\Controllers\v1\AccountsController.cs
	namespace		 	
WebApi		
 
.		 
Controllers		 
.		 
v1		 
{

 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class 
AccountsController #
:# $
BaseApiController% 6
{ 
public 
AccountsController !
(! "
	IMediator" +
mediator, 4
)4 5
:6 7
base8 <
(< =
mediator= E
)E F
{ 	
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
)5 6
]6 7
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status400BadRequest* =
)= >
]> ?
[ 	
AllowAnonymous	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Login) .
(. /
[/ 0
FromBody0 8
]8 9
LoginCommand: F
commandG N
)N O
{ 	
try 
{ 
return 
Ok 
( 
await 
Mediator  (
.( )
Send) -
(- .
command. 5
)5 6
)6 7
;7 8
} 
catch 
( 
	Exception 
ex 
)  
{ 
return 

BadRequest !
(! "
new" %
{& '
error( -
=. /
ex0 2
.2 3
Message3 :
}; <
)< =
;= >
} 
}!! 	
}"" 
}## ç;
QC:\Fac\SysopSquadAccounts\Accounts\WebApi\Controllers\v1\ConsultantsController.cs
	namespace 	
WebApi
 
. 
Controllers 
. 
v1 
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class !
ConsultantsController &
:' (
BaseApiController) :
{ 
public !
ConsultantsController $
($ %
	IMediator% .
mediator/ 7
)7 8
:9 :
base; ?
(? @
mediator@ H
)H I
{ 	
} 	
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
)5 6
]6 7
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
return 
Ok 
( 
await 
Mediator $
.$ %
Send% )
() *
new* -"
GetAllConsultantsQuery. D
(D E
)E F
)F G
)G H
;H I
} 	
[ 	
HttpGet	 
( 
$str "
)" #
]# $
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
)5 6
]6 7
[   	
AllowAnonymous  	 
]   
public!! 
async!! 
Task!! 
<!! 
IActionResult!! '
>!!' (
GetById!!) 0
(!!0 1
string!!1 7
id!!8 :
)!!: ;
{"" 	
try## 
{$$ 
return%% 
Ok%% 
(%% 
await%% 
Mediator%%  (
.%%( )
Send%%) -
(%%- .
new%%. 1"
GetConsultantByIdQuery%%2 H
(%%H I
id%%I K
)%%K L
)%%L M
)%%M N
;%%N O
}&& 
catch'' 
('' 
	Exception'' 
ex'' 
)''  
{(( 
return)) 

BadRequest)) !
())! "
new))" %
{))& '
error))( -
=)). /
ex))0 2
.))2 3
Message))3 :
})); <
)))< =
;))= >
}** 
}++ 	
[-- 	
HttpGet--	 
(-- 
$str-- 
)-- 
]-- 
[.. 	 
ProducesResponseType..	 
(.. 
StatusCodes.. )
...) *
Status200OK..* 5
)..5 6
]..6 7
[// 	
AllowAnonymous//	 
]// 
public00 
async00 
Task00 
<00 
IActionResult00 '
>00' (
GetBestConsultant00) :
(00: ;
[00; <
	FromQuery00< E
(00E F
Name00F J
=00K L
$str00M T
)00T U
]00U V
string00W ]
skill00^ c
,00c d
[00d e
	FromQuery00e n
(00n o
Name00o s
=00t u
$str	00v Ä
)
00Ä Å
]
00Å Ç
string
00É â
location
00ä í
)
00í ì
{11 	
return22 
Ok22 
(22 
await22 
Mediator22 $
.22$ %
Send22% )
(22) *
new22* -"
GetBestConsultantQuery22. D
(22D E
skill22E J
,22J K
location22L T
)22T U
)22U V
)22V W
;22W X
}33 	
[55 	

HttpDelete55	 
(55 
$str55 %
)55% &
]55& '
[66 	 
ProducesResponseType66	 
(66 
StatusCodes66 )
.66) *
Status204NoContent66* <
)66< =
]66= >
[77 	 
ProducesResponseType77	 
(77 
StatusCodes77 )
.77) *
Status404NotFound77* ;
)77; <
]77< =
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' (
Delete88) /
(88/ 0
string880 6
id887 9
)889 :
{99 	
var:: 
deleted:: 
=:: 
await:: 
Mediator::  (
.::( )
Send::) -
(::- .
new::. 1'
DeleteConsultantByIdCommand::2 M
(::M N
id::N P
)::P Q
)::Q R
;::R S
if;; 
(;; 
deleted;; 
);; 
return<< 
	NoContent<<  
(<<  !
)<<! "
;<<" #
return== 
NotFound== 
(== 
)== 
;== 
}>> 	
[@@ 	
AllowAnonymous@@	 
]@@ 
[AA 	
HttpPostAA	 
(AA 
$strAA 
)AA 
]AA 
[BB 	 
ProducesResponseTypeBB	 
(BB 
StatusCodesBB )
.BB) *
Status200OKBB* 5
)BB5 6
]BB6 7
[CC 	 
ProducesResponseTypeCC	 
(CC 
StatusCodesCC )
.CC) *
Status400BadRequestCC* =
)CC= >
]CC> ?
publicDD 
asyncDD 
TaskDD 
<DD 
IActionResultDD '
>DD' (
RegisterDD) 1
(DD1 2
[DD2 3
FromBodyDD3 ;
]DD; <%
RegisterConsultantCommandDD= V
commandDDW ^
)DD^ _
{EE 	
varFF 

consultantFF 
=FF 
awaitFF "
MediatorFF# +
.FF+ ,
SendFF, 0
(FF0 1
commandFF1 8
)FF8 9
;FF9 :
returnGG 
OkGG 
(GG 
newGG 
{HH 

consultantII 
.II 
IdII 
,II 

consultantJJ 
.JJ 
UsernameJJ #
,JJ# $

consultantKK 
.KK 
EmailKK  
,KK  !

consultantLL 
.LL 
SkillLL  
,LL  !

consultantMM 
.MM 
NumberOfTicketsMM *
,MM* +

consultantNN 
.NN 
LocationNN #
,NN# $

consultantOO 
.OO 
AvailabilityOO '
}PP 
)PP 
;PP 
}QQ 	
[SS 	
HttpPutSS	 
]SS 
[TT 	
AllowAnonymousTT	 
]TT 
[UU 	 
ProducesResponseTypeUU	 
(UU 
StatusCodesUU )
.UU) *
Status204NoContentUU* <
)UU< =
]UU= >
[VV 	 
ProducesResponseTypeVV	 
(VV 
StatusCodesVV )
.VV) *
Status404NotFoundVV* ;
)VV; <
]VV< =
publicWW 
asyncWW 
TaskWW 
<WW 
IActionResultWW '
>WW' (
UpdateWW) /
(WW/ 0'
UpdateConsultantByIdCommandWW0 K
commandWWL S
)WWS T
{XX 	
awaitYY 
MediatorYY 
.YY 
SendYY 
(YY  
commandYY  '
)YY' (
;YY( )
returnZZ 
	NoContentZZ 
(ZZ 
)ZZ 
;ZZ 
}[[ 	
}\\ 
}]] ó/
KC:\Fac\SysopSquadAccounts\Accounts\WebApi\Controllers\v1\UsersController.cs
	namespace 	
WebApi
 
. 
Controllers 
. 
v1 
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class 
UsersController  
:  !
BaseApiController! 2
{ 
public 
UsersController 
( 
	IMediator (
mediator) 1
)1 2
:3 4
base5 9
(9 :
mediator: B
)B C
{ 	
} 	
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
)5 6
]6 7
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
return 
Ok 
( 
await 
Mediator $
.$ %
Send% )
() *
new* -
GetAllUsersQuery. >
(> ?
)? @
)@ A
)A B
;B C
} 	
[ 	
HttpGet	 
( 
$str "
)" #
]# $
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
)5 6
]6 7
[ 	
AllowAnonymous	 
] 
public   
async   
Task   
<   
IActionResult   '
>  ' (
GetById  ) 0
(  0 1
string  1 7
id  8 :
)  : ;
{!! 	
try"" 
{## 
return$$ 
Ok$$ 
($$ 
await$$ 
Mediator$$  (
.$$( )
Send$$) -
($$- .
new$$. 1
GetUserByIdQuery$$2 B
($$B C
id$$C E
)$$E F
)$$F G
)$$G H
;$$H I
}%% 
catch&& 
(&& 
	Exception&& 
ex&& 
)&&  
{'' 
return(( 

BadRequest(( !
(((! "
new((" %
{((& '
error((( -
=((. /
ex((0 2
.((2 3
Message((3 :
}((; <
)((< =
;((= >
})) 
}** 	
[,, 	

HttpDelete,,	 
(,, 
$str,, %
),,% &
],,& '
[-- 	 
ProducesResponseType--	 
(-- 
StatusCodes-- )
.--) *
Status204NoContent--* <
)--< =
]--= >
[.. 	 
ProducesResponseType..	 
(.. 
StatusCodes.. )
...) *
Status404NotFound..* ;
)..; <
]..< =
public// 
async// 
Task// 
<// 
IActionResult// '
>//' (
Delete//) /
(/// 0
string//0 6
id//7 9
)//9 :
{00 	
var11 
deleted11 
=11 
await11 
Mediator11  (
.11( )
Send11) -
(11- .
new11. 1!
DeleteUserByIdCommand112 G
(11G H
id11H J
)11J K
)11K L
;11L M
if22 
(22 
deleted22 
)22 
return33 
	NoContent33  
(33  !
)33! "
;33" #
return44 
NotFound44 
(44 
)44 
;44 
}55 	
[77 	
AllowAnonymous77	 
]77 
[88 	
HttpPost88	 
(88 
$str88 
)88 
]88 
[99 	 
ProducesResponseType99	 
(99 
StatusCodes99 )
.99) *
Status200OK99* 5
)995 6
]996 7
[:: 	 
ProducesResponseType::	 
(:: 
StatusCodes:: )
.::) *
Status400BadRequest::* =
)::= >
]::> ?
public;; 
async;; 
Task;; 
<;; 
IActionResult;; '
>;;' (
Register;;) 1
(;;1 2
[;;2 3
FromBody;;3 ;
];;; <
RegisterUserCommand;;= P
command;;Q X
);;X Y
{<< 	
var== 
user== 
=== 
await== 
Mediator== %
.==% &
Send==& *
(==* +
command==+ 2
)==2 3
;==3 4
return>> 
Ok>> 
(>> 
new>> 
{?? 
user@@ 
.@@ 
Id@@ 
,@@ 
userAA 
.AA 
UsernameAA 
,AA 
userBB 
.BB 
EmailBB 
,BB 
userCC 
.CC 
TypeCC 
,CC 
userDD 
.DD 
LocationDD 
}EE 
)EE 
;EE 
}FF 	
[HH 	
HttpPutHH	 
]HH 
[II 	 
ProducesResponseTypeII	 
(II 
StatusCodesII )
.II) *
Status204NoContentII* <
)II< =
]II= >
[JJ 	 
ProducesResponseTypeJJ	 
(JJ 
StatusCodesJJ )
.JJ) *
Status404NotFoundJJ* ;
)JJ; <
]JJ< =
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (
UpdateKK) /
(KK/ 0!
UpdateUserByIdCommandKK0 E
commandKKF M
)KKM N
{LL 	
awaitMM 
MediatorMM 
.MM 
SendMM 
(MM  
commandMM  '
)MM' (
;MM( )
returnNN 
	NoContentNN 
(NN 
)NN 
;NN 
}OO 	
}QQ 
}RR ú

4C:\Fac\SysopSquadAccounts\Accounts\WebApi\Program.cs
	namespace 	
WebApi
 
{ 
public 

static 
class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} Ö5
4C:\Fac\SysopSquadAccounts\Accounts\WebApi\Startup.cs
	namespace 	
WebApi
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddApiVersioning %
(% &
config& ,
=>- /
{ 
config 
. 
DefaultApiVersion (
=) *
new+ .

ApiVersion/ 9
(9 :
$num: ;
,; <
$num= >
)> ?
;? @
config 
. /
#AssumeDefaultVersionWhenUnspecified :
=; <
true= A
;A B
config 
. 
ReportApiVersions (
=) *
true+ /
;/ 0
} 
) 
; 
services!! 
.!! 
AddCors!! 
(!! 
(!! 
options!! %
)!!% &
=>!!' )
{"" 
options## 
.## 
	AddPolicy## !
(##! "
$str##" ,
,##, -
builder##. 5
=>##6 8
builder##9 @
.##@ A
AllowAnyOrigin##A O
(##O P
)##P Q
.##Q R
AllowAnyMethod##R `
(##` a
)##a b
.##b c
AllowAnyHeader##c q
(##q r
)##r s
)##s t
;##t u
}$$ 
)$$ 
;$$ 
services&& 
.&& 
AddMvc&& 
(&& 
option&& "
=>&&# %
option&&& ,
.&&, -!
EnableEndpointRouting&&- B
=&&C D
false&&E J
)&&J K
;&&K L
services)) 
.)) 
AddApplication)) #
())# $
)))$ %
;))% &
services** 
.** 
AddPersistence** #
(**# $
Configuration**$ 1
)**1 2
;**2 3
services,, 
.,, 
AddControllers,, #
(,,# $
),,$ %
.-- 
AddFluentValidation-- (
(--( )
s--) *
=>--+ -
{.. 
s// 
.// 4
(RegisterValidatorsFromAssemblyContaining// B
<//B C
Startup//C J
>//J K
(//K L
)//L M
;//M N
s00 
.00 @
4RunDefaultMvcValidationAfterFluentValidationExecutes00 N
=00O P
false00Q V
;00V W
}11 
)11 
;11 
services33 
.33 
AddSwaggerGen33 "
(33" #
c33# $
=>33% '
{44 
c55 
.55 

SwaggerDoc55 
(55 
$str55 !
,55! "
new55# &
OpenApiInfo55' 2
{553 4
Title555 :
=55; <
$str55= E
,55E F
Version55G N
=55O P
$str55Q U
}55V W
)55W X
;55X Y
c77 
.77 !
AddSecurityDefinition77 '
(77' (
$str77( 0
,770 1
new772 5!
OpenApiSecurityScheme776 K
{88 
Type99 
=99 
SecuritySchemeType99 -
.99- .
Http99. 2
,992 3
BearerFormat::  
=::! "
$str::# (
,::( )
In;; 
=;; 
ParameterLocation;; *
.;;* +
Header;;+ 1
,;;1 2
Scheme<< 
=<< 
$str<< %
,<<% &
Description== 
===  !
$str==" F
}>> 
)>> 
;>> 
c@@ 
.@@ "
AddSecurityRequirement@@ (
(@@( )
new@@) ,&
OpenApiSecurityRequirement@@- G
{AA 
{BB 
newCC !
OpenApiSecuritySchemeCC 1
{DD 
	ReferenceEE %
=EE& '
newEE( +
OpenApiReferenceEE, <
{FF 
TypeGG  $
=GG% &
ReferenceTypeGG' 4
.GG4 5
SecuritySchemeGG5 C
,GGC D
IdHH  "
=HH# $
$strHH% -
}II 
}JJ 
,JJ 
ArrayKK 
.KK 
EmptyKK #
<KK# $
stringKK$ *
>KK* +
(KK+ ,
)KK, -
}LL 
}MM 
)MM 
;MM 
}NN 
)NN 
;NN 
}OO 	
publicQQ 
voidQQ 
	ConfigureQQ 
(QQ 
IApplicationBuilderQQ 1
appQQ2 5
,QQ5 6
IWebHostEnvironmentQQ7 J
envQQK N
)QQN O
{RR 	
ifSS 
(SS 
envSS 
.SS 
IsDevelopmentSS !
(SS! "
)SS" #
)SS# $
{TT 
appUU 
.UU %
UseDeveloperExceptionPageUU -
(UU- .
)UU. /
;UU/ 0
appVV 
.VV 

UseSwaggerVV 
(VV 
)VV  
;VV  !
appWW 
.WW 
UseSwaggerUIWW  
(WW  !
cWW! "
=>WW# %
cWW& '
.WW' (
SwaggerEndpointWW( 7
(WW7 8
$strWW8 R
,WWR S
$strWWT _
)WW_ `
)WW` a
;WWa b
}XX 
appZZ 
.ZZ 
UseHttpsRedirectionZZ #
(ZZ# $
)ZZ$ %
;ZZ% &
app\\ 
.\\ 

UseRouting\\ 
(\\ 
)\\ 
;\\ 
app]] 
.]] 
UseCors]] 
(]] 
$str]] "
)]]" #
;]]# $
app__ 
.__ 
UseAuthentication__ !
(__! "
)__" #
;__# $
app`` 
.`` 
UseAuthorization``  
(``  !
)``! "
;``" #
appbb 
.bb 
UseEndpointsbb 
(bb 
	endpointsbb &
=>bb' )
{cc 
	endpointsdd 
.dd 
MapControllersdd (
(dd( )
)dd) *
;dd* +
}ee 
)ee 
;ee 
appff 
.ff 
UseMvcff 
(ff 
)ff 
;ff 
}gg 	
}hh 
}ii Ã
_C:\Fac\SysopSquadAccounts\Accounts\WebApi\Validators\AccountValidators\LoginCommandValidator.cs
	namespace 	
WebApi
 
. 

Validators 
. 
AccountValidators -
{ 
public		 

class		 !
LoginCommandValidator		 &
:		& '
AbstractValidator		( 9
<		9 :
LoginCommand		: F
>		F G
{

 
private 
readonly 
IAccountRepository +
_repository, 7
;7 8
public !
LoginCommandValidator $
($ %
IAccountRepository% 7

repository8 B
)B C
{ 	
_repository 
= 

repository $
;$ %
RuleFor 
( 
account 
=> 
account &
.& '
Password' /
)/ 0
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyPassword9 F
)F G
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
ShortPassword? L
)L M
. 
Must 
( 
p 
=> 
p 
. 
Any  
(  !
char! %
.% &
IsDigit& -
)- .
). /
./ 0
WithMessage0 ;
(; <
ValidationErrors< L
.L M
NoDigitPasswordM \
)\ ]
;] ^
RuleFor 
( 
account 
=> 
account &
.& '
Email' ,
), -
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9

EmptyEmail9 C
)C D
. 
EmailAddress 
( 
) 
.  
WithMessage  +
(+ ,
ValidationErrors, <
.< =
InvalidEmail= I
)I J
. 
	MustAsync 
( 
async  
(! "
email" '
,' (
cancellation) 5
)5 6
=>7 9
{ 
var 
user 
= 
await $
_repository% 0
.0 1
GetByEmailAsync1 @
<@ A
UserA E
>E F
(F G
emailG L
)L M
;M N
var 

consultant "
=# $
await% *
_repository+ 6
.6 7
GetByEmailAsync7 F
<F G

ConsultantG Q
>Q R
(R S
emailS X
)X Y
;Y Z
return 
user 
!=  "
null# '
||( *

consultant+ 5
!=6 8
null9 =
;= >
}   
)   
.   
WithMessage   
(   
ValidationErrors   /
.  / 0 
InexistentLoginEmail  0 D
)  D E
;  E F
}!! 	
}"" 
}## ◊%
oC:\Fac\SysopSquadAccounts\Accounts\WebApi\Validators\ConsultantValidators\RegisterConsultantCommandValidator.cs
	namespace 	
WebApi
 
. 

Validators 
.  
ConsultantValidators 0
{ 
public 

class .
"RegisterConsultantCommandValidator 3
:4 5
AbstractValidator6 G
<G H%
RegisterConsultantCommandH a
>a b
{		 
private

 
readonly

 !
IConsultantRepository

 .
_repository

/ :
;

: ;
public .
"RegisterConsultantCommandValidator 1
(1 2!
IConsultantRepository2 G

repositoryH R
)R S
{ 	
_repository 
= 

repository $
;$ %
RuleFor 
( 

consultant 
=> !

consultant" ,
., -
Username- 5
)5 6
. 
Cascade 
( 
CascadeMode #
.# $
Stop$ (
)( )
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
ValidationErrors' 7
.7 8
EmptyUsername8 E
)E F
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage )
() *
ValidationErrors* :
.: ;
ShortUsername; H
)H I
;I J
RuleFor 
( 

consultant 
=> !

consultant" ,
., -
Password- 5
)5 6
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyPassword9 F
)F G
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
ShortPassword? L
)L M
. 
Must 
( 
p 
=> 
p 
. 
Any  
(  !
char! %
.% &
IsDigit& -
)- .
). /
./ 0
WithMessage0 ;
(; <
ValidationErrors< L
.L M
NoDigitPasswordM \
)\ ]
;] ^
RuleFor 
( 

consultant 
=> !

consultant" ,
., -
Location- 5
)5 6
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyLocation9 F
)F G
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
ShortLocation? L
)L M
;M N
RuleFor   
(   

consultant   
=>   !

consultant  " ,
.  , -
Email  - 2
)  2 3
.!! 
Cascade!! 
(!! 
CascadeMode!! $
.!!$ %
Stop!!% )
)!!) *
."" 
NotEmpty"" 
("" 
)"" 
."" 
WithMessage"" '
(""' (
ValidationErrors""( 8
.""8 9

EmptyEmail""9 C
)""C D
.## 
EmailAddress## 
(## 
)## 
.##  
WithMessage##  +
(##+ ,
ValidationErrors##, <
.##< =
InvalidEmail##= I
)##I J
.$$ 
	MustAsync$$ 
($$ 
async$$  
($$! "
email$$" '
,$$' (
cancellation$$) 5
)$$5 6
=>$$7 9
{%% 
bool&& 
exists&& 
=&&  !
await&&" '
_repository&&( 3
.&&3 4
CheckUniqueEmail&&4 D
(&&D E
email&&E J
)&&J K
;&&K L
return'' 
!'' 
exists'' "
;''" #
}(( 
)(( 
.(( 
WithMessage(( 
((( 
ValidationErrors(( /
.((/ 0
NotUniqueEmail((0 >
)((> ?
;((? @
})) 	
}** 
}++ ¬O
qC:\Fac\SysopSquadAccounts\Accounts\WebApi\Validators\ConsultantValidators\UpdateConsultantByIdCommandValidator.cs
	namespace 	
WebApi
 
. 

Validators 
.  
ConsultantValidators 0
{ 
public 

class 0
$UpdateConsultantByIdCommandValidator 5
:6 7
AbstractValidator8 I
<I J'
UpdateConsultantByIdCommandJ e
>e f
{		 
private

 
readonly

 !
IConsultantRepository

 .
_repository

/ :
;

: ;
private 
enum 
ConsultantSkills %
{ 	
Software 
, 
Hardware 
, 
Hr  "
} 	
;	 

private 
enum "
ConsultantAvailability +
{ 	
	Available 
, 
Away 
} 	
;	 

public 0
$UpdateConsultantByIdCommandValidator 3
(3 4!
IConsultantRepository4 I

repositoryJ T
)T U
{ 	
_repository 
= 

repository $
;$ %
const 
string 
idRegex  
=! "
$str# 3
;3 4
RuleFor 
( 

consultant 
=> !

consultant" ,
., -
Id- /
)/ 0
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyId9 @
)@ A
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
. 
	MustAsync 
( 
async  
(! "
id" $
,$ %
cancellation& 2
)2 3
=>4 6
{ 
var 

consultant "
=# $
await% *
_repository+ 6
.6 7
GetByIdAsync7 C
(C D
idD F
)F G
;G H
return   

consultant   %
!=  & (
null  ) -
;  - .
}!! 
)!! 
.!! 
WithMessage!! 
(!! 
ValidationErrors!! /
.!!/ 0
InexistentId!!0 <
)!!< =
;!!= >
When## 
(## 

consultant## 
=>## 
!##  
string##  &
.##& '
IsNullOrEmpty##' 4
(##4 5

consultant##5 ?
.##? @
Username##@ H
)##H I
,##I J
(##K L
)##L M
=>##N P
{$$ 
RuleFor%% 
(%% 

consultant%% "
=>%%# %

consultant%%& 0
.%%0 1
Username%%1 9
)%%9 :
.&& 
Length&& 
(&& 
$num&& 
,&& 
$num&& !
)&&! "
.&&" #
WithMessage&&# .
(&&. /
ValidationErrors&&/ ?
.&&? @
ShortUsername&&@ M
)&&M N
;&&N O
}'' 
)'' 
;'' 
When)) 
()) 

consultant)) 
=>)) 
!))  
string))  &
.))& '
IsNullOrEmpty))' 4
())4 5

consultant))5 ?
.))? @
Email))@ E
)))E F
,))F G
())H I
)))I J
=>))K M
{** 
RuleFor++ 
(++ 

consultant++ "
=>++# %

consultant++& 0
.++0 1
Email++1 6
)++6 7
.,, 
Cascade,, 
(,, 
CascadeMode,, (
.,,( )
Stop,,) -
),,- .
.-- 
EmailAddress-- !
(--! "
)--" #
.--# $
WithMessage--$ /
(--/ 0
ValidationErrors--0 @
.--@ A
InvalidEmail--A M
)--M N
... 
	MustAsync.. 
(.. 
async.. $
(..% &
email..& +
,..+ ,
cancellation..- 9
)..9 :
=>..; =
{// 
var00 
exists00 "
=00# $
await00% *
_repository00+ 6
.006 7
CheckUniqueEmail007 G
(00G H
email00H M
)00M N
;00N O
return11 
!11  
exists11  &
;11& '
}22 
)22 
.22 
WithMessage22 "
(22" #
ValidationErrors22# 3
.223 4
NotUniqueEmail224 B
)22B C
;22C D
}33 
)33 
;33 
When55 
(55 

consultant55 
=>55 
!55  
string55  &
.55& '
IsNullOrEmpty55' 4
(554 5

consultant555 ?
.55? @
Password55@ H
)55H I
,55I J
(55K L
)55L M
=>55N P
{66 
RuleFor77 
(77 

consultant77 "
=>77# %

consultant77& 0
.770 1
Password771 9
)779 :
.88 
Cascade88 
(88 
CascadeMode88 (
.88( )
Stop88) -
)88- .
.99 
MinimumLength99 "
(99" #
$num99# $
)99$ %
.99% &
WithMessage99& 1
(991 2
ValidationErrors992 B
.99B C
ShortPassword99C P
)99P Q
.:: 
Must:: 
(:: 
p:: 
=>:: 
p::  
.::  !
Any::! $
(::$ %
char::% )
.::) *
IsDigit::* 1
)::1 2
)::2 3
.::3 4
WithMessage::4 ?
(::? @
ValidationErrors::@ P
.::P Q
NoDigitPassword::Q `
)::` a
;::a b
};; 
);; 
;;; 
When== 
(== 

consultant== 
=>== 
!==  
string==  &
.==& '
IsNullOrEmpty==' 4
(==4 5

consultant==5 ?
.==? @
Location==@ H
)==H I
,==I J
(==K L
)==L M
=>==N P
{>> 
RuleFor?? 
(?? 

consultant?? "
=>??# %

consultant??& 0
.??0 1
Location??1 9
)??9 :
.@@ 
Cascade@@ 
(@@ 
CascadeMode@@ (
.@@( )
Stop@@) -
)@@- .
.AA 
MinimumLengthAA "
(AA" #
$numAA# $
)AA$ %
.AA% &
WithMessageAA& 1
(AA1 2
ValidationErrorsAA2 B
.AAB C
ShortLocationAAC P
)AAP Q
;AAQ R
}BB 
)BB 
;BB 
WhenDD 
(DD 

consultantDD 
=>DD 
!DD  
stringDD  &
.DD& '
IsNullOrEmptyDD' 4
(DD4 5

consultantDD5 ?
.DD? @
SkillDD@ E
)DDE F
,DDF G
(DDH I
)DDI J
=>DDK M
{EE 
RuleForFF 
(FF 

consultantFF "
=>FF# %

consultantFF& 0
.FF0 1
SkillFF1 6
)FF6 7
.GG 
CascadeGG 
(GG 
CascadeModeGG (
.GG( )
StopGG) -
)GG- .
.HH 

IsEnumNameHH 
(HH  
typeofHH  &
(HH& '
ConsultantSkillsHH' 7
)HH7 8
,HH8 9
caseSensitiveHH: G
:HHG H
falseHHI N
)HHN O
.HHO P
WithMessageHHP [
(HH[ \
ValidationErrorsHH\ l
.HHl m
InvalidSkillHHm y
)HHy z
;HHz {
}II 
)II 
;II 
WhenKK 
(KK 

consultantKK 
=>KK 
!KK  
stringKK  &
.KK& '
IsNullOrEmptyKK' 4
(KK4 5

consultantKK5 ?
.KK? @
AvailabilityKK@ L
)KKL M
,KKM N
(KKO P
)KKP Q
=>KKR T
{LL 
RuleForMM 
(MM 

consultantMM "
=>MM# %

consultantMM& 0
.MM0 1
AvailabilityMM1 =
)MM= >
.NN 
CascadeNN 
(NN 
CascadeModeNN (
.NN( )
StopNN) -
)NN- .
.OO 

IsEnumNameOO 
(OO  
typeofOO  &
(OO& '"
ConsultantAvailabilityOO' =
)OO= >
,OO> ?
caseSensitiveOO@ M
:OOM N
falseOOO T
)OOT U
.OOU V
WithMessageOOV a
(OOa b
ValidationErrorsOOb r
.OOr s 
InvalidAvailability	OOs Ü
)
OOÜ á
;
OOá à
}PP 
)PP 
;PP 
WhenRR 
(RR 

consultantRR 
=>RR 

consultantRR )
.RR) *
NumberOfTicketsRR* 9
!=RR: <
$numRR= >
,RR> ?
(RR@ A
)RRA B
=>RRC E
{SS 
RuleForTT 
(TT 

consultantTT "
=>TT# %

consultantTT& 0
.TT0 1
NumberOfTicketsTT1 @
)TT@ A
.UU 
GreaterThanUU  
(UU  !
$numUU! "
)UU" #
.UU# $
WithMessageUU$ /
(UU/ 0
ValidationErrorsUU0 @
.UU@ A"
InvalidNumberOfTicketsUUA W
)UUW X
;UUX Y
}VV 
)VV 
;VV 
}WW 	
}XX 
}YY ä-
cC:\Fac\SysopSquadAccounts\Accounts\WebApi\Validators\UserValidators\RegisterUserCommandValidator.cs
	namespace 	
WebApi
 
. 

Validators 
. 
UserValidators *
{ 
public 

class (
RegisterUserCommandValidator -
:. /
AbstractValidator0 A
<A B
RegisterUserCommandB U
>U V
{		 
private

 
readonly

 
IUserRepository

 (
_repository

) 4
;

4 5
private 
enum 
UserType 
{ 	
Client 
, 
Employee 
, 

CallCenter (
} 	
;	 

public (
RegisterUserCommandValidator +
(+ ,
IUserRepository, ;

repository< F
)F G
{ 	
_repository 
= 

repository $
;$ %
RuleFor 
( 
user 
=> 
user  
.  !
Username! )
)) *
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyUsername9 F
)F G
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
ValidationErrors+ ;
.; <
ShortUsername< I
)I J
;J K
RuleFor 
( 
user 
=> 
user  
.  !
Password! )
)) *
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyPassword9 F
)F G
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
ShortPassword? L
)L M
. 
Must 
( 
p 
=> 
p 
. 
Any  
(  !
char! %
.% &
IsDigit& -
)- .
). /
./ 0
WithMessage0 ;
(; <
ValidationErrors< L
.L M
NoDigitPasswordM \
)\ ]
;] ^
RuleFor 
( 
user 
=> 
user  
.  !
Location! )
)) *
.   
Cascade   
(   
CascadeMode   $
.  $ %
Stop  % )
)  ) *
.!! 
NotEmpty!! 
(!! 
)!! 
.!! 
WithMessage!! '
(!!' (
ValidationErrors!!( 8
.!!8 9
EmptyLocation!!9 F
)!!F G
."" 
MinimumLength"" 
("" 
$num""  
)""  !
.""! "
WithMessage""" -
(""- .
ValidationErrors"". >
.""> ?
ShortLocation""? L
)""L M
;""M N
RuleFor$$ 
($$ 
user$$ 
=>$$ 
user$$  
.$$  !
Email$$! &
)$$& '
.%% 
Cascade%% 
(%% 
CascadeMode%% $
.%%$ %
Stop%%% )
)%%) *
.&& 
NotEmpty&& 
(&& 
)&& 
.&& 
WithMessage&& '
(&&' (
ValidationErrors&&( 8
.&&8 9

EmptyEmail&&9 C
)&&C D
.'' 
EmailAddress'' 
('' 
)'' 
.''  
WithMessage''  +
(''+ ,
ValidationErrors'', <
.''< =
InvalidEmail''= I
)''I J
.(( 
	MustAsync(( 
((( 
async((  
(((! "
email((" '
,((' (
cancellation(() 5
)((5 6
=>((7 9
{)) 
bool** 
exists** 
=**  !
await**" '
_repository**( 3
.**3 4
CheckUniqueEmail**4 D
(**D E
email**E J
)**J K
;**K L
return++ 
!++ 
exists++ "
;++" #
},, 
),, 
.,, 
WithMessage,, 
(,, 
ValidationErrors,, /
.,,/ 0
NotUniqueEmail,,0 >
),,> ?
;,,? @
RuleFor.. 
(.. 
user.. 
=>.. 
user..  
...  !
Type..! %
)..% &
.// 
Cascade// 
(// 
CascadeMode// $
.//$ %
Stop//% )
)//) *
.00 
NotEmpty00 
(00 
)00 
.00 
WithMessage00 '
(00' (
ValidationErrors00( 8
.008 9
	EmptyType009 B
)00B C
.11 

IsEnumName11 
(11 
typeof11 "
(11" #
UserType11# +
)11+ ,
,11, -
caseSensitive11. ;
:11; <
false11= B
)11B C
.11C D
WithMessage11D O
(11O P
ValidationErrors11P `
.11` a
InvalidUserType11a p
)11p q
;11q r
}22 	
}33 
}44 ª?
eC:\Fac\SysopSquadAccounts\Accounts\WebApi\Validators\UserValidators\UpdateUserByIdCommandValidator.cs
	namespace 	
WebApi
 
. 

Validators 
. 
UserValidators *
{ 
public 

class *
UpdateUserByIdCommandValidator /
:0 1
AbstractValidator2 C
<C D!
UpdateUserByIdCommandD Y
>Y Z
{		 
private

 
readonly

 
IUserRepository

 (
_repository

) 4
;

4 5
public *
UpdateUserByIdCommandValidator -
(- .
IUserRepository. =

repository> H
)H I
{ 	
_repository 
= 

repository $
;$ %
const 
string 
idRegex  
=! "
$str# 3
;3 4
RuleFor 
( 
user 
=> 
user  
.  !
Id! #
)# $
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyId9 @
)@ A
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
. 
	MustAsync 
( 
async  
(! "
id" $
,$ %
cancellation& 2
)2 3
=>4 6
{ 
var 
user 
= 
await $
_repository% 0
.0 1
GetByIdAsync1 =
(= >
id> @
)@ A
;A B
return 
user 
!=  "
null# '
;' (
} 
) 
. 
WithMessage 
( 
ValidationErrors /
./ 0
InexistentId0 <
)< =
;= >
When 
( 
user 
=> 
! 
string  
.  !
IsNullOrEmpty! .
(. /
user/ 3
.3 4
Username4 <
)< =
,= >
(? @
)@ A
=>B D
{ 
RuleFor 
( 
user 
=> 
user  $
.$ %
Username% -
)- .
. 
Length 
( 
$num 
, 
$num !
)! "
." #
WithMessage# .
(. /
ValidationErrors/ ?
.? @
ShortUsername@ M
)M N
;N O
} 
) 
; 
When!! 
(!! 
user!! 
=>!! 
!!! 
string!!  
.!!  !
IsNullOrEmpty!!! .
(!!. /
user!!/ 3
.!!3 4
Email!!4 9
)!!9 :
,!!: ;
(!!< =
)!!= >
=>!!? A
{"" 
RuleFor## 
(## 
user## 
=>## 
user##  $
.##$ %
Email##% *
)##* +
.$$ 
Cascade$$ 
($$ 
CascadeMode$$ (
.$$( )
Stop$$) -
)$$- .
.%% 
EmailAddress%% !
(%%! "
)%%" #
.%%# $
WithMessage%%$ /
(%%/ 0
ValidationErrors%%0 @
.%%@ A
InvalidEmail%%A M
)%%M N
.&& 
	MustAsync&& 
(&& 
async&& $
(&&% &
email&&& +
,&&+ ,
cancellation&&- 9
)&&9 :
=>&&; =
{'' 
var(( 
exists(( "
=((# $
await((% *
_repository((+ 6
.((6 7
CheckUniqueEmail((7 G
(((G H
email((H M
)((M N
;((N O
return)) 
!))  
exists))  &
;))& '
}** 
)** 
.** 
WithMessage** "
(**" #
ValidationErrors**# 3
.**3 4
NotUniqueEmail**4 B
)**B C
;**C D
}++ 
)++ 
;++ 
When-- 
(-- 
user-- 
=>-- 
!-- 
string--  
.--  !
IsNullOrEmpty--! .
(--. /
user--/ 3
.--3 4
Password--4 <
)--< =
,--= >
(--? @
)--@ A
=>--B D
{.. 
RuleFor// 
(// 
user// 
=>// 
user//  $
.//$ %
Password//% -
)//- .
.00 
Cascade00 
(00 
CascadeMode00 (
.00( )
Stop00) -
)00- .
.11 
MinimumLength11 "
(11" #
$num11# $
)11$ %
.11% &
WithMessage11& 1
(111 2
ValidationErrors112 B
.11B C
ShortPassword11C P
)11P Q
.22 
Must22 
(22 
p22 
=>22 
p22  
.22  !
Any22! $
(22$ %
char22% )
.22) *
IsDigit22* 1
)221 2
)222 3
.223 4
WithMessage224 ?
(22? @
ValidationErrors22@ P
.22P Q
NoDigitPassword22Q `
)22` a
;22a b
}33 
)33 
;33 
When55 
(55 
user55 
=>55 
!55 
string55  
.55  !
IsNullOrEmpty55! .
(55. /
user55/ 3
.553 4
Location554 <
)55< =
,55= >
(55? @
)55@ A
=>55B D
{66 
RuleFor77 
(77 
user77 
=>77 
user77  $
.77$ %
Location77% -
)77- .
.88 
Cascade88 
(88 
CascadeMode88 (
.88( )
Stop88) -
)88- .
.99 
MinimumLength99 "
(99" #
$num99# $
)99$ %
.99% &
WithMessage99& 1
(991 2
ValidationErrors992 B
.99B C
ShortLocation99C P
)99P Q
;99Q R
}:: 
):: 
;:: 
When<< 
(<< 
user<< 
=><< 
user<< 
.<< 
	TicketsId<< '
.<<' (
Count<<( -
!=<<. 0
$num<<1 2
,<<2 3
(<<4 5
)<<5 6
=><<7 9
{== 
RuleForEach>> 
(>> 
user>>  
=>>>! #
user>>$ (
.>>( )
	TicketsId>>) 2
)>>2 3
.?? 
Cascade?? 
(?? 
CascadeMode?? (
.??( )
Stop??) -
)??- .
.@@ 
NotEmpty@@ 
(@@ 
)@@ 
.@@  
WithMessage@@  +
(@@+ ,
ValidationErrors@@, <
.@@< =
EmptyId@@= D
)@@D E
.AA 
LengthAA 
(AA 
$numAA 
)AA 
.AA  
WithMessageAA  +
(AA+ ,
ValidationErrorsAA, <
.AA< =
InvalidIdLengthAA= L
)AAL M
.BB 
MatchesBB 
(BB 
idRegexBB $
)BB$ %
.BB% &
WithMessageBB& 1
(BB1 2
ValidationErrorsBB2 B
.BBB C
InvalidIdStructureBBC U
)BBU V
;BBV W
}CC 
)CC 
;CC 
}EE 	
}FF 
}GG 