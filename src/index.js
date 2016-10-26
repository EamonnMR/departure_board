import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import csv from 'neat-csv'

function render_from_csv(){
  fetch('/api/Departures.csv').then((response) => {
    response.text().then( text => {
	    csv( text ).then( data => {
        console.log(data);
        // ReactDOM.render(
        //   <App trains={data}/>,
        //   document.getElementById('root')
        // );

      })
    })
  })
  
  // TODO: sleep 30000 ms; render_from_csv()
}

render_from_csv();

