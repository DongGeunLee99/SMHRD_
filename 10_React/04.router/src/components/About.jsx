import React from 'react'
import { Link } from 'react-router-dom'

const About = () => {
  return (
    <div>
      <h2>글 목록</h2>
      <Link to={'/product/1?best=true'}>정보처리기사 시험 공부 하실 분~</Link>
      <hr />
      <Link to={'/product/2'}>기획 발표 참여하실 분~</Link>
      <hr />
      <Link to={'/product/3'}>내일은 금요일~</Link>
    </div>
  )
}

export default About