import React, { useState, useEffect } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import axios from 'axios'
import '../style/MovieDetail.css'

const API_KEY = '5b713bc02d650713b3533d589abb5e0b'

const MovieDetail = () => {

  const nav = useNavigate();
  const { id } = useParams();
  const [movie, setMovie] = useState();

  useEffect(()=>{
    axios
    .get(`https://api.themoviedb.org/3/movie/${id}?api_key=${API_KEY}`)
    .then((res)=>{
      // console.log(res.data)
      setMovie(res.data)
    })
    .catch((err)=>{
      console.error("Error : ", err)
    })
  },[id])

  // 렌더링 이슈 해결
  if(!movie){
    return <div>Loading..</div>
  }


  return (
    <div className='movie-detail'>
      <button onClick={() => { nav('/') }}>홈으로 돌아가기</button>
      <button onClick={() => { nav('/movies') }}>영화 리스트로 돌아가기</button>
      <h1>{movie.title}</h1>
      <img src={`https://image.tmdb.org/t/p/w300${movie.poster_path}`}></img>
      <p><strong>Release Date : </strong>{movie.release_date}</p>
      <p><strong>Rating : </strong>{movie.vote_average}</p>
      <p><strong>Overview : </strong>{movie.overview}</p>
    </div>
  )
}

export default MovieDetail