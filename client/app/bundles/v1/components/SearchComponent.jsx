import React, { PropTypes } from "react";
import SearchInput, {createFilter} from "react-search-input";
import resources from "./dummy/resources";

const KEYS_TO_FILTERS = ["title", "url", "details"];

export default class SearchComponent extends React.Component {
  constructor() {
    super();

    this.state = {
      searchTerm: "",
      isFocused: false,
    }
  }

  render() {
    const filteredResources = resources.filter(createFilter(this.state.searchTerm, KEYS_TO_FILTERS));
    const {searchTerm, isFocused} = this.state;
    const searchboxList = (searchTerm.length) ? (
      <div className="searchbox-list">
        {filteredResources.slice(0, 3).map(resource => {
          return (
            <a href={resource.url} className="searchbox-item" key={resource.id}>
              <h4>{resource.title}</h4>
              <span className="ellipsis">{resource.details}</span>
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
