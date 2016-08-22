import React, { Component, PropTypes } from 'react';
import {connect} from "react-redux";
import { Link } from 'react-router';
import actions from "../actions/index.js";
import {DISPLAY_EDIT_PROFILE} from "../lib/formsConstants.js";

class UserViewDetailsComponent extends Component {
  static propTypes = {
    user: PropTypes.any,
  };

  handleChange(e) {

  }

  render() {
    const { displayForm, user } = this.props;
    // This only for a static example

    const name     = (user.name     !== '') ? user.name     : 'No especifica';
    const school   = (user.school   !== '') ? user.school   : 'No especifica';
    const about    = (user.about    !== '') ? user.about    : 'No especifica';
    const email    = (user.email    !== '') ? user.email    : 'No especifica';
    const location = (user.location !== '') ? user.location : 'No especifica';
    const role     = (user.role     !== '') ? user.role     : 'No especifica';
    const level    = (user.level    !== '') ? user.level    : 'No especifica';
    const phone    = (user.phone    !== '') ? user.phone    : 'No especifica';

    const editButton = (
      <Link
        to="/profile/edit"
        onClick={() => displayForm(DISPLAY_EDIT_PROFILE)}
        className="link link-blue"
      >
        Editar información
      </Link>
    )

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
            <label> { phone }</label>
          </li>
          <li>
            <label className="title">Acerca de mi</label>
            <label> { about }</label>
          </li>
        </ul>
        {editButton}
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

export default connect(mapStateToProps, mapDispatchToProps)(UserViewDetailsComponent);
