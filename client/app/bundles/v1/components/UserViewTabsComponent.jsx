// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';
import { Tabs, Tab } from 'react-bootstrap';
import UserViewAnswersComponent from './UserViewAnswersComponent';

// Simple example of a React "dumb" component
export default class UserViewTabsComponent extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    user: PropTypes.any,
  };

  // React will automatically provide us with the event `e`
  handleChange(e) {

  }

  render() {
    const { user } = this.props;
    // This only for a static example

    return (
      <div className="profile-tabs">
        <Tabs defaultActiveKey={1} className="clearfix" id="uncontrolled-tab-example">
          <Tab eventKey={1} title="Mis Diagnosticos">
            <UserViewAnswersComponent />
          </Tab>
          <Tab eventKey={2} title="Mis Recursos">
            Mis recursos
          </Tab>
        </Tabs>
      </div>
    );
  }
}
