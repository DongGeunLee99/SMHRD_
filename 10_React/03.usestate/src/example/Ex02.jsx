import React, {useState} from 'react'
import pic from '../img/img1.gif'


const Ex02 = () => {
    // React에서 이미지 경로를 설정하는 방법
    // 1. src 폴더 내에서 이미지를 import하기

    // 2. public 내 이미지 접근
    // url에 http://localhost:3000/img/img1.gif
    // public 폴더 안에 있는 이미지는 서버와 통신이 가능하다


    // useState의 초기값은 숫자, 문자, 배열 등 다 들어감
    const [likeEmoji, setLikeEmoji] = useState('♡')
    const [likeNum, setLikeNum] = useState(0)

    const handleLike = ()=>{
        console.log("in")
        if(likeEmoji == "♡"){
            setLikeEmoji("♥")
            setLikeNum(1)
        } else{
            setLikeEmoji("♡")
            setLikeNum(0)
        }
    }
  return (
    <div>
        <img width='300px' src={pic}></img> 
        <p>
            <span onClick={handleLike}>
                {likeEmoji}
            </span>
            <span>
                좋아요 {likeNum}개
            </span>
        </p>
    </div>
  )
}

export default Ex02