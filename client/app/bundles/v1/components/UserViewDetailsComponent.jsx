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
    const name = (user[0].name !== '') ? user[0].name : 'No especifica';
    const status = (user[0].status !== '') ? user[0].status : 'No especifica';
    const centro_educativo = (user[0].centro_educativo !== '') ? user[0].centro_educativo : 'No especifica';
    const about = (user[0].about !== '') ? user[0].about : 'No especifica';
    const email = (user[0].email !== '') ? user[0].email : 'No especifica';
    const country = (user[0].country !== '') ? user[0].country : 'No especifica';
    const city = (user[0].city !== '') ? user[0].city : 'No especifica';
    const rol = (user[0].rol !== '') ? user[0].rol : 'No especifica';
    const nivel = (user[0].nivel !== '') ? user[0].nivel : 'No especifica';
    const telefono = (user[0].telefono !== '') ? user[0].telefono : 'No especifica';

    return (
      <div className="perfil-details">
        <h3>{ status }</h3>
        <h1>{ name }</h1>

        <ul>
          <li>
            <strong>Correo Electrónico </strong>
            <label> { email }</label>
          </li>
          <li>
            <strong>Centro Educativo </strong>
            <label> { centro_educativo }</label>
          </li>
          <li>
            <strong>Localizacion </strong>
            <label> { country }, { city }</label>
          </li>
          <li>
            <strong>Rol </strong>
            <label> { rol }</label>
          </li>
          <li>
            <strong>Número Telefónico </strong>
            <label> { telefono }</label>
          </li>
          <li>
            <strong>Acerca de mi </strong>
            <label> { about }</label>
          </li>
        </ul>
      </div>
    );
  }
}
