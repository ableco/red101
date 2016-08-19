import React, { Component, PropTypes } from 'react';
import {connect} from "react-redux";
import { browserHistory, Link } from 'react-router';
import SearchComponent from '../components/SearchComponent';
import actions from "../actions/index.js";
import {DISPLAY_LOGIN_MODAL} from "../lib/modalsConstants.js";
import {DISPLAY_NEW_PROFILE} from "../lib/formsConstants.js";
import _ from 'lodash';

class Header extends Component {
  static propTypes = {
    showSearch: React.PropTypes.bool,
    showButtons: React.PropTypes.bool,
    backButton: React.PropTypes.bool,
  };

  render() {
    const { backButton, showSearch, showButtons, displayModal, displayForm } = this.props;
    const logo = (
      <h1>
        <span className="color-blue">Red</span>
        <span className="color-green">1</span>
        <span className="color-yellow">0</span>
        <span className="color-red">1</span>
      </h1>
    )
    const logoComponent = (backButton) ?
      (
        <a
          className="link go-back"
          href="javascript:;"
          onClick={this._goBack.bind(this)}
        >
          <i className="fa fa-arrow-left"/> Regresar
        </a>
      ) : logo;
    const search = (showSearch) ? <SearchComponent /> : null;
    const buttons = (showButtons) ?
      (
        <div className="pull-right">
          <button className="button" onClick={() => displayModal(DISPLAY_LOGIN_MODAL)}>Ingresar</button>
          <Link to="register" onClick={() => displayForm(DISPLAY_NEW_PROFILE)} className="button button-green">Registrarse</Link>
        </div>
      ) : null;

    return (
      <header>
        { logoComponent }
        { search }
        { buttons }
      </header>
    );
  }

  _goBack() {
    browserHistory.goBack();
  }
}

function mapStateToProps({props}) {
  return {props};
}

function mapDispatchToProps(dispatch) {
  return {
    displayModal: (modalName) => dispatch(
      actions.displayModal(modalName)
    ),
    displayForm: (formName) => dispatch(
      actions.displayForm(formName)
    )
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Header);
