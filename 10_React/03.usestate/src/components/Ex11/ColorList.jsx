import React, {useContext} from 'react'
import { ColorContext } from '../../context/Ex11ColorContext'

const ColorResult = () => {
  // context를 사용하겠다.
  //  -> 상위 컴포넌트 안에 있던 value값을 가져오기

  // 이벤트 객체를 사용해서 스타일 속성의 배경색을 변경
  // 배경 색상을 setChoiceColor 함수 안에 값 넣기
  
  const ck = (e) => {
    // console.log("in")
    console.log(e.target.style.backgroundColor)
    setChoiceColor(e.target.style.backgroundColor)
  }
  const {setChoiceColor} = useContext(ColorContext);
  let color = ['red', 'orange', 'yellow', 'green', 'blue']
  return (
    <div style={{display:'flex'}}>
      {/* map함수를 통해서 기존 배열안에 있는 색상들을 div태그로 제작 */}
      {color.map((item)=>(
        <div onClick={ck} key={item} style={{backgroundColor:item, width:'100px', height:'100px', }}></div>
      ))}
    </div>
  )
}

export default ColorResult