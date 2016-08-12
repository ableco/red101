import React, { PropTypes } from 'react';
import { browserHistory, Link } from 'react-router';
import SearchComponent from '../components/SearchComponent';
import _ from 'lodash';

export default class Header extends React.Component {
  static propTypes = {
    showSearch: React.PropTypes.bool,
    showButtons: React.PropTypes.bool,
    backButton: React.PropTypes.bool,
  };

  constructor(props, context) {
    super(props, context);
  }

  render() {
    const { backButton, showSearch, showButtons } = this.props;
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
          <button className="button">Ingresar</button>
          <Link to="register" className="button button-green">Registrarse</Link>
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
