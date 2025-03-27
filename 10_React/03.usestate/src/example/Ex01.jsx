// rafce -> 함수형 컴포넌트를 자동 생성해주는 입력어
// useState -> 변수 대신 리액트에서 사용하는 상태 변화 감지 기능

import React,{useState} from 'react'


const Ex01 = () => {
    // useState  사용
    const [num2, setNum2] = useState(0)
    // num2는 useState 변수
    // setNum2는 useState 변수를 변화시켜주는 함수
    // useState(0) -> num2의 초기값

    const ck = (e)=>{
        // 이벤트 객체
        // onClick -> 이벤트 타입은 반드시 카멜 케이스로 표기
        // onClick =
        console.log(e.target.innerText)
    }

    const increase = () =>{
        setNum2(num2 + 1)
    }
    const decrease = () =>{
        if (num2 > 0) {
            setNum2(num2 - 1)
        }
    }
  return (
    <div>
        <div>
            <p>{num2}</p>
            <button onClick={increase}>+1</button>
            <button onClick={decrease}>-1</button>
            <br></br>
            <br></br>
            <button onClick={()=>{alert('화면 확인')}}>확인</button>
        </div>
    </div>
  )
}

export default Ex01