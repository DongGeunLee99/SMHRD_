import React from 'react'
import { useNavigate } from 'react-router-dom'
import img from '../assets/netflix.jpg'
import '../style/Home.css'

const Home = () => {
  const nav = useNavigate();



  
  return (
    <div className='home' style={{backgroundImage : `url(${img})`}}>
      <div className='home-content'>
        <h1>Welcom to the Movie App</h1>
        <button onClick={()=>{nav('/movies')}}>search</button>
      </div>
    </div>
  )
}

export default Home