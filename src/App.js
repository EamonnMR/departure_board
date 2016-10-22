import React, { Component } from 'react';

class Row extends Component {
  render() {
    // Note: I tried to use let data = this.props.train
    // but apparently that screws up at binding time so I spell
    // it out here.
    // 
    // Wonder what the best practice is...
    return (
      <tr>
        <td>{this.props.train.time}</td>
        <td>{this.props.train.origin}</td>
        <td>{this.props.train.destination}</td>
        <td>{this.props.train.train_number}</td>
        <td>{this.props.train.track_number}</td>
        <td>{this.props.train.status}</td>
      </tr>
    )
  }
};

class App extends Component {

  render() {

    let rows = [];
    this.props.trains.forEach( (train) => {
      rows.push(<Row train={train} key={train.number} />);
    });
    return (
      <div className="container">
        <div className="panel panel-default">
          <div className="panel-heading">
            <h1>Departure Board</h1>
          </div>
          <table className="table">
            <tr>
              <th>Time</th>
              <th>Origin</th>
              <th>Destination</th>
              <th>Train #</th>
              <th>Track #</th>
              <th>status</th>
            </tr>
            <tbody>{rows}</tbody>
          </table>
        </div>
      </div>
    );
  }
}

export default App;
