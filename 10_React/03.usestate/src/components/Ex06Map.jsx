import React from 'react'
import { Card, Button } from 'react-bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css';

const Ex06Map = ({item}) => {
    // 객체 비구조화 할당
    // 간단하게 화면 구성하는 방법 => bootstrap
    // 터미널 창에 npm install react-bootstrap bootstrap

    return (
        <Card style={{ width: '18rem' }}>
            <Card.Img variant="top" src={item.imgSrc} height={"350px"} />
            <Card.Body>
                <Card.Title>{item.title} {item.birthYear} </Card.Title>
                <Card.Text>
                    {item.content}
                </Card.Text>
                <Button variant="primary" href={item.SNS}>Instagram</Button>
            </Card.Body>
        </Card>
    );
}
export default Ex06Map