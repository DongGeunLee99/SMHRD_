import React from 'react'

const Ex05 = () => {
  // Map 함수 사용 예제
  // 기존의 배열은 그냥 두고 그 안에 있는 데이터만 사용해서 새로운 배열을 반환
  let food = ['햄버거', '피자', '불고기'];

  let newFood = food.map((item) => (
    <button key={item}>{item}</button>
  ))
  
  let numList = [1, 2, 3, 4, 5];
  // 위의 배열데이터를 활용해서 화면에 2, 4, 6, 8, 10 텍스트가 들어간 버튼을 생성
  
    let num = numList.map((item) => (
      <button key={item}>{item*2}</button>
    ))
  
  return (
    <div>
      {newFood}
      <br/>
      {num}
    </div>
  )
}

export default Ex05