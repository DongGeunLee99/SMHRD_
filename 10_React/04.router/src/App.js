import './App.css';
import {Route, Routes} from 'react-router-dom';
import Main from './components/Main';
import About from './components/About';
import MyPage from './components/MyPage';
import Product from './components/Product';


function App() {
  /*
  React Router
  - 사용자가 요청한 URL에 따라 해당 URL에 맞는 페이지를 보여주는 역할
  - 설치 -> 터미널에 npm i react-router-dom -> import {Route, Routes}
  - BrowserRouter -> App 컴포넌트를 감싸줘야 함 -> 브라우저의 주소를 감지하는 역할
  - Routes : 여러 경로(Route)를 감싸서 가지고 있다가, 사용자가 요청한 조건에 맞는 Route가 있을 때,
      Route를 렌더링 해준다

  Route : 필수 속성 2가지 -> path, element
  - path -> 경로
  - element -> 어떤 컴포넌트를 보여줄 것 인가?
  */


  return (
    <div className="App">
      <h1>React Router 학습</h1>
      <Routes>
        <Route path='/' element={<Main></Main>}></Route>
        <Route path='/about' element={<About></About>}></Route>
        <Route path='/mypage' element={<MyPage></MyPage>}></Route>
        <Route path='/product/:num' element={<Product></Product>}></Route>
        {/* 경로 product 뒤에 숫자가 붙는다면 우리는 num이라는 변수에 담아주겠다 */}
      </Routes>
    </div>
  );
}

export default App;