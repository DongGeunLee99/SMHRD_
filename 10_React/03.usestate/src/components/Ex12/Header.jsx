import React, { useContext, useRef } from 'react'
import { ThemeContext } from '../../context/Ex12ThemeContext'

const Header = () => {
  const {isDark} = useContext(ThemeContext);
  const hedRef = useRef();
  const h1Ref = useRef();

  if (isDark === true){
    h1Ref.current.style.color = 'white'
    hedRef.current.style.backgroundColor = 'black'
  } else{
    h1Ref.current.style.color = 'black'
    hedRef.current.style.backgroundColor = 'white'
  }

  return (
    // Content 컴포넌트랑 동일하게 진행하기
    // header 스타일 속성을 동일하게 변경하기
    <div>
      <header className='header' ref={hedRef}>
        <h1 ref={h1Ref}>수민쌤반 화이팅!</h1>

      </header>
    </div>
  )
}

export default Header