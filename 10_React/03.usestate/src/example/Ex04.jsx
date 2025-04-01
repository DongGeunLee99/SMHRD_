import React from 'react'

const Ex04 = () => {
  let students = [
    {name : '창창이', age : 5, bloodType : 'Oil'},
    {name : '채수민', age : 25, bloodType : 'O'},
    {name : '조은유', age : 20, bloodType : 'A'}
  ];

  return (
    <div>
      <h3>객체의 값을 출력</h3>
      <p>
          제 이름은 {students[0].name}이고,
          나이는 {students[0].age}살,
          혈액형은 {students[0].bloodType}입니다.
      </p>
      <p>
          제 이름은 {students[1].name}이고,
          나이는 {students[1].age}살,
          혈액형은 {students[1].bloodType}입니다.
      </p>
      <p>
          제 이름은 {students[2].name}이고,
          나이는 {students[2].age}살,
          혈액형은 {students[2].bloodType}입니다.
      </p>


      <h3>Map 함수 이용</h3>
      {/* 기존의 배열은 그대로 두고 배열안에 데이터를 사용해 새로운 배열을 반환한다 
      기존의 배열 데이터를 가지고 올때 item이라는 이름으로 사용
      key 값을 작성해줘야 한다 -> key값은 중복되면 안된다*/}
      {students.map((item)=>(
        <p key={item.name}>
          제 이름은 {item.name}이고, 나이는{item.age}살,
          혈액형은 {item.bloodType}입니다.</p>
      ))}
    </div>
  )
}

export default Ex04