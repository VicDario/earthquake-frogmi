import React, { useEffect, useState } from 'react';
import { useLocation, Link } from 'react-router-dom';

export default function EarthquakeList(){
    const location  = useLocation();
    const [comments, setComments] = useState([]);
    useEffect(() => {
        getComments();
    }, [location.state])

    async function getComments() {
        const request = await fetch(`/api/comments?earthquake_id=${location.state.id}`);
        const response = await request.json();
        setComments(response);
    }
    async function handleSubmit(event) {
        event.preventDefault();
        const comment = event.target[0].value;
        const request = await fetch('/api/comments', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                earthquake_id: location.state.id,
                body: comment
            })
        });
        if (request.status === 201) {
            event.target[0].value = '';
            getComments();
        }
    }
    return (
        <div className='container'>
            <header className='header'>
                <h1>Earthquakes</h1>
                <Link to='/' className='button-back'>Back</Link>
            </header>
            <section className='page-details'>
                <div className='details-container'>
                    <ul className='list-none'>
                        <li>Place: {location.state.attributes.place}</li>
                        <li>Magnitude: {location.state.attributes.magnitude}</li>
                        <li>Time: {location.state.attributes.time}</li>
                        <li>Magnitude Type: {location.state.attributes.mag_type}</li>
                        <li>
                            Coordinates:
                            <ul>
                                <li>Longitude: {location.state.attributes.coordinates.longitude}</li>
                                <li>Latitude: {location.state.attributes.coordinates.latitude}</li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div className='comments-container'>
                    <h2>Comments</h2>
                    <form onSubmit={handleSubmit} className='comment-input-box'>
                        <input type="text" minLength={3} id='comment' name='comment' />
                        <button type='submit'>Comentar</button>
                    </form>
                    <ul className='list-none comments-list'>
                        {
                            comments.map((comment, index) => (
                                <li key={index}>{comment.body} <small className='comment-date'>{comment.created_at}</small></li>
                            ))
                        }
                    </ul>
                </div>
            </section>
        </div>
    );
}