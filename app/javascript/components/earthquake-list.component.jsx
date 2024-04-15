import React, { useState, useEffect } from 'react';
import ListElement from './list-element.component';

export default function EarthquakeList(){
    const [pagination, setPagination] = useState({ page: 1, per_page: 10 });
    const [earthquakes, setEarthquakes] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fecthEarthquakes();
    }, [pagination, pagination.page]);

    function handleNextPage() {
        setPagination((previous) => ({...previous, page: previous.page + 1}));
    }
    function handlePreviousPage() {
        setPagination((previous) => ({...previous, page: previous.page - 1}));
    }
    async function fecthEarthquakes() {
        setLoading(true);
        const request = await fetch(`/api/earthquakes?page=${pagination.page}&per_page=${pagination.per_page}`);
        const response = await request.json();
        setEarthquakes(response.data);
        setLoading(false);
    }
    
    return (
        <div className='container'>
            <header>
                <h1>Earthquakes</h1>
            </header>
            <ul className='list-container'>
                {
                    loading ? 
                        <div className='loader'></div>
                    :
                        earthquakes?.map((earthquake, index) => (
                            <ListElement key={index} {...earthquake} />
                        ))
                }
            </ul>
            <div className='pagination-container'>
                { pagination.page > 1 && <button onClick={handlePreviousPage} className='button'>Previous page</button>}
                <button onClick={handleNextPage} className='button'>Next page</button>
            </div>
        </div>
    );
}