import React from "react";
    
const Member = ({team, name}) => {
    // props -> 객체데이터
    // -> let props = {team : '무한도전', name : '유재석'}
    // let {team, name} = props
    //console.log('App.js로부터 받아온 데이터', props)
    // console.log(props);
    let boxStyle ={
        backgroundColor : 'whitesmoke',
        border : '1px solid navy',
        fontsize : '30px'
    }
    return(
        <div>
            <div style={boxStyle}>
            <h3>{team} {name}</h3>
            </div>
        </div>
    )
}

export default Member;