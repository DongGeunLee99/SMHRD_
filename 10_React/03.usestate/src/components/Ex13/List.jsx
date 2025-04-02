import React, { useContext } from 'react'
import { TodoContext } from '../../context/Ex13TodoContext'
import ListItem from './ListItem'

const List = () => {
    const { todos } = useContext(TodoContext);
    // console.log(todos)
    return (
        <div>
            <table>
                <tbody>
                    {/* 할일 데이터(자료형 == 배열) -> map 함수를 통해 반복 
                        map함수를 사용해서 ListItem 컴포넌트로 전달하기 */}
                    {todos.map((item) => (<ListItem key={item.key} todo = {item}></ListItem>))}
                </tbody>
            </table>
        </div>
    )
}

export default List