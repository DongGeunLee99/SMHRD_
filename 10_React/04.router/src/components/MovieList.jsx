import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import axios from 'axios'
import '../style/MovieList.css'

const API_KEY = '5b713bc02d650713b3533d589abb5e0b'
const URL = `https://api.themoviedb.org/3/movie/popular?api_key=${API_KEY}`;

const MovieList = () => {

  const [movies, setMovies] = useState([]);

  useEffect(() => {
    axios
      .get(URL)
      .then((res) => {
        console.log(res)
        setMovies(res.data.results)
      })
      .catch((error) => {
        console.error("Error Data : ", error)
      })
  }, [])


  return (
    <div className='movie-list'>
      <h1>Popular Movies</h1>
      <Link to={'/'} className='home-link'>
        <button>홈으로</button>
      </Link>
      <div className='movies'>
        {movies.map((item) => (
          <div key={item.id} className='movie'>
            <Link to={`/movie/${item.id}`}>
              <img src={`https://image.tmdb.org/t/p/w200${item.poster_path}`}></img>
            </Link>
            <div className='move-info'>
              <h2>{item.title}</h2>
              <p>Rating : {item.vote_average}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

export default MovieList