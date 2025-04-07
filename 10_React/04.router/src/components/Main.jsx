import React from 'react'
import {Link, useNavigate} from 'react-router-dom'



const Main = () => {
  /*
  Link 컴포넌트
  웹 페이지에서 링크를 이동하는 방법 -> a태그
  a태그 사용 시 클릭을 했을 때, 새로운 페이지를 불러오기 때문에 SPA인 React와 적합도가 떨어진다
  브라우저 주소의 경로만 바꾸는 기능이 내장되어 있다
  필수 속성 : to='경로' => 외부 경로도 사용 가능

  useNavigate()
  페이지 이동을 도와주는 React Hook
  */

  const nav = useNavigate();

  let auth = true;


  return (
    <div>
      Main
      <br />
      <Link to={'/about'}>About 페이지로 이동</Link>
      <br />
      <Link to={'https://smhrd.or.kr/'}>스마트인재개발원 이동</Link>
      <br />
      <button onClick={()=>{auth ? nav('/mypage') : nav('/about') }}>마이페이지</button>
    </div>
  )
}

export default Main