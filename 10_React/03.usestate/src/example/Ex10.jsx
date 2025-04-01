import React, { useState } from 'react'
import Ex10sub from '../components/Ex10sub'

const Ex10 = () => {
  const [inputTitle, setInputTitle] = useState("");
  const [rcTitle, setrcTitle] = useState("");
  const changeData = (e) => {
    setrcTitle(e.target.value);
  }

  return (
    <div>
      <h2>컴포넌트 끼리 값 전달을 해보자</h2>
      <p>
        1-1. 상위에서 입력 :
        <input type='text' onChange={(e) => { setInputTitle(e.target.value) }}></input>
      </p>
      <Ex10sub title={inputTitle} changeData={changeData}></Ex10sub>
      <span>2-2. 상위에서 입력 받은 값은 {rcTitle} 입니다.</span>
    </div>
  )
}

export default Ex10