import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './index.css';

let fake_trains = [
  {
    "time": 1314997200,
    "origin": "North Station",
    "destination": "Portland, ME",
    "train_number": 697,
    "track_number": "TBD",
    "status": "ON TIME"
  },
  {
    "time": 1314997200,
    "origin": "South Station",
    "destination": "Greenbush",
    "train_number": 699,
    "track_number": "TBD",
    "status": "ON TIME"
  }
]

ReactDOM.render(
  <App trains={fake_trains}/>,
  document.getElementById('root')
);
