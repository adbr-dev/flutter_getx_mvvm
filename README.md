# flutter_getx_mvvm

[카카오 'Daum 검색 - 이미지 검색' API](https://developers.kakao.com/docs/latest/ko/daum-search/dev-guide#search-image)를 이용해 이미지 검색 앱을 만들었습니다.

- getx를 이용하여, 상태 관리, 네비게이션, DI 관리에 사용했습니다.
- [클린 아키텍처] 각 계층을 분리하여 의존성을 낮췄습니다.
- mvvm 디자인 패턴을 따라가도록 만들었습니다.


|  | Android | iOS |
| :---         |     :---:      |          ---: |
| search</br>(call API) | ![android_call](https://user-images.githubusercontent.com/51875059/218309601-7310fab1-821b-4e42-86cb-848da8c9a616.gif) | ![ios_call](https://user-images.githubusercontent.com/51875059/218310098-363f760c-d3b8-4a9b-84a8-95310299faf5.gif) |
| paging     | ![android_paging](https://user-images.githubusercontent.com/51875059/218309688-31c1da0f-c8c9-4052-b660-4ce4c6232320.gif)       | ![ios_paging](https://user-images.githubusercontent.com/51875059/218310731-c1d2e68e-9874-44a2-abdb-14e346179e63.gif)      |
| error     | ![android_err](https://user-images.githubusercontent.com/51875059/218309835-a0d9a778-9d9c-4c35-820c-11b1cac67597.gif)       | ![ios_err](https://user-images.githubusercontent.com/51875059/218310329-1de46dcd-c180-4620-9ae8-1c35f4dfbbe0.gif)      |

</br>

## 폴더 구조

```
/data
  /models
  /repositories
  /sources
/domain
  /repositories
  /usecases (생략)
/presentation
  /features
    /photo_detail
    /photos
  /utils
main.dart
```

</br>

## 기능
- Flutter Clean architecture </br> 
  : 3가지 모듈로 나누어 바라봅니다. `Data` - `Domain` - `App(Presentation)`
  - **Data**: Repositories, source(call API) `데이터 처리`
  - **Domain:** Repositories(interface), usecases, entities  `비지니스 로직`
  - **Presentation:** pages, state(model) ←→ presenter(controller) 

- [GetX](https://pub.dev/packages/get)
  - 상태 관리, 네비게이션, DI 관리에 사용
  - `debounce` Worker를 이용해 1분간 검색 타이핑이 멈출 경우에만 검색이 되도록 설정

- http api 통신

- 에러 핸들링

- 페이징 방식

- 네트워크 이미지 캐싱

- 테스트 코드

- Sliver Widgets
