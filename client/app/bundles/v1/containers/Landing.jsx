import React, { PropTypes } from 'react';
import Header from '../components/Header';
import _ from 'lodash';

// Simple example of a React "smart" component
export default class Landing extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  constructor(props, context) {
    super(props, context);

    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { name: this.props.name };

    // Uses lodash to bind all methods to the context of the object instance, otherwise
    // the methods defined here would not refer to the component's class, not the component
    // instance itself.
    _.bindAll(this, 'updateName');
  }

  updateName(name) {
    this.setState({ name });
  }

  render() {
    return (
      <div className="landing">
        <header>
          <h1>
            <span className="color-blue">Red</span>
            <span className="color-green">1</span>
            <span className="color-yellow">0</span>
            <span className="color-red">1</span>
          </h1>
          <div className="pull-right">
            <button className="button">Ingresar</button>
            <button className="button button-green">Registrarse</button>
          </div>
        </header>
        <section>
          <div className="landing-content">
            <img src="http://imgur.com/jVGqtFz.png" />
            <h2>Bienvenido, en este lugar podrás encontrar los recursos y diagnosticos necesarios para mejorar como docente.</h2>
            <p>Puedes empezar <a href="javascript:;" className="link link-green">registrándote</a></p>
            <div className="searchbox">
              <div className="searchbox-input">
                <input type="text" placeholder="Qué recurso deseas buscar?" />
              </div>
              <button className="button button-blue button-big disabled pull-right">Buscar</button>
            </div>
          </div>
          <footer>
            <p>Necesitas ayuda? Envía un mensaje con tu consulta a <a href="mailto:ayuda@red101.pe" className="link link-blue">ayuda@red101.pe</a></p>
          </footer>
        </section>
      </div>
    );
  }
}
