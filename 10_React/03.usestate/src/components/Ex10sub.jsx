import React from 'react'

const Ex10sub = ({ title, changeData }) => {
    return (
        <div>
            <p>1-2. 하위 컴포넌트에서 입력받은 값은 {title} 입니다.</p>
            <p>2-1. 하위에서 입력 : <input type='text' onChange={changeData}></input></p>
        </div>
    )
}

export default Ex10sub