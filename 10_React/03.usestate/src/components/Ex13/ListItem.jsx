import React, { useContext } from 'react'
import { TodoContext } from '../../context/Ex13TodoContext'


// props로 상위 컴포넌트인 List에서 map함수를 통해 전달받은 데이터를
// 비구조화 할당{}을 통해 속성을 변수처럼 사용한다.
const ListItem = ({ todo }) => {
    const { handleTodoDelete, handleTodoToggle } = useContext(TodoContext);

    return (
        <>
            <tr>
                <td>
                    <input type="checkbox" checked={todo.completed} onChange={() => { handleTodoToggle(todo.key) }}></input>
                </td>
                <td>
                    {/* label -> 디자인 용도 */}
                    <label style={{ textDecoration: todo.completed ? 'line-through' : 'none' }}>
                        <span className='todo-text'>
                            {todo.text}
                        </span>
                    </label>
                </td>
                <td>
                    <button onClick={() => { handleTodoDelete(todo.key) }}>Delete</button>
                </td>
            </tr>
        </>
    )
}

export default ListItem