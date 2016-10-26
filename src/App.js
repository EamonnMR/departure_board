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
        <td>{this.props.train.ScheduledTime}</td>
        <td>{this.props.train.Origin}</td>
        <td>{this.props.train.Destination}</td>
        <td>{this.props.train.Trip}</td>
        <td>{this.props.train.Track ? this.props.train.Track : "TBD"}</td>
        <td>{this.props.train.Status}</td>
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
