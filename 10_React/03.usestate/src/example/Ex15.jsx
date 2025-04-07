import React, { useState, useEffect } from 'react'
import axios from 'axios'
import '../style/Ex15.css'

const Ex15 = () => {
  const [city, setCity] = useState('gwangju')
  const [temp, setTemp] = useState('0')
  const [icon, setIcon] = useState('')
  const [cloud, setCloud] = useState('')

  const getCity = (cityName) => {
    console.log(cityName)
    setCity(cityName)
  }

  // API 호출을 진행 -> 함수
  const getData = () => {
    let url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=603aa562f93c1b6e5fb4e7596aa820d5`;


    // Axios : 비동기 작업을 쉽게 처리할 수 있는 Promise 기반 구조
    //  요청과 응답 데이터를 자동으로 JSON 형식으로 변환
    //  요청과 응답을 가로채서(순서를 기다리지 않고) 처리할 수 있는 인터셉터 기능
    //  브라우저와 Node.js 환경에서 모두 사용 가능
    //  -> HTTP요청을 조금 더 효율적이고 간편하게 처리할 수 있다. 
    axios
      .get(url)
      .then((res) => {
        // console.log('weather cloud:', res)

        //  ##  온도 세팅  ##
        setTemp(parseInt(res.data.main.temp) - 273)

        //  ##  아이콘 세팅  ##
        setIcon(`https://openweathermap.org/img/wn/${res.data.weather[0].icon}@2x.png`)

        //  ##  구름의 양 세팅  ##
        res.data.clouds.all > 90 ? setCloud('매우 흐림') :
          res.data.clouds.all > 60 ? setCloud('흐림') :
            res.data.clouds.all > 30 ? setCloud('약간 흐림') : setCloud('맑음')

        // console.log("temp : ", temp)
        // console.log("icon : ", icon)
        // console.log("cloud : ", cloud)
      })
  }

  useEffect(() => {
    getData()
  }, [city])

  return (
    <div className='weather-container'>
      <div className='weather-item'>
        <h1>날씨 확인</h1>
        <div className='weather-data'>
          <img src={icon} width={'100px'}></img>
          <h1>{temp}</h1>
          <h3>{city}</h3>
          <h4>{cloud}</h4>
        </div>
        <div>
          <button onClick={() => { getCity('gwangju') }}>광주</button>
          <button onClick={() => { getCity('seoul') }}>서울</button>
          <button onClick={() => { getCity('busan') }}>부산</button>
        </div>
      </div>
    </div>
  )
}

export default Ex15