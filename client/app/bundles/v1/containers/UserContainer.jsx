import React, { PropTypes } from 'react';
import UserViewComponent from '../components/UserViewComponent';

// Simple example of a React "smart" component
export default class UserContainer extends React.Component {
  static propTypes = {
    user: PropTypes.any
  };

  constructor(props, context) {
    super(props, context);

    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    // this.state = { name: this.props.name };
  }


  render() {
    return (
      <div className="perfil container-fluid">
        <UserViewComponent user={this.props.user} />
      </div>
    );
  }
}
