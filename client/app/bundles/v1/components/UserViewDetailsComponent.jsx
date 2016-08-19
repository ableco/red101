// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class UserViewDetailsComponent extends React.Component {
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
    // This only for a static example

    const name     = (user.name     !== '') ? user.name     : 'No especifica';
    const school   = (user.school   !== '') ? user.school   : 'No especifica';
    const about    = (user.about    !== '') ? user.about    : 'No especifica';
    const email    = (user.email    !== '') ? user.email    : 'No especifica';
    const location = (user.location !== '') ? user.location : 'No especifica';
    const role     = (user.role     !== '') ? user.role     : 'No especifica';
    const level    = (user.level    !== '') ? user.level    : 'No especifica';
    const phone    = (user.phone    !== '') ? user.phone    : 'No especifica';

    return (
      <div className="perfil-details">
        <h3>{ level }</h3>
        <h1>{ name }</h1>

        <ul>
          <li>
            <label className="title">Correo Electrónico </label>
            <label> { email }</label>
          </li>
          <li>
            <label className="title">Centro Educativo </label>
            <label> { school }</label>
          </li>
          <li>
            <label className="title">Localizacion </label>
            <label> { location }</label>
          </li>
          <li>
            <label className="title">Rol</label>
            <label> { role }</label>
          </li>
          <li>
            <label className="title">Teléfonico</label>
            <label> { Phone }</label>
          </li>
          <li>
            <label className="title">Acerca de mi</label>
            <label> { about }</label>
          </li>
        </ul>
      </div>
    );
  }
}
