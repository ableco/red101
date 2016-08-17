import React from 'react';
import _ from 'lodash';

export default class Header extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {

    return (
      <div className="modal-wrapper">
        <div className="modal-content">
          <a className="close-button" href="javascript:;"><i className="fa fa-times" /></a>
          <div className="modal-login">
            <div className="modal-header">
              <h2>Ingreso</h2>
              <p>Ingresa tu correo electrónico y tu contraseña.<br />Si aún no tienes una cuenta, <a className="link link-green" href="javascript:;">registrate aquí</a></p>
            </div>
            <div className="modal-body">
              <form>
                <div className="form-body">
                  <div className="input-container">
                    <label>Correo Electronico</label>
                    <input placeholder="ejm. usuario@gmail.com" />
                  </div>
                  <div className="input-container">
                    <label>Password</label>
                    <input placeholder="Mínimo 6 caractéres" />
                    <a className="link link-blue pull-right" href="javascript:;">Te olvidaste tu contraseña?</a>
                  </div>
                </div>
                <div className="clearfix" />
                <div className="form-footer">
                  <button className="button button-transparent button-big">Cancelar</button>
                  <button className="button button-blue button-big">Ingresar</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
