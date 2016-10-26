import React, { Component } from 'react';


function time_format(unix_time) {
  let date = new Date( unix_time * 1000 );
  return date.toLocaleTimeString();
}   

class Row extends Component {
  render() {
    return (
      <tr>
        <td>{time_format(this.props.train.ScheduledTime)}</td>
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
