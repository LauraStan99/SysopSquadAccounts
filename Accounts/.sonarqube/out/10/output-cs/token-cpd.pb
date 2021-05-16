ñ!
XC:\Fac\SysopSquadAccounts\Accounts\Tests.Helpers\AccountFactories\LoginCommandFactory.cs
	namespace 	
Tests
 
. 
Helpers 
. 
AccountFactories (
{ 
public 

static 
class 
LoginCommandFactory +
{ 
public		 
static		 
LoginCommand		 "!
ValidLoginUserCommand		# 8
(		8 9
)		9 :
{

 	
var 
user 
= 
UserFactory "
." #
	ValidUser# ,
(, -
)- .
;. /
return 
new 
( 
) 
{ 
Email 
= 
user 
. 
Email "
," #
Password 
= 
$str !
} 
; 
} 	
public 
static 
LoginCommand "'
ValidLoginConsultantCommand# >
(> ?
)? @
{ 	
var 

consultant 
= 
ConsultantFactory .
.. /
ValidConsultant/ >
(> ?
)? @
;@ A
return 
new 
( 
) 
{ 
Email 
= 

consultant "
." #
Email# (
,( )
Password 
= 
$str !
} 
; 
} 	
public 
static 
LoginCommand "+
LoginCommandWithInexistingEmail# B
(B C
)C D
=>E G
newH K
(K L
)L M
{ 	
Email 
= 
$str )
,) *
Password   
=   
$str   
}!! 	
;!!	 

public## 
static## 
LoginCommand## "&
LoginCommandWithEmptyEmail### =
(##= >
)##> ?
{$$ 	
var%% 
command%% 
=%% !
ValidLoginUserCommand%% /
(%%/ 0
)%%0 1
;%%1 2
command&& 
.&& 
Email&& 
=&& 
$str&& 
;&& 
return'' 
command'' 
;'' 
}(( 	
public** 
static** 
LoginCommand** ")
LoginCommandWithEmptyPassword**# @
(**@ A
)**A B
{++ 	
var,, 
command,, 
=,, !
ValidLoginUserCommand,, /
(,,/ 0
),,0 1
;,,1 2
command-- 
.-- 
Password-- 
=-- 
$str-- !
;--! "
return.. 
command.. 
;.. 
}// 	
public11 
static11 
LoginCommand11 ")
LoginCommandWithShortPassword11# @
(11@ A
)11A B
{22 	
var33 
command33 
=33 !
ValidLoginUserCommand33 /
(33/ 0
)330 1
;331 2
command44 
.44 
Password44 
=44 
$str44 $
;44$ %
return55 
command55 
;55 
}66 	
public88 
static88 
LoginCommand88 "+
LoginCommandWithNoDigitPassword88# B
(88B C
)88C D
{99 	
var:: 
command:: 
=:: !
ValidLoginUserCommand:: /
(::/ 0
)::0 1
;::1 2
command;; 
.;; 
Password;; 
=;; 
$str;; &
;;;& '
return<< 
command<< 
;<< 
}== 	
public?? 
static?? 
LoginCommand?? "(
LoginCommandWithInvalidEmail??# ?
(??? @
)??@ A
{@@ 	
varAA 
commandAA 
=AA !
ValidLoginUserCommandAA /
(AA/ 0
)AA0 1
;AA1 2
commandBB 
.BB 
EmailBB 
=BB 
$strBB %
;BB% &
returnCC 
commandCC 
;CC 
}DD 	
}EE 
}FF ÉV
YC:\Fac\SysopSquadAccounts\Accounts\Tests.Helpers\ConsultantFactories\ConsultantFactory.cs
	namespace 	
Tests
 
. 
Helpers 
. 
ConsultantFactories +
{ 
public 

static 
class 
ConsultantFactory )
{ 
public		 
static		 

Consultant		  
ValidConsultant		! 0
(		0 1
)		1 2
{

 	
return 
new 

Consultant !
{ 
Username 
= 
$str !
,! "
Location 
= 
$str !
,! "
Email 
= 
$str (
,( )
Skill 
= 
$str "
," #
NumberOfTickets 
=  !
$num" $
,$ %
Availability 
= 
$str *
} 
; 
} 	
public 
static 

Consultant  /
#AddedValidConsultantWithUniqueEmail! D
(D E!
IApplicationDbContextE Z
context[ b
)b c
{ 	
var 

consultant 
= 
new  

Consultant! +
{ 
Username 
= 
$str !
,! "
Location 
= 
$str !
,! "
Email 
= 
$str .
,. /
Skill 
= 
$str "
," #
NumberOfTickets 
=  !
$num" $
,$ %
Availability 
= 
$str *
} 
; 
context   
.   
GetCollection   !
<  ! "

Consultant  " ,
>  , -
(  - .
)  . /
.  / 0
	InsertOne  0 9
(  9 :

consultant  : D
)  D E
;  E F
return!! 

consultant!! 
;!! 
}"" 	
public## 
static## 

Consultant##  !
ValidConsultantWithId##! 6
(##6 7
)##7 8
{$$ 	
return%% 
new%% 

Consultant%% !
{&& 
Id'' 
='' 
$str'' /
,''/ 0
Username(( 
=(( 
$str(( !
,((! "
Location)) 
=)) 
$str)) !
,))! "
Email** 
=** 
$str** (
,**( )
Skill++ 
=++ 
$str++ "
,++" #
NumberOfTickets,, 
=,,  !
$num,," $
,,,$ %
Availability-- 
=-- 
$str-- *
}.. 
;.. 
}// 	
public11 
static11 

Consultant11  
Added2Consultants11! 2
(112 3!
IApplicationDbContext113 H
context11I P
)11P Q
{22 	
var33 
consultant133 
=33 
ValidConsultant33 -
(33- .
)33. /
;33/ 0
var44 
consultant244 
=44 
ValidConsultant44 -
(44- .
)44. /
;44/ 0
context55 
.55 
GetCollection55 !
<55! "

Consultant55" ,
>55, -
(55- .
)55. /
.55/ 0
	InsertOne550 9
(559 :
consultant155: E
)55E F
;55F G
context66 
.66 
GetCollection66 !
<66! "

Consultant66" ,
>66, -
(66- .
)66. /
.66/ 0
	InsertOne660 9
(669 :
consultant266: E
)66E F
;66F G
return77 
consultant177 
;77 
}88 	
public:: 
static:: 

Consultant::  
AddedConsultant::! 0
(::0 1!
IApplicationDbContext::1 F
context::G N
)::N O
{;; 	
var<< 

consultant<< 
=<< 
ValidConsultant<< ,
(<<, -
)<<- .
;<<. /
context== 
.== 
GetCollection== !
<==! "

Consultant==" ,
>==, -
(==- .
)==. /
.==/ 0
	InsertOne==0 9
(==9 :

consultant==: D
)==D E
;==E F
return>> 

consultant>> 
;>> 
}?? 	
publicAA 
staticAA 

ConsultantAA  1
%UpdateUsernameAndEmailValidConsultantAA! F
(AAF G
stringAAG M
idAAN P
)AAP Q
{BB 	
returnCC 
newCC 

ConsultantCC !
(CC! "
)CC" #
{DD 
IdEE 
=EE 
idEE 
,EE 
UsernameFF 
=FF 
$strFF $
,FF$ %
EmailGG 
=GG 
$strGG )
}HH 
;HH 
}II 	
publicKK 
staticKK 

ConsultantKK  %
ConsultantWithUniqueEmailKK! :
(KK: ;!
IApplicationDbContextKK; P
contextKKQ X
)KKX Y
{LL 	
varMM 
consultant1MM 
=MM 
newMM !

ConsultantMM" ,
{NN 
UsernameOO 
=OO 
$strOO !
,OO! "
LocationPP 
=PP 
$strPP !
,PP! "
EmailQQ 
=QQ 
$strQQ )
,QQ) *
SkillRR 
=RR 
$strRR "
,RR" #
NumberOfTicketsSS 
=SS  !
$numSS" $
,SS$ %
AvailabilityTT 
=TT 
$strTT *
}UU 
;UU 
varVV 
consultant2VV 
=VV 
newVV !

ConsultantVV" ,
{WW 
UsernameXX 
=XX 
$strXX !
,XX! "
LocationYY 
=YY 
$strYY !
,YY! "
EmailZZ 
=ZZ 
$strZZ )
,ZZ) *
Skill[[ 
=[[ 
$str[[ "
,[[" #
NumberOfTickets\\ 
=\\  !
$num\\" $
,\\$ %
Availability]] 
=]] 
$str]] *
}^^ 
;^^ 
context__ 
.__ 
GetCollection__ !
<__! "

Consultant__" ,
>__, -
(__- .
)__. /
.__/ 0
	InsertOne__0 9
(__9 :
consultant1__: E
)__E F
;__F G
context`` 
.`` 
GetCollection`` !
<``! "

Consultant``" ,
>``, -
(``- .
)``. /
.``/ 0
	InsertOne``0 9
(``9 :
consultant2``: E
)``E F
;``F G
varbb 
newConsultantbb 
=bb 
newbb  #

Consultantbb$ .
{cc 
Usernamedd 
=dd 
$strdd !
,dd! "
Locationee 
=ee 
$stree !
,ee! "
Emailff 
=ff 
$strff )
,ff) *
Skillgg 
=gg 
$strgg "
,gg" #
NumberOfTicketshh 
=hh  !
$numhh" $
,hh$ %
Availabilityii 
=ii 
$strii *
}jj 
;jj 
returnkk 
newConsultantkk  
;kk  !
}ll 	
publicnn 
staticnn 

Consultantnn  4
(ConsultantWithExistingEmailInConsultantsnn! I
(nnI J!
IApplicationDbContextnnJ _
contextnn` g
)nng h
{oo 	
varpp 
consultant1pp 
=pp 
ValidConsultantpp -
(pp- .
)pp. /
;pp/ 0
varqq 
consultant2qq 
=qq 
newqq !

Consultantqq" ,
{rr 
Usernamess 
=ss 
$strss !
,ss! "
Locationtt 
=tt 
$strtt !
,tt! "
Emailuu 
=uu 
$struu )
,uu) *
Skillvv 
=vv 
$strvv "
,vv" #
NumberOfTicketsww 
=ww  !
$numww" $
,ww$ %
Availabilityxx 
=xx 
$strxx *
}yy 
;yy 
contextzz 
.zz 
GetCollectionzz !
<zz! "

Consultantzz" ,
>zz, -
(zz- .
)zz. /
.zz/ 0
	InsertOnezz0 9
(zz9 :
consultant1zz: E
)zzE F
;zzF G
context{{ 
.{{ 
GetCollection{{ !
<{{! "

Consultant{{" ,
>{{, -
({{- .
){{. /
.{{/ 0
	InsertOne{{0 9
({{9 :
consultant2{{: E
){{E F
;{{F G
var}} 
newConsultant}} 
=}} 
ValidConsultant}}  /
(}}/ 0
)}}0 1
;}}1 2
return~~ 
newConsultant~~  
;~~  !
} 	
public
ÅÅ 
static
ÅÅ 

Consultant
ÅÅ  0
"ConsultantWithExistingEmailInUsers
ÅÅ! C
(
ÅÅC D#
IApplicationDbContext
ÅÅD Y
context
ÅÅZ a
)
ÅÅa b
{
ÇÇ 	
var
ÉÉ 

consultant
ÉÉ 
=
ÉÉ 
ValidConsultant
ÉÉ ,
(
ÉÉ, -
)
ÉÉ- .
;
ÉÉ. /
var
ÑÑ 
user
ÑÑ 
=
ÑÑ 
UserFactory
ÑÑ "
.
ÑÑ" #
	ValidUser
ÑÑ# ,
(
ÑÑ, -
)
ÑÑ- .
;
ÑÑ. /
context
ÖÖ 
.
ÖÖ 
GetCollection
ÖÖ !
<
ÖÖ! "
User
ÖÖ" &
>
ÖÖ& '
(
ÖÖ' (
)
ÖÖ( )
.
ÖÖ) *
	InsertOne
ÖÖ* 3
(
ÖÖ3 4
user
ÖÖ4 8
)
ÖÖ8 9
;
ÖÖ9 :
context
ÜÜ 
.
ÜÜ 
GetCollection
ÜÜ !
<
ÜÜ! "

Consultant
ÜÜ" ,
>
ÜÜ, -
(
ÜÜ- .
)
ÜÜ. /
.
ÜÜ/ 0
	InsertOne
ÜÜ0 9
(
ÜÜ9 :

consultant
ÜÜ: D
)
ÜÜD E
;
ÜÜE F
var
àà 
newConsultant
àà 
=
àà 
new
àà  #

Consultant
àà$ .
{
ââ 
Username
ää 
=
ää 
$str
ää !
,
ää! "
Location
ãã 
=
ãã 
$str
ãã !
,
ãã! "
Email
åå 
=
åå 
user
åå 
.
åå 
Email
åå "
,
åå" #
Skill
çç 
=
çç 
$str
çç "
,
çç" #
NumberOfTickets
éé 
=
éé  !
$num
éé" $
,
éé$ %
Availability
èè 
=
èè 
$str
èè *
}
êê 
;
êê 
return
ëë 
newConsultant
ëë  
;
ëë  !
}
íí 	
}
ìì 
}îî Û1
hC:\Fac\SysopSquadAccounts\Accounts\Tests.Helpers\ConsultantFactories\RegisterConsultantCommandFactory.cs
	namespace 	
Tests
 
. 
Helpers 
. 
ConsultantFactories +
{ 
public 

static 
class ,
 RegisterConsultantCommandFactory 8
{ 
public 
static %
RegisterConsultantCommand /*
ValidRegisterConsultantCommand0 N
(N O
)O P
=>Q S
newT W
(W X
)X Y
{ 	
Username		 
=		 
$str		 
,		 
Location

 
=

 
$str

 
,

 
Email 
= 
$str %
,% &
Password 
= 
$str 
} 	
;	 

public 
static %
RegisterConsultantCommand /6
*RegisterConsultantCommandWithShortPassword0 Z
(Z [
)[ \
{ 	
var 
registerCommand 
=  !*
ValidRegisterConsultantCommand" @
(@ A
)A B
;B C
registerCommand 
. 
Password $
=% &
$str' ,
;, -
return 
registerCommand "
;" #
} 	
public 
static %
RegisterConsultantCommand /9
-RegisterConsultantCommandWithNoDigitsPassword0 ]
(] ^
)^ _
{ 	
var 
registerCommand 
=  !*
ValidRegisterConsultantCommand" @
(@ A
)A B
;B C
registerCommand 
. 
Password $
=% &
$str' .
;. /
return 
registerCommand "
;" #
} 	
public 
static %
RegisterConsultantCommand /3
'RegisterConsultantCommandWithNoPassword0 W
(W X
)X Y
{ 	
var 
registerCommand 
=  !*
ValidRegisterConsultantCommand" @
(@ A
)A B
;B C
registerCommand   
.   
Password   $
=  % &
$str  ' )
;  ) *
return!! 
registerCommand!! "
;!!" #
}"" 	
public$$ 
static$$ %
RegisterConsultantCommand$$ /6
*RegisterConsultantCommandWithEmptyUsername$$0 Z
($$Z [
)$$[ \
{%% 	
var&& 
registerCommand&& 
=&&  !*
ValidRegisterConsultantCommand&&" @
(&&@ A
)&&A B
;&&B C
registerCommand'' 
.'' 
Username'' $
=''% &
$str''' )
;'') *
return(( 
registerCommand(( "
;((" #
})) 	
public++ 
static++ %
RegisterConsultantCommand++ /6
*RegisterConsultantCommandWithEmptyLocation++0 Z
(++Z [
)++[ \
{,, 	
var-- 
registerCommand-- 
=--  !*
ValidRegisterConsultantCommand--" @
(--@ A
)--A B
;--B C
registerCommand.. 
... 
Location.. $
=..% &
$str..' )
;..) *
return// 
registerCommand// "
;//" #
}00 	
public22 
static22 %
RegisterConsultantCommand22 /3
'RegisterConsultantCommandWithEmptyEmail220 W
(22W X
)22X Y
{33 	
var44 
registerCommand44 
=44  !*
ValidRegisterConsultantCommand44" @
(44@ A
)44A B
;44B C
registerCommand55 
.55 
Email55 !
=55" #
$str55$ &
;55& '
return66 
registerCommand66 "
;66" #
}77 	
public99 
static99 %
RegisterConsultantCommand99 //
#RegisterConsultantCommandWithNoData990 S
(99S T
)99T U
=>99V X
new99Y \
(99\ ]
)99] ^
;99^ _
public;; 
static;; %
RegisterConsultantCommand;; /6
*RegisterConsultantCommandWithShortUsername;;0 Z
(;;Z [
);;[ \
{<< 	
var== 
registerCommand== 
===  !*
ValidRegisterConsultantCommand==" @
(==@ A
)==A B
;==B C
registerCommand>> 
.>> 
Username>> $
=>>% &
$str>>' *
;>>* +
return?? 
registerCommand?? "
;??" #
}@@ 	
publicBB 
staticBB %
RegisterConsultantCommandBB /6
*RegisterConsultantCommandWithShortLocationBB0 Z
(BBZ [
)BB[ \
{CC 	
varDD 
registerCommandDD 
=DD  !*
ValidRegisterConsultantCommandDD" @
(DD@ A
)DDA B
;DDB C
registerCommandEE 
.EE 
LocationEE $
=EE% &
$strEE' *
;EE* +
returnFF 
registerCommandFF "
;FF" #
}GG 	
publicII 
staticII %
RegisterConsultantCommandII /5
)RegisterConsultantCommandWithInvalidEmailII0 Y
(IIY Z
)IIZ [
{JJ 	
varKK 
registerCommandKK 
=KK  !*
ValidRegisterConsultantCommandKK" @
(KK@ A
)KKA B
;KKB C
registerCommandLL 
.LL 
EmailLL !
=LL" #
$strLL$ -
;LL- .
returnMM 
registerCommandMM "
;MM" #
}NN 	
publicPP 
staticPP %
RegisterConsultantCommandPP /;
/ValidRegisterConsultantCommandWithExistingEmailPP0 _
(PP_ `
)PP` a
=>PPb d
newPPe h
(PPh i
)PPi j
{QQ 	
UsernameRR 
=RR 
$strRR 
,RR 
LocationSS 
=SS 
$strSS 
,SS 
EmailTT 
=TT 
$strTT -
,TT- .
PasswordUU 
=UU 
$strUU 
}VV 	
;VV	 

}WW 
}XX ˆ"
jC:\Fac\SysopSquadAccounts\Accounts\Tests.Helpers\ConsultantFactories\UpdateConsultantByIdCommandFactory.cs
	namespace 	
Tests
 
. 
Helpers 
. 
ConsultantFactories +
{ 
public 

static 
class .
"UpdateConsultantByIdCommandFactory :
{ 
public 
static '
UpdateConsultantByIdCommand 1(
ValidUpdateConsultantCommand2 N
(N O
stringO U
idV X
)X Y
{ 	
return		 
new		 
(		 
)		 
{

 
Id 
= 
id 
, 
Username 
= 
$str "
," #
Location 
= 
$str !
,! "
Email 
= 
$str 3
,3 4
Password 
= 
$str !
,! "
Skill 
= 
$str "
," #
NumberOfTickets 
=  !
$num" #
,# $
Availability 
= 
$str *
} 
; 
} 	
public 
static '
UpdateConsultantByIdCommand 1,
 UpdateConsultantCommandWithoutId2 R
(R S
)S T
=>U W
new 
( 
) 
{ 
Username 
= 
$str "
," #
Location 
= 
$str !
,! "
Email 
= 
$str 3
,3 4
Password 
= 
$str !
,! "
Skill 
= 
$str "
," #
NumberOfTickets 
=  !
$num" #
,# $
Availability 
= 
$str *
}   
;   
public"" 
static"" '
UpdateConsultantByIdCommand"" 19
-UpdateConsultantCommandWithInvalidIdStructure""2 _
(""_ `
)""` a
=>""b d
new## 
(## 
)## 
{$$ 
Id%% 
=%% 
$str%% /
,%%/ 0
Username&& 
=&& 
$str&& "
,&&" #
Location'' 
='' 
$str'' !
,''! "
Email(( 
=(( 
$str(( 3
,((3 4
Password)) 
=)) 
$str)) !
,))! "
Skill** 
=** 
$str** "
,**" #
NumberOfTickets++ 
=++  !
$num++" #
,++# $
Availability,, 
=,, 
$str,, *
}-- 
;-- 
public// 
static// '
UpdateConsultantByIdCommand// 16
*UpdateConsultantCommandWithInvalidIdLength//2 \
(//\ ]
)//] ^
=>//_ a
new00 
(00 
)00 
{11 
Id22 
=22 
$str22 
,22 
Username33 
=33 
$str33 "
,33" #
Location44 
=44 
$str44 !
,44! "
Email55 
=55 
$str55 3
,553 4
Password66 
=66 
$str66 !
,66! "
Skill77 
=77 
$str77 "
,77" #
NumberOfTickets88 
=88  !
$num88" #
,88# $
Availability99 
=99 
$str99 *
}:: 
;:: 
public<< 
static<< '
UpdateConsultantByIdCommand<< 13
'UpdateConsultantCommandWithInexistentId<<2 Y
(<<Y Z
)<<Z [
=><<\ ^
new== 
(== 
)== 
{>> 
Id?? 
=?? 
$str?? /
,??/ 0
Username@@ 
=@@ 
$str@@ "
,@@" #
LocationAA 
=AA 
$strAA !
,AA! "
EmailBB 
=BB 
$strBB 3
,BB3 4
PasswordCC 
=CC 
$strCC !
,CC! "
SkillDD 
=DD 
$strDD "
,DD" #
NumberOfTicketsEE 
=EE  !
$numEE" #
,EE# $
AvailabilityFF 
=FF 
$strFF *
}GG 
;GG 
}HH 
}II Ñ=
\C:\Fac\SysopSquadAccounts\Accounts\Tests.Helpers\UserFactories\RegisterUserCommandFactory.cs
	namespace 	
Tests
 
. 
Helpers 
. 
UserFactories %
{ 
public 

static 
class &
RegisterUserCommandFactory 2
{ 
public 
static 
RegisterUserCommand )$
ValidRegisterUserCommand* B
(B C
)C D
=>E G
newH K
(K L
)L M
{ 	
Username		 
=		 
$str		 
,		 
Type

 
=

 
$str

 
,

 
Location 
= 
$str 
, 
Email 
= 
$str %
,% &
Password 
= 
$str 
} 	
;	 

public 
static 
RegisterUserCommand )5
)ValidRegisterUserCommandWithExistingEmail* S
(S T
)T U
=>V X
newY \
(\ ]
)] ^
{ 	
Username 
= 
$str 
, 
Type 
= 
$str 
, 
Location 
= 
$str 
, 
Email 
= 
$str .
,. /
Password 
= 
$str 
} 	
;	 

public 
static 
RegisterUserCommand )0
$RegisterUserCommandWithShortPassword* N
(N O
)O P
{ 	
var 
registerUser 
= $
ValidRegisterUserCommand 7
(7 8
)8 9
;9 :
registerUser 
. 
Password !
=" #
$str$ )
;) *
return 
registerUser 
;  
} 	
public   
static   
RegisterUserCommand   )0
$RegisterUserCommandWithShortUsername  * N
(  N O
)  O P
{!! 	
var"" 
registerUser"" 
="" $
ValidRegisterUserCommand"" 7
(""7 8
)""8 9
;""9 :
registerUser## 
.## 
Username## !
=##" #
$str##$ '
;##' (
return$$ 
registerUser$$ 
;$$  
}%% 	
public'' 
static'' 
RegisterUserCommand'' )0
$RegisterUserCommandWithShortLocation''* N
(''N O
)''O P
{(( 	
var)) 
registerUser)) 
=)) $
ValidRegisterUserCommand)) 7
())7 8
)))8 9
;))9 :
registerUser** 
.** 
Location** !
=**" #
$str**$ '
;**' (
return++ 
registerUser++ 
;++  
},, 	
public.. 
static.. 
RegisterUserCommand.. )/
#RegisterUserCommandWithInvalidEmail..* M
(..M N
)..N O
{// 	
var00 
registerUser00 
=00 $
ValidRegisterUserCommand00 7
(007 8
)008 9
;009 :
registerUser11 
.11 
Email11 
=11  
$str11! -
;11- .
return22 
registerUser22 
;22  
}33 	
public55 
static55 
RegisterUserCommand55 )3
'RegisterUserCommandWithNoDigitsPassword55* Q
(55Q R
)55R S
{66 	
var77 
registerUser77 
=77 $
ValidRegisterUserCommand77 7
(777 8
)778 9
;779 :
registerUser88 
.88 
Password88 !
=88" #
$str88$ +
;88+ ,
return99 
registerUser99 
;99  
}:: 	
public<< 
static<< 
RegisterUserCommand<< ),
 RegisterUserCommandWithWrongType<<* J
(<<J K
)<<K L
{== 	
var>> 
registerUser>> 
=>> $
ValidRegisterUserCommand>> 7
(>>7 8
)>>8 9
;>>9 :
registerUser?? 
.?? 
Type?? 
=?? 
$str??  '
;??' (
return@@ 
registerUser@@ 
;@@  
}AA 	
publicCC 
staticCC 
RegisterUserCommandCC )=
1RegisterUserCommandWithEmptyPasswordAndNoUsernameCC* [
(CC[ \
)CC\ ]
{DD 	
varEE 
registerUserEE 
=EE $
ValidRegisterUserCommandEE 7
(EE7 8
)EE8 9
;EE9 :
registerUserFF 
.FF 
PasswordFF !
=FF" #
$strFF$ &
;FF& '
registerUserGG 
.GG 
UsernameGG !
=GG" #
$strGG$ &
;GG& '
returnHH 
registerUserHH 
;HH  
}II 	
publicKK 
staticKK 
RegisterUserCommandKK )-
!RegisterUserCommandWithNoPasswordKK* K
(KKK L
)KKL M
{LL 	
varMM 
registerUserMM 
=MM $
ValidRegisterUserCommandMM 7
(MM7 8
)MM8 9
;MM9 :
registerUserNN 
.NN 
PasswordNN !
=NN" #
$strNN$ &
;NN& '
returnOO 
registerUserOO 
;OO  
}PP 	
publicRR 
staticRR 
RegisterUserCommandRR )0
$RegisterUserCommandWithEmptyUsernameRR* N
(RRN O
)RRO P
{SS 	
varTT 
registerUserTT 
=TT $
ValidRegisterUserCommandTT 7
(TT7 8
)TT8 9
;TT9 :
registerUserUU 
.UU 
UsernameUU !
=UU" #
$strUU$ &
;UU& '
returnVV 
registerUserVV 
;VV  
}WW 	
publicYY 
staticYY 
RegisterUserCommandYY )0
$RegisterUserCommandWithEmptyLocationYY* N
(YYN O
)YYO P
{ZZ 	
var[[ 
registerUser[[ 
=[[ $
ValidRegisterUserCommand[[ 7
([[7 8
)[[8 9
;[[9 :
registerUser\\ 
.\\ 
Location\\ !
=\\" #
$str\\$ &
;\\& '
return]] 
registerUser]] 
;]]  
}^^ 	
public`` 
static`` 
RegisterUserCommand`` )-
!RegisterUserCommandWithEmptyEmail``* K
(``K L
)``L M
{aa 	
varbb 
registerUserbb 
=bb $
ValidRegisterUserCommandbb 7
(bb7 8
)bb8 9
;bb9 :
registerUsercc 
.cc 
Emailcc 
=cc  
$strcc! #
;cc# $
returndd 
registerUserdd 
;dd  
}ee 	
publicgg 
staticgg 
RegisterUserCommandgg ),
 RegisterUserCommandWithEmptyTypegg* J
(ggJ K
)ggK L
{hh 	
varii 
registerUserii 
=ii $
ValidRegisterUserCommandii 7
(ii7 8
)ii8 9
;ii9 :
registerUserjj 
.jj 
Typejj 
=jj 
$strjj  "
;jj" #
returnkk 
registerUserkk 
;kk  
}ll 	
publicmm 
staticmm 
RegisterUserCommandmm ))
RegisterUserCommandWithNoDatamm* G
(mmG H
)mmH I
=>mmJ L
newmmM P
(mmP Q
)mmQ R
;mmR S
}oo 
}pp Ç!
^C:\Fac\SysopSquadAccounts\Accounts\Tests.Helpers\UserFactories\UpdateUserByIdCommandFactory.cs
	namespace 	
Tests
 
. 
Helpers 
. 
UserFactories %
{ 
public 

static 
class (
UpdateUserByIdCommandFactory 4
{ 
public 
static !
UpdateUserByIdCommand +"
ValidUpdateUserCommand, B
(B C
stringC I
idJ L
)L M
{		 	
return

 
new

 
(

 
)

 
{ 
Id 
= 
id 
, 
Username 
= 
$str "
," #
Location 
= 
$str !
,! "
Email 
= 
$str )
,) *
Password 
= 
$str !
,! "
	TicketsId 
= 
new 
List  $
<$ %
string% +
>+ ,
{- .
$str. H
}H I
} 
; 
} 	
public 
static !
UpdateUserByIdCommand +&
UpdateUserCommandWithoutId, F
(F G
)G H
=>I K
new 
( 
) 
{ 
Username 
= 
$str "
," #
Location 
= 
$str !
,! "
Email 
= 
$str )
,) *
Password 
= 
$str !
,! "
	TicketsId 
= 
new 
List  $
<$ %
string% +
>+ ,
{- .
$str/ I
}J K
} 
; 
public 
static !
UpdateUserByIdCommand +3
'UpdateUserCommandWithInvalidIdStructure, S
(S T
)T U
=>V X
new   
(   
)   
{!! 
Id"" 
="" 
$str"" /
,""/ 0
Username## 
=## 
$str## "
,##" #
Location$$ 
=$$ 
$str$$ !
,$$! "
Email%% 
=%% 
$str%% )
,%%) *
Password&& 
=&& 
$str&& !
,&&! "
	TicketsId'' 
='' 
new'' 
List''  $
<''$ %
string''% +
>''+ ,
{''- .
$str''/ I
}''J K
}(( 
;(( 
public** 
static** !
UpdateUserByIdCommand** +0
$UpdateUserCommandWithInvalidIdLength**, P
(**P Q
)**Q R
=>**S U
new++ 
(++ 
)++ 
{,, 
Id-- 
=-- 
$str-- 
,-- 
Username.. 
=.. 
$str.. "
,.." #
Location// 
=// 
$str// !
,//! "
Email00 
=00 
$str00 )
,00) *
Password11 
=11 
$str11 !
,11! "
	TicketsId22 
=22 
new22 
List22  $
<22$ %
string22% +
>22+ ,
{22- .
$str22/ I
}22J K
}33 
;33 
public55 
static55 !
UpdateUserByIdCommand55 +-
!UpdateUserCommandWithInexistentId55, M
(55M N
)55N O
=>55P R
new66 
(66 
)66 
{77 
Id88 
=88 
$str88 /
,88/ 0
Username99 
=99 
$str99 "
,99" #
Location:: 
=:: 
$str:: !
,::! "
Email;; 
=;; 
$str;; )
,;;) *
Password<< 
=<< 
$str<< !
,<<! "
	TicketsId== 
=== 
new== 
List==  $
<==$ %
string==% +
>==+ ,
{==- .
$str==/ I
}==J K
}>> 
;>> 
}@@ 
}AA µR
MC:\Fac\SysopSquadAccounts\Accounts\Tests.Helpers\UserFactories\UserFactory.cs
	namespace 	
Tests
 
. 
Helpers 
. 
UserFactories %
{ 
public 

static 
class 
UserFactory #
{ 
public		 
static		 
User		 
	ValidUser		 $
(		$ %
)		% &
{

 	
return 
new 
User 
{ 
Username 
= 
$str "
," #
Location 
= 
$str .
,. /
Email 
= 
$str )
,) *
Type 
= 
$str 
,  
	TicketsId 
= 
{ 
$str 8
}9 :
} 
; 
} 	
public 
static 
User )
AddedValidUserWithUniqueEmail 8
(8 9!
IApplicationDbContext9 N
contextO V
)V W
{ 	
var 
user 
= 
new 
User 
{ 
Username 
= 
$str "
," #
Location 
= 
$str .
,. /
Email 
= 
$str /
,/ 0
Type 
= 
$str 
,  
	TicketsId 
= 
{ 
$str 8
}9 :
} 
; 
context 
. 
GetCollection !
<! "
User" &
>& '
(' (
)( )
.) *
	InsertOne* 3
(3 4
user4 8
)8 9
;9 :
return 
user 
; 
}   	
public!! 
static!! 
User!! 
ValidUserWithId!! *
(!!* +
)!!+ ,
{"" 	
return## 
new## 
User## 
{$$ 
Id%% 
=%% 
$str%% /
,%%/ 0
Username&& 
=&& 
$str&& "
,&&" #
Location'' 
='' 
$str'' .
,''. /
Email(( 
=(( 
$str(( )
,(() *
Type)) 
=)) 
$str)) 
,))  
	TicketsId** 
=** 
{** 
$str** 8
}**9 :
}++ 
;++ 
},, 	
public-- 
static-- 
User-- 
	AddedUser-- $
(--$ %!
IApplicationDbContext--% :
context--; B
)--B C
{.. 	
var// 
user// 
=// 
	ValidUser//  
(//  !
)//! "
;//" #
context00 
.00 
GetCollection00 !
<00! "
User00" &
>00& '
(00' (
)00( )
.00) *
	InsertOne00* 3
(003 4
user004 8
)008 9
;009 :
return11 
user11 
;11 
}22 	
public44 
static44 
User44 
Added2Users44 &
(44& '!
IApplicationDbContext44' <
context44= D
)44D E
{55 	
var66 
user166 
=66 
	ValidUser66 !
(66! "
)66" #
;66# $
var77 
user277 
=77 
	ValidUser77 !
(77! "
)77" #
;77# $
context88 
.88 
GetCollection88 !
<88! "
User88" &
>88& '
(88' (
)88( )
.88) *
	InsertOne88* 3
(883 4
user1884 9
)889 :
;88: ;
context99 
.99 
GetCollection99 !
<99! "
User99" &
>99& '
(99' (
)99( )
.99) *
	InsertOne99* 3
(993 4
user2994 9
)999 :
;99: ;
return:: 
user1:: 
;:: 
};; 	
public<< 
static<< 
User<< +
UpdateUsernameAndEmailValidUser<< :
(<<: ;
string<<; A
id<<B D
)<<D E
{== 	
return>> 
new>> 
User>> 
{?? 
Id@@ 
=@@ 
id@@ 
,@@ 
UsernameAA 
=AA 
$strAA $
,AA$ %
EmailBB 
=BB 
$strBB )
}CC 
;CC 
}DD 	
publicEE 
staticEE 
UserEE 
UpdateTypeValidUserEE .
(EE. /
stringEE/ 5
idEE6 8
)EE8 9
{FF 	
returnGG 
newGG 
UserGG 
{HH 
IdII 
=II 
idII 
,II 
TypeJJ 
=JJ 
$strJJ !
}KK 
;KK 
}LL 	
publicNN 
staticNN 
UserNN 
UserWithUniqueEmailNN .
(NN. /!
IApplicationDbContextNN/ D
contextNNE L
)NNL M
{OO 	
varPP 
user1PP 
=PP 
newPP 
UserPP  
{QQ 
UsernameRR 
=RR 
$strRR "
,RR" #
LocationSS 
=SS 
$strSS .
,SS. /
EmailTT 
=TT 
$strTT *
,TT* +
TypeUU 
=UU 
$strUU 
,UU  
	TicketsIdVV 
=VV 
{VV 
$strVV 8
}VV9 :
}WW 
;WW 
varXX 
user2XX 
=XX 
newXX 
UserXX  
{YY 
UsernameZZ 
=ZZ 
$strZZ "
,ZZ" #
Location[[ 
=[[ 
$str[[ .
,[[. /
Email\\ 
=\\ 
$str\\ *
,\\* +
Type]] 
=]] 
$str]] 
,]]  
	TicketsId^^ 
=^^ 
{^^ 
$str^^ 8
}^^9 :
}__ 
;__ 
context`` 
.`` 
GetCollection`` !
<``! "
User``" &
>``& '
(``' (
)``( )
.``) *
	InsertOne``* 3
(``3 4
user1``4 9
)``9 :
;``: ;
contextaa 
.aa 
GetCollectionaa !
<aa! "
Useraa" &
>aa& '
(aa' (
)aa( )
.aa) *
	InsertOneaa* 3
(aa3 4
user2aa4 9
)aa9 :
;aa: ;
varcc 
newUsercc 
=cc 
newcc 
Usercc "
{dd 
Usernameee 
=ee 
$stree "
,ee" #
Locationff 
=ff 
$strff .
,ff. /
Emailgg 
=gg 
$strgg *
,gg* +
Typehh 
=hh 
$strhh 
,hh  
	TicketsIdii 
=ii 
{ii 
$strii 8
}ii9 :
}jj 
;jj 
returnkk 
newUserkk 
;kk 
}ll 	
publicmm 
staticmm 
Usermm (
UserWithExistingEmailInUsersmm 7
(mm7 8!
IApplicationDbContextmm8 M
contextmmN U
)mmU V
{nn 	
varoo 
user1oo 
=oo 
	ValidUseroo !
(oo! "
)oo" #
;oo# $
varpp 
user2pp 
=pp 
newpp 
Userpp  
{qq 
Usernamerr 
=rr 
$strrr "
,rr" #
Locationss 
=ss 
$strss .
,ss. /
Emailtt 
=tt 
$strtt *
,tt* +
Typeuu 
=uu 
$struu 
,uu  
	TicketsIdvv 
=vv 
{vv 
$strvv 8
}vv9 :
}ww 
;ww 
contextxx 
.xx 
GetCollectionxx !
<xx! "
Userxx" &
>xx& '
(xx' (
)xx( )
.xx) *
	InsertOnexx* 3
(xx3 4
user1xx4 9
)xx9 :
;xx: ;
contextyy 
.yy 
GetCollectionyy !
<yy! "
Useryy" &
>yy& '
(yy' (
)yy( )
.yy) *
	InsertOneyy* 3
(yy3 4
user2yy4 9
)yy9 :
;yy: ;
var{{ 
newUser{{ 
={{ 
	ValidUser{{ #
({{# $
){{$ %
;{{% &
return|| 
newUser|| 
;|| 
}}} 	
public~~ 
static~~ 
User~~ .
"UserWithExistingEmailInConsultants~~ =
(~~= >!
IApplicationDbContext~~> S
context~~T [
)~~[ \
{ 	
var
ÄÄ 
user
ÄÄ 
=
ÄÄ 
	ValidUser
ÄÄ  
(
ÄÄ  !
)
ÄÄ! "
;
ÄÄ" #
var
ÅÅ 

consultant
ÅÅ 
=
ÅÅ 
ConsultantFactory
ÅÅ .
.
ÅÅ. /
ValidConsultant
ÅÅ/ >
(
ÅÅ> ?
)
ÅÅ? @
;
ÅÅ@ A
context
ÇÇ 
.
ÇÇ 
GetCollection
ÇÇ !
<
ÇÇ! "
User
ÇÇ" &
>
ÇÇ& '
(
ÇÇ' (
)
ÇÇ( )
.
ÇÇ) *
	InsertOne
ÇÇ* 3
(
ÇÇ3 4
user
ÇÇ4 8
)
ÇÇ8 9
;
ÇÇ9 :
context
ÉÉ 
.
ÉÉ 
GetCollection
ÉÉ !
<
ÉÉ! "

Consultant
ÉÉ" ,
>
ÉÉ, -
(
ÉÉ- .
)
ÉÉ. /
.
ÉÉ/ 0
	InsertOne
ÉÉ0 9
(
ÉÉ9 :

consultant
ÉÉ: D
)
ÉÉD E
;
ÉÉE F
var
ÖÖ 
newUser
ÖÖ 
=
ÖÖ 
new
ÖÖ 
User
ÖÖ "
{
ÜÜ 
Username
áá 
=
áá 
$str
áá "
,
áá" #
Location
àà 
=
àà 
$str
àà .
,
àà. /
Email
ââ 
=
ââ 

consultant
ââ "
.
ââ" #
Email
ââ# (
,
ââ( )
Type
ää 
=
ää 
$str
ää 
,
ää  
	TicketsId
ãã 
=
ãã 
{
ãã 
$str
ãã 8
}
ãã9 :
}
åå 
;
åå 
return
çç 
newUser
çç 
;
çç 
}
éé 	
}
èè 
}êê 