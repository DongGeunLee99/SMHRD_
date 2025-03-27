import React from "react";

const Menubox = (props) => {
    console.log('App.js로부터 받아온 데이터', props);
    console.log(props.name, props.temp)
    return(
        <div>
            <h3>{props.name}{props.temp}</h3>
        </div>


);

}

export default Menubox