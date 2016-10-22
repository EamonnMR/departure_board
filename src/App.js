import React, { Component } from 'react';

class App extends Component {
  render() {
    return (
      <div className="container">
        <div className="panel panel-default">
          <div className="panel-heading">
            <h1>North Station Information</h1>
          </div>
          <table className="table">
            <tr>
              <th>Time</th>
              <th>Destination</th>
              <th>Train #</th>
              <th>Track #</th>
              <th>status</th>
            </tr>
            <tr>
              <td>6:45 PM</td>
              <td>Portland, ME</td>
              <td>697</td>
              <td>TBD</td>
              <td>ON TIME</td>
            </tr>
          </table>
        </div>
      </div>
    );
  }
}

export default App;
