import React, { Component, PropTypes } from 'react';
import {connect} from "react-redux";
import Header from '../components/Header';
import { Link } from 'react-router';
import SearchComponent from '../components/SearchComponent';
import actions from "../actions/index.js";
import {DISPLAY_NEW_PROFILE} from "../lib/formsConstants.js";
import _ from 'lodash';

class Landing extends Component {
  render() {
    const { displayForm } = this.props;
    return (
      <div className="landing">
        <Header showSearch={false} showButtons={true} backButton={false} />
        <section>
          <div className="landing-content">
            <img src="http://imgur.com/jVGqtFz.png" />
            <h2>Bienvenido, en este lugar podrás encontrar los recursos y diagnosticos necesarios para mejorar como docente.</h2>
            <p>Puedes empezar <Link to="register" onClick={() => displayForm(DISPLAY_NEW_PROFILE)} className="link link-green">registrándote</Link></p>
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

function mapStateToProps({props}) {
  return {props};
}

function mapDispatchToProps(dispatch) {
  return {
    displayForm: (formName) => dispatch(
      actions.displayForm(formName)
    )
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Landing);
