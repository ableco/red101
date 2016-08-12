import React from 'react';
import ReactOnRails from 'react-on-rails';

import UserContainer from '../containers/UserContainer';

const UserContainerApp = (props) => (
  <UserContainer className="test" {...props} />
);

// This is how react_on_rails can see the UserContainer in the browser.
ReactOnRails.register({ UserContainerApp });
