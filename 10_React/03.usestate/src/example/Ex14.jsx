import React, {useState, useEffect} from 'react'

const Ex14 = () => {
  console.log("1. constructor를 대체하는 함수 초기화")
  const [count, setCount] = useState(1);
  const [name, setName] = useState('');

  const handleCountUpdate = () => {
    setCount(count+1);
  }
  const handleInputChange = (e) => {
    setName(e.target.value);
  }

  // useEffect -> 렌더링이 될때마다 실행
  useEffect(()=>{
    console.log('렌더링~');
    // 함수, API CALL 무거운 작업이 실행되면 비효율적
  })
  
  // useEffect -> 화면에 첫 렌더링 될 때만 실행
  // [] -> 의존성 배열
  useEffect(()=>{
    console.log('마운팅~');
  }, [])
  
  // useEffect -> 화면에 첫 렌더링
  //       + 의존성 배열안에 값이 바뀔 때 실행
  // 의존성 배열 안에 들어가는 값은 복수 처리 가능
  useEffect(()=>{
    console.log('카운트 렌더링~');
  }, [count])
  

  return (
    <div>
      {console.log("2. rander를 대체하는 return")}
      <button onClick={handleCountUpdate}>Update</button>
      <span>count : {count}</span>
      <br />
      <input type="text" value={name} onChange={handleInputChange}></input>
      <span>name : {name}</span>
    </div>
  )
}

export default Ex14