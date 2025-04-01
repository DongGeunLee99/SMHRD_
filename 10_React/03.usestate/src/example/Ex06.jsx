import React from 'react'
import data from '../json/ex06data.json'
import Ex06Map from '../components/Ex06Map'

const Ex06 = () => {
  return (
    <div>
      <h1>Map 실습</h1>
      <div style={{display : 'flex'}}>
          {data.result.map((item)=>(
            // props로 하위 컴포넌트에 전달
            <Ex06Map key={item.title} item={item}></Ex06Map>
          ))}
      </div>
    </div>
  )
}

export default Ex06