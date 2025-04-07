import React from 'react'
import {Route, Routes} from 'react-router-dom'
import MovieList from './components/MovieList'
import MovieDetail from './components/MovieDetail'
import Home from './components/Home'

const App2 = () => {
  return (
    <div className='App'>
      <Routes>
        <Route path='/' element={<Home></Home>}></Route>
        <Route path='/movies' element={<MovieList></MovieList>}></Route>
        <Route path='/movie/:id' element={<MovieDetail></MovieDetail>}></Route>
      </Routes>
    </div>
  )
}

export default App2