import React, { useContext } from 'react'
import { TodoContext } from '../../context/Ex13TodoContext'

const AddItem = () => {
    // 상위 컴포넌트에 있는 전역 데이터 가져오기
    const { newTodo, setNewTodo, handleNewTodoAddition } = useContext(TodoContext);
    return (
        <div>
            <input value={newTodo} type="text" onChange={(e) => {setNewTodo(e.target.value)}}></input>
            <button onClick={handleNewTodoAddition}>Add</button>
        </div>
    )
}

export default AddItem