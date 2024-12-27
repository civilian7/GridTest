# GridTest

델파이의 표준 컴포넌트인 TStringGrid와 서드파티 컴포넌트인 TVirtualStringTree, TcxVirtualTreeList의
속도비교를 위한 샘플.

1만, 10만, 100만건 테스트 결과

1등 : TcxVirtualTreeList 
2등 : TVirtualStringTree
3등 : TStringGrid

1등과 2등은 미세한 차이만 있을 뿐이므로 DevExpress 라이선스가 있다면 TcxVortualTreeList를 사용하고
아니면 TVirtualStringTree를 추천한다.
