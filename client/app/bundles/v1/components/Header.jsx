// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';
import SearchComponent from '../components/SearchComponent';
import _ from 'lodash';

// Simple example of a React "dumb" component
export default class Header extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    showSearch: PropTypes.any,
  };

  constructor(props, context) {
    super(props, context);

    // Uses lodash to bind all methods to the context of the object instance, otherwise
    // the methods defined here would not refer to the component's class, not the component
    // instance itself.
  }

  // React will automatically provide us with the event `e`
  handleChange(e) {
  }

  render() {
    const { showSearch } = this.props;
    const search = <SearchComponent />
    const headerContent = <div className="pull-right">
                            <button className="button">Ingresar</button>
                            <button className="button button-green">Registrarse</button>
                          </div>;

    return (
      <header>
        <h1>
          <span className="color-blue">Red</span>
          <span className="color-green">1</span>
          <span className="color-yellow">0</span>
          <span className="color-red">1</span>
        </h1>
        { (showSearch) ? search : headerContent }
      </header>
    );
  }
}
