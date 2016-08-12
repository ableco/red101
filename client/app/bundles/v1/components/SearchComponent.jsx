// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class SearchComponent extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    user: PropTypes.any,
  };

  // React will automatically provide us with the event `e`
  handleChange(e) {

  }

  render() {
    const { user } = this.props;
    return (
      <div className="searchbox">
        <div className="searchbox-input">
          <input type="text" placeholder="Qué recurso deseas buscar?" />
        </div>
        <button className="button button-blue button-big disabled pull-right">Buscar</button>
      </div>
    );
  }
}
