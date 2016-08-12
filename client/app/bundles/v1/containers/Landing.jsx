import React, { PropTypes } from 'react';
import Header from '../components/Header';
import SearchComponent from '../components/SearchComponent';
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
        <Header showSearch={false} />
        <section>
          <div className="landing-content">
            <img src="http://imgur.com/jVGqtFz.png" />
            <h2>Bienvenido, en este lugar podrás encontrar los recursos y diagnosticos necesarios para mejorar como docente.</h2>
            <p>Puedes empezar <a href="javascript:;" className="link link-green">registrándote</a></p>
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
