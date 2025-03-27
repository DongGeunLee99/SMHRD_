import logo from './logo.svg';
import './App.css';
import Menubox from '../../02.props/src/components/MenuBox';
import Member from './components/Member';

function App() {
let student ={
  name : '홍길동',
  sub : '도망가기',
  male : true
}

// 비구조화 할당
let {name, sub, male} = student;
console.log('객체',name);

  let temp = 'ice';
  let team = "박이노"
  return (
    <div className="App">
      <Menubox temp={temp} name='아메리카노'></Menubox>
      <Menubox temp={temp} name='카페라떼'></Menubox> 
      <Member team={team} name='박진우'></Member>
      <Member team={team} name='박남규'></Member>
      <Member team={team} name='이동근'></Member>
      <Member team={team} name='노승현'></Member>
    </div>
  );
}

export default App;