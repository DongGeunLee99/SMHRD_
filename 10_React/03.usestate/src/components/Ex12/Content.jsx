import React, {useContext, useRef} from 'react'
import { ThemeContext } from '../../context/Ex12ThemeContext'

const Content = () => {
  // useContext 데이터 가져오기 -> Footer컴포넌트에 set함수를 통해서
  // state값을 계속 변경하고 있다 -> Content컴포넌트에서는 굳이 set함수를 사용할 필요가 없다
  // state만 가지고 오기
  const {isDark} = useContext(ThemeContext);
  const divRef = useRef();
  const h1Ref = useRef();

  if (isDark === true){
    divRef.current.style.backgroundColor = 'black'
    h1Ref.current.style.color = 'white'
  } else if (isDark === false){
    divRef.current.style.backgroundColor = 'white'
    h1Ref.current.style.color = 'black'
  }
  
  // (isDark ? 
  //   (divRef.current.style.backgroundColor = 'black', h1Ref.current.style.color = 'white') :
  //   (divRef.current.style.backgroundColor = 'white', h1Ref.current.style.color = 'black')
  // )

  return (
    // div 태그의 style 속성 변경
    // 클릭했을 때 배경 검정, 글씨 흰색
    <div ref={divRef} className='content'>
      <h1 ref={h1Ref}>복습 하기, 기획 발표 준비</h1>
    </div>
  )
}

export default Content