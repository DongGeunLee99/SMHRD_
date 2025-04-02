import React, { useState } from 'react'
import Footer from '../components/Ex12/Footer'
import Content from '../components/Ex12/Content'
import Header from '../components/Ex12/Header'
import {ThemeContext} from '../context/Ex12ThemeContext'
import '../style/Ex12.css'

const Ex12 = () => {
  const [isDark, setIsDark] = useState(false);
  return (
    <ThemeContext.Provider value={{isDark, setIsDark}}>

      <div className='page'>
        <Footer></Footer>
        <Content></Content>
        <Header></Header>
      </div>

    </ThemeContext.Provider>
  )
}

export default Ex12