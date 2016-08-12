// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';
import Header from '../components/Header';
import UserViewDetailsComponent from '../components/UserViewDetailsComponent';

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
    const userJson = [
      {
        name: 'User name',
        status: 'Licenciado',
        email: 'username@mail.com',
        about: '',
        country: 'Peru',
        city: 'Lima',
        centro_educativo: 'User Centro Educativo Name',
        rol: '',
        nivel: '',
        telefono: '',
      },
      {}
    ];
    return (
      <div className="row">
        <Header showSearch={true} />
        <UserViewDetailsComponent
          user={userJson}
        />
      </div>
    );
  }
}
