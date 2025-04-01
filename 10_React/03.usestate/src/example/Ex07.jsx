import React, { useRef } from 'react'

const Ex07 = () => {
  // useRef : 화면의 특정 DOM(요소)를 선택 하고 싶을 때
  // => JS : getElementById, querySelector
  // React에서도 특정 DOM에 직접 접근해야할 일이 발생 => useRef (클릭 시, 사이즈 변경)

  const divRef = useRef()

  const changeSize = (size) => {
    divRef.current.style.width = size + 'px';
    divRef.current.style.height = size + 'px';
    console.log(divRef.current.style.width);
  }

  const ckBtn = (e) => {
    /*
    changeSize() 함수 생성
    함수가 호출이 될때 인자로 100, 200, 300이라는 값 넣기
    */
    if (e.target.innerText === '작게') {
      changeSize(100);
    } else if (e.target.innerText === '원본') {
      changeSize(200);
    } else {
      changeSize(300);
    }
  }

  // 스타일링 변수 만들기
  let divStyle = {
    backgroundColor: 'skyblue',
    width: '200px',
    height: '200px'
  }

  return (
    <div>
      <div>
        <button onClick={ckBtn}>작게</button>
        <button onClick={ckBtn}>원본</button>
        <button onClick={ckBtn}>크게</button>
      </div>

      {/* ref라는 속성 사용, 값은 변수 처리한 divRef에 적용 */}
      <div style={divStyle} ref={divRef}></div>
    </div>
  )
}

export default Ex07