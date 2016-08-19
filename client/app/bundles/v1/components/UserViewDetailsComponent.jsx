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
      <div className="profile-details">
        <h3>{ status }</h3>
        <h1>{ name }</h1>
        <ul>
          <li>
            <label className="title">Correo Electrónico </label>
            <label> { email }</label>
          </li>
          <li>
            <label className="title">Centro Educativo </label>
            <label> { centro_educativo }</label>
          </li>
          <li>
            <label className="title">Localizacion </label>
            <label> { country }, { city }</label>
          </li>
          <li>
            <label className="title">Rol </label>
            <label> { rol }</label>
          </li>
          <li>
            <label className="title">Nivel</label>
            <label> { rol }</label>
          </li>
          <li>
            <label className="title">Número Telefónico </label>
            <label> { telefono }</label>
          </li>
          <li>
            <label className="title">Acerca de mi </label>
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
