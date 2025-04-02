import React, { useState } from 'react'
import ColorList from '../components/Ex11/ColorList'
import ColorResult from '../components/Ex11/ColorResult'
import { ColorContext } from '../context/Ex11ColorContext'


const Ex11 = () => {
  // Context : 리액트 컴포넌트 간에 값을 전역적으로 공유할 수 있게 하는 기능
  // props로만 데이터를 전달하게 되면 파일 구조가 깊어질 경우 불편하고 실수가 발생

  // Context 파일을 먼저 만들기 -> Ex11ColorContext.js
  // createContext import하기 -> export하기

  // useState 생성
  const [choiceColor, setChoiceColor] = useState('red');

  return (
    <ColorContext.Provider value={{choiceColor, setChoiceColor}}>
      <div>
        <h1>색상 변경하기</h1>
        <ColorList></ColorList>
        <br />
        <hr />
        <br />
        <h1>선택한 색상</h1>
        <ColorResult></ColorResult>

      </div>
    </ColorContext.Provider>
  )
}

export default Ex11