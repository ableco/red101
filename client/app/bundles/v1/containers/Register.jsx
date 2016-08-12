import React, { PropTypes } from 'react';
import _ from 'lodash';
import Header from '../components/Header';

// Simple example of a React "smart" component
export default class Register extends React.Component {

  constructor(props, context) {
    super(props, context);
  }

  render() {
    return (
      <div className="register">
        <Header showSearch={false} showButtons={false} backButton={true}/>
      </div>
    );
  }
}
