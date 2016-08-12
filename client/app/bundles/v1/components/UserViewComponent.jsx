// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class UserViewComponent extends React.Component {
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
      <div className="row">
        <div className="col-sx-4">
          Datos del Usuario
        </div>
        <div className="col-sx-8">
          Info del usuario
        </div>
      </div>
    );
  }
}
