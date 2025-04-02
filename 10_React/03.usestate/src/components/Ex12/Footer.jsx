import React, { useContext, useRef } from 'react';
import { ThemeContext } from '../../context/Ex12ThemeContext';

const Footer = () => {
  // Context 안에 있는 값 가져오기 -> isDark, setIsDark
  const {isDark, setIsDark} = useContext(ThemeContext);
  const footerRef = useRef();
  const buttonRef = useRef();
  
  const toggleTheme = (e) => {
    // setIsDark(!isDark)
    setIsDark(isDark ? 
      (footerRef.current.style.backgroundColor = 'white', buttonRef.current.innerText = "Dark Mode", false) :
      (footerRef.current.style.backgroundColor = 'black', buttonRef.current.innerText = "Light Mode", true)
    )

  }
  return (
    // 버튼과 색상을 삼항연산자로 처리
    // footer의 style 속성 -> 배경색상을 삼항연산자로 처리
    // button의 내용도 삼항연산자로 처리
    // toggleTheme 함수 안에서 isDark 값을 계속 변경하기
    <div>
      {/* <footer className='footer' style={{backgroundColor : isDark ? 'black' : 'white'}}>
        <button className='button' onClick={toggleTheme}>{isDark ? 'Light Mode' : 'Dark Mode'}</button> */}
      <footer ref={footerRef} className='footer'>
        <button ref={buttonRef} className='button' onClick={toggleTheme}>Dark Mode</button>
      </footer>
    </div>
  )
}

export default Footer