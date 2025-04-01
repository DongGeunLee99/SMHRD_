import React, {useState} from 'react'


const Ex03 = () => {
  const [ranNum, setRanNum] = useState(0)
  const [inputNum, setInputNum] = useState(0)

  // 랜덤한 숫자 만드는 방법
  const btnCk = (e) =>{
    var ran = parseInt(Math.random()*3 +1);
    var num = parseInt(e.target.innerText);

    setRanNum(ran);
    setInputNum(num);
  }
  return (
    <div>
      <button onClick={btnCk}>1</button>
      <button onClick={btnCk}>2</button>
      <button onClick={btnCk}>3</button>

      <div>
        내가 입력한 숫자 : {inputNum}
        <br/>
        랜덤한 숫자 : {ranNum}
        <br/>
        {ranNum==inputNum ? "정답입니다.":"오답입니다."}

        {/* 삼항연산자를 통해서 결과를 도출 
        실행문장 1 : '정답입니다.
        실행문장 2 : '오답입니다.
        */}
      </div>
    </div>
  )
}

export default Ex03