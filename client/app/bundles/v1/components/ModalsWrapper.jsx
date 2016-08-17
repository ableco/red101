import React, {PropTypes} from 'react';
import _ from 'lodash';
import {DISPLAY_LOGIN_MODAL} from "../lib/modalsConstants.js";

export default class ModalsWrapper extends React.Component {
  static propTypes = {
    visible: PropTypes.bool.isRequired,
    modalName: PropTypes.string.isRequired,
    showCloseButton: PropTypes.bool.isRequired,
  }

  static defaultProps = {
    showCloseButton: true,
  }

  render() {
    let component = null;
    let closeBtn;
    const {visible, showCloseButton, modalName, closeModal} = this.props;
    console.log(visible);

    if (showCloseButton) {
      closeBtn = (
        <a href="javascript:;" className="close-modal" onClick={() => closeModal(DISPLAY_LOGIN_MODAL)}>
          <i className="fa fa-times"></i>
        </a>
      );
    }

    if (visible) {
      component = (
        <div className="modal-wrapper">
          <div className="modal-content">
            {closeBtn}
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

    return (
      component
    );
  }
}
