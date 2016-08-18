import React, { PropTypes } from 'react';
import UserViewComponent from '../components/UserViewComponent';

export default class ProfileContainer extends React.Component {
  static propTypes = {
    user: PropTypes.any
  };

  constructor(props, context) {
    super(props, context);
  }


  render() {
    return (
      <div className="perfil container-fluid">
        <UserViewComponent user={this.props.user} />
      </div>
    );
  }
}
