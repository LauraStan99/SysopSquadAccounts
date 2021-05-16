®
EC:\Fac\SysopSquadAccounts\Accounts\Application\DependencyInjection.cs
	namespace 	
Application
 
{ 
public 

static 
class 
DependencyInjection +
{		 
public

 
static

 
void

 
AddApplication

 )
(

) *
this

* .
IServiceCollection

/ A
services

B J
)

J K
{ 	
services 
. 

AddMediatR 
(  
Assembly  (
.( ) 
GetExecutingAssembly) =
(= >
)> ?
)? @
;@ A
services 
. 
AddAutoMapper "
(" #
	AppDomain# ,
., -
CurrentDomain- :
.: ;
GetAssemblies; H
(H I
)I J
)J K
;K L
} 	
} 
} …
mC:\Fac\SysopSquadAccounts\Accounts\Application\Features\AccountFeatures\Commands\LoginCommand\LoginCommand.cs
	namespace 	
Application
 
. 
Features 
. 
AccountFeatures .
.. /
Commands/ 7
.7 8
LoginCommand8 D
{ 
public 

class 
LoginCommand 
: 
IRequest '
<' (
ResponseEntity( 6
>6 7
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Password		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
} 
} √
tC:\Fac\SysopSquadAccounts\Accounts\Application\Features\AccountFeatures\Commands\LoginCommand\LoginCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
AccountFeatures .
.. /
Commands/ 7
.7 8
LoginCommand8 D
{ 
public 

class 
LoginCommandHandler $
:$ %
IRequestHandler& 5
<5 6
LoginCommand6 B
,B C
ResponseEntityD R
>R S
{ 
private 
readonly 
IAccountRepository +
_repository, 7
;7 8
private 
readonly 
IMapper  
_mapper! (
;( )
public 
LoginCommandHandler "
(" #
IAccountRepository# 5

repository6 @
,@ A
IMapperB I
mapperJ P
)P Q
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
ResponseEntity (
>( )
Handle* 0
(0 1
LoginCommand1 =
request> E
,E F
CancellationTokenG X
cancellationTokenY j
)j k
{ 	
var 
user 
= 
await 
_repository (
.( )
GetByEmailAsync) 8
<8 9
User9 =
>= >
(> ?
request? F
.F G
EmailG L
)L M
;M N
var 

consultant 
= 
await "
_repository# .
.. /
GetByEmailAsync/ >
<> ?

Consultant? I
>I J
(J K
requestK R
.R S
EmailS X
)X Y
;Y Z
var 
account 
= 
( 
user 
!=  "
null# '
)' (
?) *
(+ ,

BaseEntity, 6
)6 7
user8 <
:= >

consultant? I
;I J
if 
( 
! 
Password 
. 
VerifyPasswordHash ,
(, -
request- 4
.4 5
Password5 =
,= >
account? F
.F G
PasswordHashG S
,S T
accountU \
.\ ]
PasswordSalt] i
)i j
)j k
throw 
new 
ArgumentException +
(+ ,
$str, D
,D E
nameofF L
(L M
requestM T
)T U
)U V
;V W
var 
entity 
= 
_mapper  
.  !
Map! $
<$ %
ResponseEntity% 3
>3 4
(4 5
account5 <
)< =
;= >
return   
_repository   
.   
Login   $
(  $ %
entity  % +
)  + ,
.  , -
HidePassword  - 9
(  9 :
)  : ;
;  ; <
}!! 	
}"" 
}## Œ
éC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Commands\DeleteConsultantByIdCommand\DeleteConsultantByIdCommand.cs
	namespace 	
Application
 
. 
Features 
. 
ConsultantFeatures 1
.1 2
Commands2 :
.: ;'
DeleteConsultantByIdCommand; V
{ 
public 

class '
DeleteConsultantByIdCommand ,
:- .
IRequest/ 7
<7 8
bool8 <
>< =
{ 
[		 	
BsonId			 
]		 
[

 	
BsonRepresentation

	 
(

 
BsonType

 $
.

$ %
ObjectId

% -
)

- .
]

. /
public 
readonly 
string 
Id !
;! "
public '
DeleteConsultantByIdCommand *
(* +
string+ 1
id2 4
)4 5
{ 	
Id 
= 
id 
; 
} 	
} 
} ß
ïC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Commands\DeleteConsultantByIdCommand\DeleteConsultantByIdCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
ConsultantFeatures 1
.1 2
Commands2 :
.: ;'
DeleteConsultantByIdCommand; V
{ 
public 

class .
"DeleteConsultantByIdCommandHandler 3
:3 4
IRequestHandler5 D
<D E'
DeleteConsultantByIdCommandE `
,` a
boolb f
>f g
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
"DeleteConsultantByIdCommandHandler 1
(1 2!
IConsultantRepository2 G

repositoryH R
)R S
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& ''
DeleteConsultantByIdCommand' B
requestC J
,J K
CancellationTokenL ]
cancellationToken^ o
)o p
{ 	
return 
await 
_repository $
.$ %
DeleteAsync% 0
(0 1
request1 8
.8 9
Id9 ;
); <
;< =
} 	
} 
} ÿ

äC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Commands\RegisterConsultantCommand\RegisterConsultantCommand.cs
	namespace 	
Application
 
. 
Features 
. 
ConsultantFeatures 1
.1 2
Commands2 :
.: ;%
RegisterConsultantCommand; T
{ 
public 

class %
RegisterConsultantCommand *
:+ ,
IRequest- 5
<5 6

Consultant6 @
>@ A
{ 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Location		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Availability "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} “
ëC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Commands\RegisterConsultantCommand\RegisterConsultantCommandHandler.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 
ConsultantFeatures		 1
.		1 2
Commands		2 :
.		: ;%
RegisterConsultantCommand		; T
{

 
public 

class ,
 RegisterConsultantCommandHandler 1
:2 3
IRequestHandler4 C
<C D%
RegisterConsultantCommandD ]
,] ^

Consultant_ i
>i j
{ 
private 
readonly !
IConsultantRepository .
_repository/ :
;: ;
private 
readonly 
IMapper  
_mapper! (
;( )
public ,
 RegisterConsultantCommandHandler /
(/ 0!
IConsultantRepository0 E

repositoryF P
,P Q
IMapperR Y
mapperZ `
)` a
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 

Consultant $
>$ %
Handle& ,
(, -%
RegisterConsultantCommand- F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 

consultant 
= 
_mapper $
.$ %
Map% (
<( )

Consultant) 3
>3 4
(4 5
request5 <
)< =
;= >

consultant 
. 
Availability #
=$ %
$str& 1
;1 2
return 
await 
_repository $
.$ %
CreateAsync% 0
(0 1

consultant1 ;
,; <
request= D
.D E
PasswordE M
)M N
.N O
HidePasswordO [
([ \
)\ ]
;] ^
} 	
} 
}   √
éC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Commands\UpdateConsultantByIdCommand\UpdateConsultantByIdCommand.cs
	namespace 	
Application
 
. 
Features 
. 
ConsultantFeatures 1
.1 2
Commands2 :
.: ;'
UpdateConsultantByIdCommand; V
{ 
public 

class '
UpdateConsultantByIdCommand ,
:, -
IRequest. 6
<6 7

Consultant7 A
>A B
{		 
[

 	
BsonId

	 
]

 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Skill 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
NumberOfTickets "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Availability "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int  
TotalNumberOfTickets '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
int !
SolvedNumberOfTickets (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ü
ïC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Commands\UpdateConsultantByIdCommand\UpdateConsultantByIdCommandHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
ConsultantFeatures

 1
.

1 2
Commands

2 :
.

: ;'
UpdateConsultantByIdCommand

; V
{ 
public 

class .
"UpdateConsultantByIdCommandHandler 3
:3 4
IRequestHandler5 D
<D E'
UpdateConsultantByIdCommandE `
,` a

Consultantb l
>l m
{ 
private 
readonly !
IConsultantRepository .
_repository/ :
;: ;
private 
readonly 
IMapper  
_mapper! (
;( )
public .
"UpdateConsultantByIdCommandHandler 1
(1 2!
IConsultantRepository2 G

repositoryH R
,R S
IMapperT [
mapper\ b
)b c
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 

Consultant $
>$ %
Handle& ,
(, -'
UpdateConsultantByIdCommand- H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
var 
newConsultant 
= 
_mapper  '
.' (
Map( +
<+ ,

Consultant, 6
>6 7
(7 8
request8 ?
)? @
;@ A
if 
( 
! 
string 
. 
IsNullOrWhiteSpace *
(* +
request+ 2
.2 3
Password3 ;
); <
)< =
{ 
Password 
. 
CreatePasswordHash +
(+ ,
request, 3
.3 4
Password4 <
,< =
out> A
byteB F
[F G
]G H
passwordHashI U
,U V
outW Z
byte[ _
[_ `
]` a
passwordSaltb n
)n o
;o p
newConsultant 
. 
PasswordHash *
=+ ,
passwordHash- 9
;9 :
newConsultant 
. 
PasswordSalt *
=+ ,
passwordSalt- 9
;9 :
} 
return   
await   
_repository   $
.  $ %
UpdateConsultant  % 5
(  5 6
newConsultant  6 C
)  C D
.  D E
HidePassword  E Q
(  Q R
)  R S
;  S T
}!! 	
}"" 
}## Ù
ÉC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Queries\GetAllConsultantsQuery\GetAllConsultantsQuery.cs
	namespace 	
Application
 
. 
Features 
. 
ConsultantFeatures 1
.1 2
Queries2 9
.9 :"
GetAllConsultantsQuery: P
{ 
public 

class "
GetAllConsultantsQuery '
:( )
IRequest* 2
<2 3
IEnumerable3 >
<> ?

Consultant? I
>I J
>J K
{ 
}		 
}

 „
äC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Queries\GetAllConsultantsQuery\GetAllConsultantsQueryHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
ConsultantFeatures

 1
.

1 2
Queries

2 9
.

9 :"
GetAllConsultantsQuery

: P
{ 
public 

class )
GetAllConsultantsQueryHandler .
:/ 0
IRequestHandler1 @
<@ A"
GetAllConsultantsQueryA W
,W X
IEnumerableY d
<d e

Consultante o
>o p
>p q
{ 
private 
readonly !
IConsultantRepository .
_repository/ :
;: ;
public )
GetAllConsultantsQueryHandler ,
(, -!
IConsultantRepository- B

repositoryC M
)M N
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &

Consultant& 0
>0 1
>1 2
Handle3 9
(9 :"
GetAllConsultantsQuery: P
requestQ X
,X Y
CancellationTokenZ k
cancellationTokenl }
)} ~
{ 	
var 
entities 
= 
await  
_repository! ,
., -
GetAllAsync- 8
(8 9
)9 :
;: ;
return 
entities 
. 
Select "
(" #
entity# )
=>* ,
entity- 3
.3 4
HidePassword4 @
(@ A
)A B
)B C
;C D
} 	
} 
} ‚
ÉC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Queries\GetBestConsultantQuery\GetBestConsultantQuery.cs
	namespace 	
Application
 
. 
Features 
. 
ConsultantFeatures 1
.1 2
Queries2 9
.9 :"
GetBestConsultantQuery: P
{ 
public 

class "
GetBestConsultantQuery '
:' (
IRequest) 1
<1 2

Consultant2 <
>< =
{ 
public 
readonly 
string 
Skill $
;$ %
public		 
readonly		 
string		 
Location		 '
;		' (
public "
GetBestConsultantQuery %
(% &
string& ,
skill- 2
,2 3
string4 :
location; C
)C D
{ 	
Skill 
= 
skill 
; 
Location 
= 
location 
;  
} 	
} 
} Ω
äC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Queries\GetBestConsultantQuery\GetBestConsultantQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
ConsultantFeatures 1
.1 2
Queries2 9
.9 :"
GetBestConsultantQuery: P
{		 
public 

class )
GetBestConsultantQueryHandler .
:/ 0
IRequestHandler1 @
<@ A"
GetBestConsultantQueryA W
,W X

ConsultantY c
>c d
{ 
private 
readonly !
IConsultantRepository .
_repository/ :
;: ;
public )
GetBestConsultantQueryHandler ,
(, -!
IConsultantRepository- B

repositoryC M
)M N
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 

Consultant $
>$ %
Handle& ,
(, -"
GetBestConsultantQuery- C
requestD K
,K L
CancellationTokenM ^
cancellationToken_ p
)p q
{ 	
return 
await 
_repository $
.$ %
FindBestConsultant% 7
(7 8
request8 ?
)? @
.@ A
HidePasswordA M
(M N
)N O
;O P
} 	
} 
} π
ÉC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Queries\GetConsultantByIdQuery\GetConsultantByIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
ConsultantFeatures 1
.1 2
Queries2 9
.9 :"
GetConsultantByIdQuery: P
{ 
public 

class "
GetConsultantByIdQuery '
:' (
IRequest) 1
<1 2

Consultant2 <
>< =
{		 
[

 	
BsonId

	 
]

 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
readonly 
string 
Id !
;! "
public "
GetConsultantByIdQuery %
(% &
string& ,
id- /
)/ 0
{ 	
Id 
= 
id 
; 
} 	
} 
} È
äC:\Fac\SysopSquadAccounts\Accounts\Application\Features\ConsultantFeatures\Queries\GetConsultantByIdQuery\GetConsultantByIdQueryHandler.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 
ConsultantFeatures		 1
.		1 2
Queries		2 9
.		9 :"
GetConsultantByIdQuery		: P
{

 
public 

class )
GetConsultantByIdQueryHandler .
:. /
IRequestHandler0 ?
<? @"
GetConsultantByIdQuery@ V
,V W

ConsultantX b
>b c
{ 
private 
readonly !
IConsultantRepository .
_repository/ :
;: ;
public )
GetConsultantByIdQueryHandler ,
(, -!
IConsultantRepository- B

repositoryC M
)M N
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 

Consultant $
>$ %
Handle& ,
(, -"
GetConsultantByIdQuery- C
requestD K
,K L
CancellationTokenM ^
cancellationToken_ p
)p q
{ 	
var 
entity 
= 
await 
_repository *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
Id@ B
)B C
;C D
if 
( 
entity 
== 
null 
) 
throw 
new 
ArgumentException +
(+ ,
$str, C
,C D
nameofE K
(K L
requestL S
)S T
)T U
;U V
return 
entity 
. 
HidePassword &
(& '
)' (
;( )
} 	
} 
} £
|C:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Commands\DeleteUserByIdCommand\DeleteUserByIdCommand.cs
	namespace 	
Application
 
. 
Features 
. 
UserFeatures +
.+ ,
Commands, 4
.4 5!
DeleteUserByIdCommand5 J
{ 
public 

class !
DeleteUserByIdCommand &
:' (
IRequest) 1
<1 2
bool2 6
>6 7
{ 
[		 	
BsonId			 
]		 
[

 	
BsonRepresentation

	 
(

 
BsonType

 $
.

$ %
ObjectId

% -
)

- .
]

. /
public 
readonly 
string 
Id !
;! "
public !
DeleteUserByIdCommand $
($ %
string% +
id, .
). /
{ 	
Id 
= 
id 
; 
} 	
} 
} Â
ÉC:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Commands\DeleteUserByIdCommand\DeleteUserByIdCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
UserFeatures +
.+ ,
Commands, 4
.4 5!
DeleteUserByIdCommand5 J
{ 
public 

class (
DeleteUserByIdCommandHandler -
:- .
IRequestHandler/ >
<> ?!
DeleteUserByIdCommand? T
,T U
boolV Z
>Z [
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
public (
DeleteUserByIdCommandHandler +
(+ ,
IUserRepository, ;

repository< F
)F G
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& '!
DeleteUserByIdCommand' <
request= D
,D E
CancellationTokenF W
cancellationTokenX i
)i j
{ 	
return 
await 
_repository $
.$ %
DeleteAsync% 0
(0 1
request1 8
.8 9
Id9 ;
); <
;< =
} 	
} 
} •

xC:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Commands\RegisterUserCommand\RegisterUserCommand.cs
	namespace 	
Application
 
. 
Features 
. 
UserFeatures +
.+ ,
Commands, 4
.4 5
RegisterUserCommand5 H
{ 
public 

class 
RegisterUserCommand $
:% &
IRequest' /
</ 0
User0 4
>4 5
{ 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Type		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Location

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ä
C:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Commands\RegisterUserCommand\RegisterUserCommandHandler.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 
UserFeatures		 +
.		+ ,
Commands		, 4
.		4 5
RegisterUserCommand		5 H
{

 
public 

class &
RegisterUserCommandHandler +
:, -
IRequestHandler. =
<= >
RegisterUserCommand> Q
,Q R
UserS W
>W X
{ 
private 
readonly 
IUserRepository (
_repository) 4
;4 5
private 
readonly 
IMapper  
_mapper! (
;( )
public &
RegisterUserCommandHandler )
() *
IUserRepository* 9

repository: D
,D E
IMapperF M
mapperN T
)T U
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
User 
> 
Handle  &
(& '
RegisterUserCommand' :
request; B
,B C
CancellationTokenD U
cancellationTokenV g
)g h
{ 	
var 
user 
= 
_mapper 
. 
Map "
<" #
User# '
>' (
(( )
request) 0
)0 1
;1 2
return 
await 
_repository $
.$ %
CreateAsync% 0
(0 1
user1 5
,5 6
request7 >
.> ?
Password? G
)G H
.H I
HidePasswordI U
(U V
)V W
;W X
} 	
} 
}   ¡
|C:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Commands\UpdateUserByIdCommand\UpdateUserByIdCommand.cs
	namespace 	
Application
 
. 
Features 
. 
UserFeatures +
.+ ,
Commands, 4
.4 5!
UpdateUserByIdCommand5 J
{ 
public		 

class		 !
UpdateUserByIdCommand		 &
:		' (
IRequest		) 1
<		1 2
User		2 6
>		6 7
{

 
[ 	
BsonId	 
] 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< 
string 
> 
	TicketsId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ≠
ÉC:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Commands\UpdateUserByIdCommand\UpdateUserByIdCommandHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
UserFeatures

 +
.

+ ,
Commands

, 4
.

4 5!
UpdateUserByIdCommand

5 J
{ 
public 

class (
UpdateUserByIdCommandHandler -
:. /
IRequestHandler0 ?
<? @!
UpdateUserByIdCommand@ U
,U V
UserW [
>[ \
{ 
private 
readonly 
IUserRepository (
_repository) 4
;4 5
private 
readonly 
IMapper  
_mapper! (
;( )
public (
UpdateUserByIdCommandHandler +
(+ ,
IUserRepository, ;

repository< F
,F G
IMapperH O
mapperP V
)V W
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
User 
> 
Handle  &
(& '!
UpdateUserByIdCommand' <
request= D
,D E
CancellationTokenF W
cancellationTokenX i
)i j
{ 	
var 
newUser 
= 
_mapper !
.! "
Map" %
<% &
User& *
>* +
(+ ,
request, 3
)3 4
;4 5
if 
( 
! 
string 
. 
IsNullOrWhiteSpace *
(* +
request+ 2
.2 3
Password3 ;
); <
)< =
{ 
Password 
. 
CreatePasswordHash +
(+ ,
request, 3
.3 4
Password4 <
,< =
out> A
byteB F
[F G
]G H
passwordHashI U
,U V
outW Z
byte[ _
[_ `
]` a
passwordSaltb n
)n o
;o p
newUser 
. 
PasswordHash $
=% &
passwordHash' 3
;3 4
newUser 
. 
PasswordSalt $
=% &
passwordSalt' 3
;3 4
} 
return   
await   
_repository   $
.  $ %

UpdateUser  % /
(  / 0
newUser  0 7
)  7 8
.  8 9
HidePassword  9 E
(  E F
)  F G
;  G H
}!! 	
}"" 
}## …
qC:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Queries\GetAllUsersQuery\GetAllUsersQuery.cs
	namespace 	
Application
 
. 
Features 
. 
UserFeatures +
.+ ,
Queries, 3
.3 4
GetAllUsersQuery4 D
{ 
public 

class 
GetAllUsersQuery !
:" #
IRequest$ ,
<, -
IEnumerable- 8
<8 9
User9 =
>= >
>> ?
{ 
}		 
}

 î
xC:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Queries\GetAllUsersQuery\GetAllUsersQueryHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
UserFeatures

 +
.

+ ,
Queries

, 3
.

3 4
GetAllUsersQuery

4 D
{ 
public 

class #
GetAllUsersQueryHandler (
:) *
IRequestHandler+ :
<: ;
GetAllUsersQuery; K
,K L
IEnumerableM X
<X Y
UserY ]
>] ^
>^ _
{ 
private 
readonly 
IUserRepository (
_repository) 4
;4 5
public #
GetAllUsersQueryHandler &
(& '
IUserRepository' 6

repository7 A
)A B
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
User& *
>* +
>+ ,
Handle- 3
(3 4
GetAllUsersQuery4 D
requestE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
var 
entities 
= 
await  
_repository! ,
., -
GetAllAsync- 8
(8 9
)9 :
;: ;
return 
entities 
. 
Select "
(" #
entity# )
=>* ,
entity- 3
.3 4
HidePassword4 @
(@ A
)A B
)B C
;C D
} 	
} 
} à
qC:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Queries\GetUserByIdQuery\GetUserByIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
UserFeatures +
.+ ,
Queries, 3
.3 4
GetUserByIdQuery4 D
{ 
public 

class 
GetUserByIdQuery !
:! "
IRequest# +
<+ ,
User, 0
>0 1
{		 
[

 	
BsonId

	 
]

 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
readonly 
string 
Id !
;! "
public 
GetUserByIdQuery 
(  
string  &
id' )
)) *
{ 	
Id 
= 
id 
; 
} 	
} 
} ö
xC:\Fac\SysopSquadAccounts\Accounts\Application\Features\UserFeatures\Queries\GetUserByIdQuery\GetUserByIdQueryHandler.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 
UserFeatures		 +
.		+ ,
Queries		, 3
.		3 4
GetUserByIdQuery		4 D
{

 
public 

class #
GetUserByIdQueryHandler (
:( )
IRequestHandler* 9
<9 :
GetUserByIdQuery: J
,J K
UserL P
>P Q
{ 
private 
readonly 
IUserRepository (
_repository) 4
;4 5
public #
GetUserByIdQueryHandler &
(& '
IUserRepository' 6

repository7 A
)A B
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
User 
> 
Handle  &
(& '
GetUserByIdQuery' 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 	
var 
entity 
= 
await 
_repository *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
Id@ B
)B C
;C D
if 
( 
entity 
== 
null 
) 
throw 
new 
ArgumentException +
(+ ,
$str, =
,= >
nameof? E
(E F
requestF M
)M N
)N O
;O P
return 
entity 
. 
HidePassword &
(& '
)' (
;( )
} 	
} 
} Å

KC:\Fac\SysopSquadAccounts\Accounts\Application\Helpers\AutoMapperProfile.cs
	namespace		 	
Application		
 
.		 
Helpers		 
{

 
public 

class 
AutoMapperProfile "
:# $
Profile% ,
{ 
public 
AutoMapperProfile  
(  !
)! "
{ 	
	CreateMap 
< 
RegisterUserCommand )
,) *
User+ /
>/ 0
(0 1
)1 2
;2 3
	CreateMap 
< !
UpdateUserByIdCommand +
,+ ,
User- 1
>1 2
(2 3
)3 4
;4 5
	CreateMap 
< %
RegisterConsultantCommand /
,/ 0

Consultant1 ;
>; <
(< =
)= >
;> ?
	CreateMap 
< '
UpdateConsultantByIdCommand 1
,1 2

Consultant3 =
>= >
(> ?
)? @
;@ A
	CreateMap 
< 

BaseEntity  
,  !
ResponseEntity" 0
>0 1
(1 2
)2 3
;3 4
} 	
} 
} ù
JC:\Fac\SysopSquadAccounts\Accounts\Application\Helpers\ExtensionMethods.cs
	namespace 	
Application
 
. 
Helpers 
{ 
internal 
static 
class 
ExtensionMethods *
{ 
internal 
static 
TEntity 
HidePassword  ,
<, -
TEntity- 4
>4 5
(5 6
this6 :
TEntity; B
entityC I
)I J
whereK P
TEntityQ X
:Y Z

BaseEntity[ e
{		 	
entity

 
.

 
PasswordHash

 
=

  !
null

" &
;

& '
entity 
. 
PasswordSalt 
=  !
null" &
;& '
return 
entity 
; 
} 	
internal 
static 
Task 
< 
TEntity $
>$ %
HidePassword& 2
<2 3
TEntity3 :
>: ;
(; <
this< @
TaskA E
<E F
TEntityF M
>M N
entityO U
)U V
whereW \
TEntity] d
:e f

BaseEntityg q
{ 	
entity 
. 
Result 
. 
PasswordHash &
=' (
null) -
;- .
entity 
. 
Result 
. 
PasswordSalt &
=' (
null) -
;- .
return 
entity 
; 
} 	
} 
} ˙
FC:\Fac\SysopSquadAccounts\Accounts\Application\Helpers\UpdateHelper.cs
	namespace 	
Application
 
. 
Helpers 
{ 
public 

static 
class 
UpdateHelper $
{ 
public 
static 
bool 
	CheckNull #
(# $
string$ *
	parameter+ 4
)4 5
{ 	
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
	parameter& /
)/ 0
)0 1
return2 8
true9 =
;= >
return 
false 
; 
}		 	
}

 
} —
UC:\Fac\SysopSquadAccounts\Accounts\Application\Interfaces\IAccountDatabaseSettings.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface $
IAccountDatabaseSettings -
{ 
string 
ConnectionString 
{  !
get" %
;% &
set' *
;* +
}, -
string 
DatabaseName 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Ì
OC:\Fac\SysopSquadAccounts\Accounts\Application\Interfaces\IAccountRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IAccountRepository '
{ 
Task 
< 
TEntity 
> 
GetByEmailAsync %
<% &
TEntity& -
>- .
(. /
string/ 5
email6 ;
); <
where= B
TEntityC J
:K L

BaseEntityM W
;W X
ResponseEntity		 
Login		 
(		 
ResponseEntity		 +
entity		, 2
)		2 3
;		3 4
}

 
} ˙
RC:\Fac\SysopSquadAccounts\Accounts\Application\Interfaces\IApplicationDbContext.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface !
IApplicationDbContext *
{ 
MongoClient 
Client 
{ 
get  
;  !
set" %
;% &
}' (
IMongoCollection 
< 
T 
> 
GetCollection )
<) *
T* +
>+ ,
(, -
)- .
;. /
}		 
}

 ú
RC:\Fac\SysopSquadAccounts\Accounts\Application\Interfaces\IConsultantRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface !
IConsultantRepository *
:+ ,
IRepository- 8
<8 9

Consultant9 C
>C D
{ 
Task		 
<		 

Consultant		 
>		 
UpdateConsultant		 )
(		) *

Consultant		* 4

consultant		5 ?
)		? @
;		@ A
Task

 
<

 

Consultant

 
>

 
FindBestConsultant

 +
(

+ ,"
GetBestConsultantQuery

, B
query

C H
)

H I
;

I J
} 
} ê
HC:\Fac\SysopSquadAccounts\Accounts\Application\Interfaces\IRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IRepository  
<  !
TEntity! (
>( )
where* /
TEntity0 7
:8 9

BaseEntity: D
{ 
Task		 
<		 
IEnumerable		 
<		 
TEntity		  
>		  !
>		! "
GetAllAsync		# .
(		. /
)		/ 0
;		0 1
Task

 
<

 
TEntity

 
>

 
GetByIdAsync

 "
(

" #
string

# )
id

* ,
)

, -
;

- .
Task 
< 
TEntity 
> 
CreateAsync !
(! "
TEntity" )
entity* 0
,0 1
string2 8
password9 A
)A B
;B C
Task 
< 
TEntity 
> 
UpdateAsync !
(! "
TEntity" )
entity* 0
)0 1
;1 2
Task 
< 
bool 
> 
DeleteAsync 
( 
string %
id& (
)( )
;) *
Task 
< 
bool 
> 
CheckUniqueEmail #
(# $
string$ *
email+ 0
)0 1
;1 2
} 
} ¶
LC:\Fac\SysopSquadAccounts\Accounts\Application\Interfaces\IUserRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IUserRepository $
:% &
IRepository' 2
<2 3
User3 7
>7 8
{ 
Task 
< 
User 
> 

UpdateUser 
( 
User "
user# '
)' (
;( )
}		 
}

 