import React, { PropTypes } from 'react';
import Header from '../components/Header';
import { Link } from 'react-router';
import SearchComponent from '../components/SearchComponent';
import _ from 'lodash';

// Simple example of a React "smart" component
export default class Landing extends React.Component {

  constructor(props, context) {
    super(props, context);
  }

  render() {
    return (
      <div className="landing">
        <Header showSearch={false} showButtons={true} backButton={false} />
        <section>
          <div className="landing-content">
            <img src="http://imgur.com/jVGqtFz.png" />
            <h2>Bienvenido, en este lugar podrás encontrar los recursos y diagnosticos necesarios para mejorar como docente.</h2>
            <p>Puedes empezar <Link to="register" className="link link-green">registrándote</Link></p>
            <SearchComponent />
          </div>
          <footer>
            <p>Necesitas ayuda? Envía un mensaje con tu consulta a <a href="mailto:ayuda@red101.pe" className="link link-blue">ayuda@red101.pe</a></p>
          </footer>
        </section>
      </div>
    );
  }
}
