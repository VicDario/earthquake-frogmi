import React from 'react';
import { useNavigate } from "react-router-dom";
import { LuActivity, LuCalendar, LuExternalLink, LuLocate, LuSearch } from "react-icons/lu";

export default function ListElement(props){
    const navigate = useNavigate();

    function handleDetails() {
        navigate(`/earthquake/${props.id}`, { state: props });
    }

    return (
        <li className='list-element'>
            <p><LuLocate /> { props.attributes.place }</p>
            <p><LuCalendar /> { props.attributes.time }</p>
            <p><LuActivity /> { props.attributes.magnitude }</p>
            <p><button onClick={handleDetails} className='button-details'><LuSearch /> Details</button></p>
            <p><LuExternalLink /><a href={props.links.external_url} target='_blank'>USGS</a></p>
        </li>
    );
}