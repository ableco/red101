import React, { PropTypes } from 'react';
import classNames from 'classnames';
import _ from 'lodash';
import Header from '../Header';

class NewProfileForm extends React.Component {
  handleSubmit(e) {
    e.preventDefault();
    this.props.createProfile();
  }

  render() {
    const { errors, submitting } = this.props;
    const formClass = classNames({ 'submitting-form': submitting });

    return (
      <div className="register">
        <Header showSearch={false} showButtons={false} backButton={true}/>
        <div className="register-content">
          <div className="register-header">
            <h2>Registro de usuarios</h2>
            <p>Si aún no tienes una cuenta, necesitamos unos datos para crear tu cuenta.<br/>Si ya te creaste una cuenta, <a  className="link link-blue" href="javascript:;">ingresa aquí</a></p>
          </div>
          <form onSubmit={ (e) => this.handleSubmit(e) } className={formClass}>
            <div className="form-body">
              <div className="input-container">
                <label>Nombre</label>
                <input placeholder="Primer y segundo nombre" />
              </div>
              <div className="input-container">
                <label>Apellidos</label>
                <input placeholder="" />
              </div>
              <div className="input-container">
                <label>Correo Electronico</label>
                <input placeholder="ejm. usuario@gmail.com" />
              </div>
              <div className="input-container">
                <label>Password</label>
                <input placeholder="Mínimo 6 caractéres" />
              </div>
            </div>
            <div className="form-footer">
              <button className="button button-transparent button-big">Cancelar</button>
              <button className="button button-blue button-big">Confirmar registro</button>
            </div>
          </form>
        </div>
      </div>
    );
  }
}

NewProfileForm.propTypes = {
  formData: PropTypes.object.isRequired,
  errors: PropTypes.object.isRequired,
  submitting: PropTypes.bool,
  createProfile: PropTypes.func,
};

export default NewProfileForm;
