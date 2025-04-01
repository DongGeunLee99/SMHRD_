import React, {useState, useRef} from 'react'

const Ex08 = () => {
  // useRef 두번째 사용처
  /*
  저장공간으로 사용
  useState는 state를 변경하게 되면 재 렌더링이 발생
  useRef는 재 랜더링 발생 X, 변수 안에 있는 값이 유지됨
  -> state가 변하게 되면 useRef 안에 있는 값도 같이 변경
  -> 값의 변경시 렌더링이 되지 않아야 할 데이터를 사용
  */

  const [count, setCount] = useState(0);
  const countRef = useRef(0);
  
  const increaseState = () => {
    setCount(count + 1);
  }
  const increaseRef = () => {
    console.log(countRef.current.innerText)
    countRef.current += 1;
  }

  return (
    // 화면에 출력하는 요소가 여러 개일 경우 꼭 부모 요소가 필요하다
    <div>
      <div>
        <p>State : {count}</p>
        <p>Ref : {countRef.current}</p>
        <button onClick={increaseState}>State up</button>
        <button onClick={increaseRef}>Ref up</button>
      </div>
    </div>
  )
}

export default Ex08