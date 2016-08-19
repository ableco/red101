import React from 'react';
import { Router, Route, browserHistory, IndexRoute } from 'react-router';
import { Provider } from 'react-redux';
import { syncHistoryWithStore } from 'react-router-redux'

import Layout from '../layout/Layout';
import Landing from '../containers/Landing';
import FormContainer from '../containers/FormContainer';
import ProfileContainer from '../containers/ProfileContainer';

/*
 *  Export a function that returns a ReactComponent, depending on a store named SharedReduxStore.
 *  This is used for the client rendering hook after the page html is rendered.
 *  React will see that the state is the same and not do anything.
 */

export default (props) => {
  const store = ReactOnRails.getStore('Store');
  const history = syncHistoryWithStore(browserHistory, store);

  return (
    <Provider store={store}>
      <Router history={history} {...props}>
        <Route path="/" component={Layout}>
          <IndexRoute component={Landing} />
          <Route path="/profile" component={ProfileContainer} />
          <Route path="/profile/edit" component={FormContainer} />
          <Route path="/register" component={FormContainer} />
        </Route>
      </Router>
    </Provider>
  )
}
