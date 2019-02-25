# Rsupport_homework
Rsupport 과제 저장소 입니다.

Rsupport_homework
Rsupport 과제 저장소 입니다.

개발 환경 -Java 8 
-Springboot 
-Gradle 
-JPA 
-Hibernate 
-JSP 

구현 기능 A. 텍스트로된 공지 추가 기능 
B. 공지 수정/삭제 기능 
C. 공지 목록 조회 기능 
D. 제목, 작성일, 작성자, 최종 수정일, 내용 조회 기능 
D. 목록의 페이징 기능 

실행 방법

gradle 설치 다운로드: Gradle 1.8 Download - 09/24 배포 
압축해제 및 설치 
unzip gradle-1.8-all.zip 
mv gradle-1.8 /usr/local/gradle/ 
환경설정 
export GRADLE_HOME=/usr/local/gradle/gradle-1.8 
export PATH=$PATH:$GRADLE_HOME/bin 
확인 
gradle -v 

import git clone https://github.com/Andrewkim92/Rsupport_homework.git 
cd Rsupport_homework 
cd jpaPro 
./gradle bootRun or gradle bootRun 

http://localhost:8080/ 접속 
