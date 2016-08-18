import React, { PropTypes } from "react";
import SearchInput, {createFilter} from "react-search-input";
import emails from "./dummy/emails";

const KEYS_TO_FILTERS = ['user.name'];

export default class SearchComponent extends React.Component {
  constructor() {
    super();

    this.state = {
      searchTerm: "",
      isFocused: false,
    }
  }


  render() {
    const filteredEmails = emails.filter(createFilter(this.state.searchTerm, KEYS_TO_FILTERS));
    const {searchTerm, isFocused} = this.state;
    const searchboxList = (searchTerm.length) ? (
      <div className="searchbox-list">
        {filteredEmails.slice(0, 2).map(email => {
          return (
            <a href="javascript:;" className="searchbox-item" key={email.id}>
              <b>{email.user.name}</b>
              <span>{email.subject}</span>
            </a>
          )
        })}
      </div>
    ) : null;
    const isActive = (searchTerm.length) ? "" : "disabled";
    const isFocus = (isFocused) ? "active" : null;

    return (
      <div className="searchbox">
        <div className={`searchbox-input ${isFocus}`}>
          <i className="fa fa-search" />
          <SearchInput fuzzy={true} placeholder="¿Qué recurso deseas buscar?" onChange={this.searchUpdated.bind(this)} onFocus={this._onFocus.bind(this)} onBlur={this._onBlur.bind(this)} />
          {searchboxList}
        </div>
        <button className={`searchbox-button button button-blue button-big ${isActive} pull-right`}>Buscar</button>
      </div>
    );
  }

  _onFocus() {
    this.setState({isFocused: true});
  }

  _onBlur() {
    if (!this.state.searchTerm.length) {
      this.setState({isFocused: false});
    }
  }

  searchUpdated(term) {
    this.setState({searchTerm: term})
  }
}
