import React, { useState } from 'react'
import { TodoContext } from '../context/Ex13TodoContext'
import '../style/Ex13.css'

import List from '../components/Ex13/List'
import AddItem from '../components/Ex13/AddItem'

const Ex13 = () => {
  const [todos, setTodos] = useState([
    // key는 인덱스를 대체하기 위함 (고정데이터)
    { text: '물마시기', completed: false, key: 1 }

  ]);

  // 할 일 추가하기, State생성 (새로운 데이터)
  const [newTodo, setNewTodo] = useState('');

  // 새로운 newTodo 데이터를 todos 배열에 추가하는 함수
  const handleNewTodoAddition = () => {
    // console.log("newTodo", newTodo);
    // newTodo 추가하기
    setTodos([
      // ...todos : 기존에 배열이 있다면 유지를 시킨 상태에서 새로운 데이터를 추가 (스프레드 문법)
      ...todos,
      {
        text: newTodo,
        completed: false,
        key: todos.length > 0 ? todos[todos.length - 1].key + 1 : 1
      }
    ]);
    setNewTodo('');
  }

  // todolist를 삭제할 함수 만들기
  const handleTodoDelete = (delKey) => {
    // console.log("delkey", delkey);
    // filter 함수를 사용해서 데이터를 제거
    const filterList = todos.filter((item) => (item.key !== delKey))
    setTodos(filterList)
  }

  // 완료한 일에 체크 혹은 반대의 경우 체크 해제하는 함수 생성
  const handleTodoToggle = (ckKey) => {
    console.log("ckKey", ckKey);

    // find 배열 함수
    const targetTodo = todos.find((item) => (item.key === ckKey))
    if (targetTodo) {
      targetTodo.completed = !targetTodo.completed
      setTodos([...todos])
    }
  }

  return (
    <TodoContext.Provider value={{
      todos, newTodo, handleNewTodoAddition,
      setNewTodo, handleTodoDelete, handleTodoToggle
    }}>
      <div className='todo-container'>
        <h1>😊 TODO LIST 😊</h1>
        <List></List>
        <AddItem></AddItem>
      </div>
    </TodoContext.Provider>
  )
}

export default Ex13