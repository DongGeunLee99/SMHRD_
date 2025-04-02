import React, {useContext} from 'react'
import { ColorContext } from '../../context/Ex11ColorContext'

const ColorResult = () => {

  const {choiceColor} = useContext(ColorContext);
  return (
    <div>
      {/* 너비, 높이 100px로 세팅, 배경색상만 변경 */}
      <div style={{width:'100px', height:'100px', backgroundColor: choiceColor}}></div>
    </div>
  )
}

export default ColorResult