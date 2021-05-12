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
}FF ´L
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
public 
static 

Consultant  !
ValidConsultantWithId! 6
(6 7
)7 8
{ 	
return 
new 

Consultant !
{ 
Id 
= 
$str /
,/ 0
Username 
= 
$str !
,! "
Location 
= 
$str !
,! "
Email 
= 
$str (
,( )
Skill 
= 
$str "
," #
NumberOfTickets 
=  !
$num" $
,$ %
Availability   
=   
$str   *
}!! 
;!! 
}"" 	
public$$ 
static$$ 

Consultant$$  
Added2Consultants$$! 2
($$2 3!
IApplicationDbContext$$3 H
context$$I P
)$$P Q
{%% 	
var&& 
consultant1&& 
=&& 
ValidConsultant&& -
(&&- .
)&&. /
;&&/ 0
var'' 
consultant2'' 
='' 
ValidConsultant'' -
(''- .
)''. /
;''/ 0
context(( 
.(( 
GetCollection(( !
<((! "

Consultant((" ,
>((, -
(((- .
)((. /
.((/ 0
	InsertOne((0 9
(((9 :
consultant1((: E
)((E F
;((F G
context)) 
.)) 
GetCollection)) !
<))! "

Consultant))" ,
>)), -
())- .
))). /
.))/ 0
	InsertOne))0 9
())9 :
consultant2)): E
)))E F
;))F G
return** 
consultant1** 
;** 
}++ 	
public-- 
static-- 

Consultant--  
AddedConsultant--! 0
(--0 1!
IApplicationDbContext--1 F
context--G N
)--N O
{.. 	
var// 

consultant// 
=// 
ValidConsultant// ,
(//, -
)//- .
;//. /
context00 
.00 
GetCollection00 !
<00! "

Consultant00" ,
>00, -
(00- .
)00. /
.00/ 0
	InsertOne000 9
(009 :

consultant00: D
)00D E
;00E F
return11 

consultant11 
;11 
}22 	
public44 
static44 

Consultant44  1
%UpdateUsernameAndEmailValidConsultant44! F
(44F G
string44G M
id44N P
)44P Q
{55 	
return66 
new66 

Consultant66 !
(66! "
)66" #
{77 
Id88 
=88 
id88 
,88 
Username99 
=99 
$str99 $
,99$ %
Email:: 
=:: 
$str:: )
};; 
;;; 
}<< 	
public>> 
static>> 

Consultant>>  %
ConsultantWithUniqueEmail>>! :
(>>: ;!
IApplicationDbContext>>; P
context>>Q X
)>>X Y
{?? 	
var@@ 
consultant1@@ 
=@@ 
new@@ !

Consultant@@" ,
{AA 
UsernameBB 
=BB 
$strBB !
,BB! "
LocationCC 
=CC 
$strCC !
,CC! "
EmailDD 
=DD 
$strDD )
,DD) *
SkillEE 
=EE 
$strEE "
,EE" #
NumberOfTicketsFF 
=FF  !
$numFF" $
,FF$ %
AvailabilityGG 
=GG 
$strGG *
}HH 
;HH 
varII 
consultant2II 
=II 
newII !

ConsultantII" ,
{JJ 
UsernameKK 
=KK 
$strKK !
,KK! "
LocationLL 
=LL 
$strLL !
,LL! "
EmailMM 
=MM 
$strMM )
,MM) *
SkillNN 
=NN 
$strNN "
,NN" #
NumberOfTicketsOO 
=OO  !
$numOO" $
,OO$ %
AvailabilityPP 
=PP 
$strPP *
}QQ 
;QQ 
contextRR 
.RR 
GetCollectionRR !
<RR! "

ConsultantRR" ,
>RR, -
(RR- .
)RR. /
.RR/ 0
	InsertOneRR0 9
(RR9 :
consultant1RR: E
)RRE F
;RRF G
contextSS 
.SS 
GetCollectionSS !
<SS! "

ConsultantSS" ,
>SS, -
(SS- .
)SS. /
.SS/ 0
	InsertOneSS0 9
(SS9 :
consultant2SS: E
)SSE F
;SSF G
varUU 
newConsultantUU 
=UU 
newUU  #

ConsultantUU$ .
{VV 
UsernameWW 
=WW 
$strWW !
,WW! "
LocationXX 
=XX 
$strXX !
,XX! "
EmailYY 
=YY 
$strYY )
,YY) *
SkillZZ 
=ZZ 
$strZZ "
,ZZ" #
NumberOfTickets[[ 
=[[  !
$num[[" $
,[[$ %
Availability\\ 
=\\ 
$str\\ *
}]] 
;]] 
return^^ 
newConsultant^^  
;^^  !
}__ 	
publicaa 
staticaa 

Consultantaa  4
(ConsultantWithExistingEmailInConsultantsaa! I
(aaI J!
IApplicationDbContextaaJ _
contextaa` g
)aag h
{bb 	
varcc 
consultant1cc 
=cc 
ValidConsultantcc -
(cc- .
)cc. /
;cc/ 0
vardd 
consultant2dd 
=dd 
newdd !

Consultantdd" ,
{ee 
Usernameff 
=ff 
$strff !
,ff! "
Locationgg 
=gg 
$strgg !
,gg! "
Emailhh 
=hh 
$strhh )
,hh) *
Skillii 
=ii 
$strii "
,ii" #
NumberOfTicketsjj 
=jj  !
$numjj" $
,jj$ %
Availabilitykk 
=kk 
$strkk *
}ll 
;ll 
contextmm 
.mm 
GetCollectionmm !
<mm! "

Consultantmm" ,
>mm, -
(mm- .
)mm. /
.mm/ 0
	InsertOnemm0 9
(mm9 :
consultant1mm: E
)mmE F
;mmF G
contextnn 
.nn 
GetCollectionnn !
<nn! "

Consultantnn" ,
>nn, -
(nn- .
)nn. /
.nn/ 0
	InsertOnenn0 9
(nn9 :
consultant2nn: E
)nnE F
;nnF G
varpp 
newConsultantpp 
=pp 
ValidConsultantpp  /
(pp/ 0
)pp0 1
;pp1 2
returnqq 
newConsultantqq  
;qq  !
}rr 	
publictt 
statictt 

Consultanttt  .
"ConsultantWithExistingEmailInUserstt! C
(ttC D!
IApplicationDbContextttD Y
contextttZ a
)tta b
{uu 	
varvv 

consultantvv 
=vv 
ValidConsultantvv ,
(vv, -
)vv- .
;vv. /
varww 
userww 
=ww 
UserFactoryww "
.ww" #
	ValidUserww# ,
(ww, -
)ww- .
;ww. /
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
(xx3 4
userxx4 8
)xx8 9
;xx9 :
contextyy 
.yy 
GetCollectionyy !
<yy! "

Consultantyy" ,
>yy, -
(yy- .
)yy. /
.yy/ 0
	InsertOneyy0 9
(yy9 :

consultantyy: D
)yyD E
;yyE F
var{{ 
newConsultant{{ 
={{ 
new{{  #

Consultant{{$ .
{|| 
Username}} 
=}} 
$str}} !
,}}! "
Location~~ 
=~~ 
$str~~ !
,~~! "
Email 
= 
user 
. 
Email "
," #
Skill
ÄÄ 
=
ÄÄ 
$str
ÄÄ "
,
ÄÄ" #
NumberOfTickets
ÅÅ 
=
ÅÅ  !
$num
ÅÅ" $
,
ÅÅ$ %
Availability
ÇÇ 
=
ÇÇ 
$str
ÇÇ *
}
ÉÉ 
;
ÉÉ 
return
ÑÑ 
newConsultant
ÑÑ  
;
ÑÑ  !
}
ÖÖ 	
}
ÜÜ 
}áá Û1
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
}AA ∂I
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
User 
ValidUserWithId *
(* +
)+ ,
{ 	
return 
new 
User 
{ 
Id 
= 
$str /
,/ 0
Username 
= 
$str "
," #
Location 
= 
$str .
,. /
Email 
= 
$str )
,) *
Type 
= 
$str 
,  
	TicketsId 
= 
{ 
$str 8
}9 :
} 
; 
} 	
public   
static   
User   
	AddedUser   $
(  $ %!
IApplicationDbContext  % :
context  ; B
)  B C
{!! 	
var"" 
user"" 
="" 
	ValidUser""  
(""  !
)""! "
;""" #
context## 
.## 
GetCollection## !
<##! "
User##" &
>##& '
(##' (
)##( )
.##) *
	InsertOne##* 3
(##3 4
user##4 8
)##8 9
;##9 :
return$$ 
user$$ 
;$$ 
}%% 	
public'' 
static'' 
User'' 
Added2Users'' &
(''& '!
IApplicationDbContext''' <
context''= D
)''D E
{(( 	
var)) 
user1)) 
=)) 
	ValidUser)) !
())! "
)))" #
;))# $
var** 
user2** 
=** 
	ValidUser** !
(**! "
)**" #
;**# $
context++ 
.++ 
GetCollection++ !
<++! "
User++" &
>++& '
(++' (
)++( )
.++) *
	InsertOne++* 3
(++3 4
user1++4 9
)++9 :
;++: ;
context,, 
.,, 
GetCollection,, !
<,,! "
User,," &
>,,& '
(,,' (
),,( )
.,,) *
	InsertOne,,* 3
(,,3 4
user2,,4 9
),,9 :
;,,: ;
return-- 
user1-- 
;-- 
}.. 	
public// 
static// 
User// +
UpdateUsernameAndEmailValidUser// :
(//: ;
string//; A
id//B D
)//D E
{00 	
return11 
new11 
User11 
{22 
Id33 
=33 
id33 
,33 
Username44 
=44 
$str44 $
,44$ %
Email55 
=55 
$str55 )
}66 
;66 
}77 	
public88 
static88 
User88 
UpdateTypeValidUser88 .
(88. /
string88/ 5
id886 8
)888 9
{99 	
return:: 
new:: 
User:: 
{;; 
Id<< 
=<< 
id<< 
,<< 
Type== 
=== 
$str== !
}>> 
;>> 
}?? 	
publicAA 
staticAA 
UserAA 
UserWithUniqueEmailAA .
(AA. /!
IApplicationDbContextAA/ D
contextAAE L
)AAL M
{BB 	
varCC 
user1CC 
=CC 
newCC 
UserCC  
{DD 
UsernameEE 
=EE 
$strEE "
,EE" #
LocationFF 
=FF 
$strFF .
,FF. /
EmailGG 
=GG 
$strGG *
,GG* +
TypeHH 
=HH 
$strHH 
,HH  
	TicketsIdII 
=II 
{II 
$strII 8
}II9 :
}JJ 
;JJ 
varKK 
user2KK 
=KK 
newKK 
UserKK  
{LL 
UsernameMM 
=MM 
$strMM "
,MM" #
LocationNN 
=NN 
$strNN .
,NN. /
EmailOO 
=OO 
$strOO *
,OO* +
TypePP 
=PP 
$strPP 
,PP  
	TicketsIdQQ 
=QQ 
{QQ 
$strQQ 8
}QQ9 :
}RR 
;RR 
contextSS 
.SS 
GetCollectionSS !
<SS! "
UserSS" &
>SS& '
(SS' (
)SS( )
.SS) *
	InsertOneSS* 3
(SS3 4
user1SS4 9
)SS9 :
;SS: ;
contextTT 
.TT 
GetCollectionTT !
<TT! "
UserTT" &
>TT& '
(TT' (
)TT( )
.TT) *
	InsertOneTT* 3
(TT3 4
user2TT4 9
)TT9 :
;TT: ;
varVV 
newUserVV 
=VV 
newVV 
UserVV "
{WW 
UsernameXX 
=XX 
$strXX "
,XX" #
LocationYY 
=YY 
$strYY .
,YY. /
EmailZZ 
=ZZ 
$strZZ *
,ZZ* +
Type[[ 
=[[ 
$str[[ 
,[[  
	TicketsId\\ 
=\\ 
{\\ 
$str\\ 8
}\\9 :
}]] 
;]] 
return^^ 
newUser^^ 
;^^ 
}__ 	
public`` 
static`` 
User`` (
UserWithExistingEmailInUsers`` 7
(``7 8!
IApplicationDbContext``8 M
context``N U
)``U V
{aa 	
varbb 
user1bb 
=bb 
	ValidUserbb !
(bb! "
)bb" #
;bb# $
varcc 
user2cc 
=cc 
newcc 
Usercc  
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
;jj 
contextkk 
.kk 
GetCollectionkk !
<kk! "
Userkk" &
>kk& '
(kk' (
)kk( )
.kk) *
	InsertOnekk* 3
(kk3 4
user1kk4 9
)kk9 :
;kk: ;
contextll 
.ll 
GetCollectionll !
<ll! "
Userll" &
>ll& '
(ll' (
)ll( )
.ll) *
	InsertOnell* 3
(ll3 4
user2ll4 9
)ll9 :
;ll: ;
varnn 
newUsernn 
=nn 
	ValidUsernn #
(nn# $
)nn$ %
;nn% &
returnoo 
newUseroo 
;oo 
}pp 	
publicqq 
staticqq 
Userqq .
"UserWithExistingEmailInConsultantsqq =
(qq= >!
IApplicationDbContextqq> S
contextqqT [
)qq[ \
{rr 	
varss 
userss 
=ss 
	ValidUserss  
(ss  !
)ss! "
;ss" #
vartt 

consultanttt 
=tt 
ConsultantFactorytt .
.tt. /
ValidConsultanttt/ >
(tt> ?
)tt? @
;tt@ A
contextuu 
.uu 
GetCollectionuu !
<uu! "
Useruu" &
>uu& '
(uu' (
)uu( )
.uu) *
	InsertOneuu* 3
(uu3 4
useruu4 8
)uu8 9
;uu9 :
contextvv 
.vv 
GetCollectionvv !
<vv! "

Consultantvv" ,
>vv, -
(vv- .
)vv. /
.vv/ 0
	InsertOnevv0 9
(vv9 :

consultantvv: D
)vvD E
;vvE F
varxx 
newUserxx 
=xx 
newxx 
Userxx "
{yy 
Usernamezz 
=zz 
$strzz "
,zz" #
Location{{ 
={{ 
$str{{ .
,{{. /
Email|| 
=|| 

consultant|| "
.||" #
Email||# (
,||( )
Type}} 
=}} 
$str}} 
,}}  
	TicketsId~~ 
=~~ 
{~~ 
$str~~ 8
}~~9 :
} 
; 
return
ÄÄ 
newUser
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
}
ÇÇ 
}ÉÉ 