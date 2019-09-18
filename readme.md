## 교재 : NCS 기반의 ORACLE (SQL&PL / SQL)

## SQL(Structured Query Language) 정의와 종류(DML, DDL, DCL, TCL)


 - SQL(Structured Query Language)은 관계형 데이터베이스에서 데이터 정의(DDL), 데이터 조작(DML), 데이터 제어(DCL)를 하기 위해 사용하는 언어다.

 - SQL의 최초 이름이 SEQUEL(Structured English QUEry Language)이었기 때문에 '시큐얼'로 읽는 경우도 있지만 표준은 SQL 이므로 '에스큐엘'로 읽는다.

 - SQL 문장은 단순 스크립트가 아니라 독립된 하나의 개발 언어이다.

 - 하지만, 일반적인 프로그래밍 언어와는 달리 SQL은 관계형 데이터베이스에 대한 전담 접속 용도로 사용되며 세미콜론(;)으로 분리되어 있는 SQL 문장 단위로 독립되어 있다.

 - 관계형 데이터베이스는 수학의 집합 논리에 입각한 것이므로, SQL도 데이터를 집합으로써 취급한다.

 - 이렇게 특정 데이터들의 집합에서 필요로 하는 데이터를 꺼내서 조회하고 새로운 데이터를 입력/수정/삭제하는 행위를 통해서 사용자는 데이터베이스와 대화하게 된다.

 - 그리고 SQL은 이러한 대화를 가능하도록 매개 역할을 한다. 결과적으로 SQL 문장을 배우는 것이 곧 관계형 데이터베이스를 배우는 기본 단계라고 할 수 있다.


## SQL 문장들의 종류

### 데이터 조작어(DML : Data Manipulation Language)

 - `SELECT` : 데이터베이스에 들어 있는 데이터를 조회하거나 검색하기 위한 명령어를 말하는 것으로 RETRIEVE 라고도 한다.

 - `INSERT, UPDATE, DELETE` :  데이터베이스의 테이블에 들어 있는 데이터에 변형을 가하는 종류의 명령어들을 말한다. 데이터 삽입, 수정, 삭제

### 데이터 정의어(DDL : Data Definition Language)

 - `CREATE, ALTER, DROP, RENAME, TRUNCATE` :  테이블과 같은 데이터 구조를 정의하는데 사용되는 명령어들로 그러한 구조를 생성하거나 변경하거나 삭제하거나 이름을 바꾸는 데이터 구조와 관련된 명령어들을 DDL이라고 부른다.

### 데이터 제어어(DCL : Data Control Language)

 - `GRANT, REVOKE` : 데이터베이스에 접근하고 객체들을 사용하도록 권한을 주고 회수하는 명령어를 DCL이라고 한다. 

### 트랜잭션 제어어(TCL :  Transaction Control Language)

 - `COMMIT, ROLLBACK, SAVEPOINT` : 논리적인 작업의 단위를 묶어서 DML에 의해 조작된 결과를 작업단위(트랜잭션) 별로 제어하는 명령어를 말한다. 

출처: https://hyeonstorage.tistory.com/289 
