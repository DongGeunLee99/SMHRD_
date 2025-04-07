import React from 'react'
import { useParams, useSearchParams } from 'react-router-dom'


const Product = () => {
  /*
  useParams
  - URL의 파라미터 정보를 가져올 수 있다.
  - 물품의 고유한 값을 설정/출력을 하는데 사용
  - useParams는 하나밖에 사용할 수 없다.
      즉 그 컴포넌트가 가지고 있는 고유한 성질을 담아내는데 사용
  - 사용처 : 상품 고유번호, 회원 고유번호, 학번/사번
  
  useSearchParams
  url 뒤에 ?속성=값&속성=값....
  라우터 사용시 QueryString 정보를 가져와서 관리하고 싶을때 사용
  들어온 경로 파악 / 인기글 / 신규글 / 카테고리화
  */
  let { num } = useParams()

  // 변수 이름 고정, 구조는 state와 유사하다
  const [query, setQuery] = useSearchParams()
  console.log('인기글인지 확인', query.get('best'))
  return (
    <div>
      {num}번째 게시물 입니다.
    </div>
  )
}

export default Product