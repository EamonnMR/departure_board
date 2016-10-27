import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import csv from 'neat-csv'


function render_from_csv(){
  fetch('/api/Departures.csv').then((response) => {
    response.text().then( text => {
	    csv( text ).then( data => {
        ReactDOM.render(
          <App trains={data} />,
          document.getElementById('root')
        ); 
        setTimeout(render_from_csv, 30000);
      })
    })
  })
}

render_from_csv();

