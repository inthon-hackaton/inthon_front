<div align="center">
<h2>[2024] InThon 💻</h2>
다양한 사람들과 함께 협업하여 그림을 완성해 보세요!
</div>

## Index
  - [서비스 소개](#서비스-소개) 
  - [솔루션 소개](#솔루션-소개)
  - [License](#license)
  - [팀원소개](#팀원-소개)
<!--  Other options to write Readme
  - [Deployment](#deployment)
  - [Used or Referenced Projects](Used-or-Referenced-Projects)
-->
## 서비스 소개
<!--Wirte one paragraph of project description -->  
### 배경

- 현대 사회에서 늘어나는 스트레스 지수에 비해 자신에게 집중하는 시간이 부족함
- 불안, 우울감, 불면증 등 심리적 어려움을 겪으면서도 대면 상담에 대한 부담감으로 인해 심리 상담을 쉽게 받지 못하는 경우가 많음

### 해결 방안 제안
- 어플을 활용하여 대면 상담의 부담을 줄이고, 참여형 미술치료를 제공
- 다양한 사람과의 협업을 통해서 미술 작품을 만들어서 자신감을 높이고 스트레스를 줄여줌
- 창의적인 작업을 하면서 '몰입' 상태에 들어가게 되고 스트레스를 잊고 스스로에게 집중하는 시간을 가지도록 함

## 솔루션 소개
STEP 1) 온보딩 & 로그인/회원가입

STEP 2) 메인 화면

STEP 3) 작품 확인

STEP 4) 마이 페이지

## 기능적 구현
![image](https://github.com/user-attachments/assets/d37f103b-9902-4cf3-9e92-6c0606ecbb5c)

## 팀원 소개

| 팀원 | 역할 | 소개 |
|------|------|------|
| ![민준](https://example.com/photo2.png) | **김민준** | 모바일 앱 개발 |
| ![다영](https://example.com/photo1.png) | **최다영** | 모바일 앱 개발 |
| ![의찬](https://example.com/photo3.png) | **박의찬** | 백엔드 개발 |
| ![준희](https://example.com/photo3.png) | **한준희** | 백엔드 개발 |




## 

  - Front-end
    - Point
      - 시멘틱 Web 구성 신경 쓰기. (center, main, header, footer)
      - Flex 남발 금지. (적재적소에만 사용하기. 반응형에 알맞는 곳)
      - class name 작성 시, 띄어쓰기 '-'로 사용. `<div class='logo-item'></div>`
    - templates
      - VS Code - settings - format on save 켜서 코드 정리 자동화
      - 페이지 최상단에 주석으로 페이지 간략 설명, 작성일 표기
      - 백엔드가 봤을 때 필요한 기능들을 단 번에 알 수 있도록 하기
      - 한 문서에서 동일한 ID 2번 이상 사용하지 않음.
      - CSS 작성시 base.html 의 스타일을 확인한 뒤 중복된 선택자 없이 작성
  - Back-end
    - Model Class
      - 모델 클래스의 첫 글자는 대문자로 한다.
    - App Folder
      - APP 폴더 이름은 첫 글자는 소문자로 한다.
      - APP 폴더 이름은 기능이 복수 일 경우, 's'를 붙힌다.
      - 예) comments, users
    - View Function
      - 함수(메소드)에 낙타 표기법 적용
        - 예) getName() ...
      - 변수(필드)에 팟홀 표기법 적용
        - 예) MyFirstVariable -> my_first_variable
    - Templates
      - templates 폴더는 APP 폴더 별로 나누어 관리한다.
    - Static
      - 각 App 폴더 static 폴더를 생성하여 저장한다.
      - `python manage.py collectstatic` 을 통해 모든 static 파일을 모은다.
      - css
        - css를 담는 폴더 명이며, css 명은 html과 동일 시 한다.
      - js
        - js를 담는 폴더 명이며, js 명은 html과 동일 시 한다.
