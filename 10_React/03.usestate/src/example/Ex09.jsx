import React, {useRef} from 'react'

const Ex09 = () => {
  // 화면에 입력 공간 만들기 -> input
  const inputRef = useRef();

  const handleButtonClick = () => {
    alert(inputRef.current.value);
    inputRef.current.value='';
  }

  return (
    <div>
      <h1>useRef Example</h1>
      <input type='text' placeholder='Enter something' ref={inputRef}></input>
      <button onClick={handleButtonClick}>show input</button>
    </div>
  )
}

export default Ex09