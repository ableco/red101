import React, { Component, PropTypes } from 'react';
import classNames from 'classnames';
import _ from 'lodash';
import Header from '../Header';

export default class EditProfile extends Component {
  static propTypes = {
    visible: PropTypes.bool.isRequired,
    formData: PropTypes.object.isRequired,
    errors: PropTypes.object.isRequired,
    submitting: PropTypes.bool,
    createProfile: PropTypes.func,
    updateForm: PropTypes.func,
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createProfile();
  }

  handleChange(e) {
    const value = e.target.value;
    const name  = e.target.name;

    this.props.updateForm(name, value);
  }

  render() {
    let component = null;
    const { visible, formData, updateForm, errors, submitting } = this.props;
    const formClass = classNames({ 'submitting-form': submitting });

    if (visible) {
      component = (
        <div className="register">
          <Header showSearch={false} showButtons={false} backButton={true}/>
          <div className="register-content">
            <div className="register-header">
              <h2>Editando perfil</h2>
              <p>
                Si aún no tienes una cuenta, necesitamos unos datos para crear tu cuenta.
                <br/>
                Si ya te creaste una cuenta,
                <a className="link link-blue" href="javascript:;">ingresa aquí</a>
              </p>
            </div>
            <form onSubmit={ (e) => this.handleSubmit(e) } className={formClass}>
              <div className="form-body">
                <div className="input-container">
                  <label>Nombre</label>
                  <input
                    placeholder="Nombre"
                    name="first_name"
                    onChange={(e) => this.handleChange(e)}
                    />
                </div>
                <div className="input-container">
                  <label>Apellidos</label>
                  <input
                    placeholder="Apellido"
                    name="last_name"
                    onChange={(e) => this.handleChange(e)}
                    />
                </div>
                <div className="input-container">
                  <label>Correo Electronico</label>
                  <input
                    type="email"
                    placeholder="ejm. usuario@gmail.com"
                    name="email"
                    onChange={(e) => this.handleChange(e)}
                    />
                </div>
                <div className="input-container">
                  <label>Password</label>
                  <input
                    type="password"
                    placeholder="Mínimo 6 caractéres"
                    name="password"
                    onChange={(e) => this.handleChange(e)}
                    />
                </div>
              </div>
              <div className="form-footer">
                <button className="button button-transparent button-big">Cancelar</button>
                <button className="button button-blue button-big">Confirmar registro</button>
              </div>
            </form>
          </div>
        </div>
      )
    }

    return (
      component
    );
  }
}
