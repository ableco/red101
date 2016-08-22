// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';
import Header from './Header';
import UserViewDetailsComponent from './UserViewDetailsComponent';
import UserViewTabsComponent from './UserViewTabsComponent';

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
    const userJson = {
      name:     'Juan Jose Rivadeneyra',
      email:    'username@mail.com',
      about:    '',
      location: 'Lima, Peru',
      school:   'User Centro Educativo Name',
      role:     '',
      level:    '',
      phone:    '',
    };
    return (
      <div>
        <Header showSearch={true} showButtons={false} />
        <UserViewDetailsComponent
          user={userJson}
        />
        <UserViewTabsComponent />
      </div>
    );
  }
}
