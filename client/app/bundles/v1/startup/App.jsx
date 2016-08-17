import React from 'react';
import { Router, Route, browserHistory, IndexRoute } from 'react-router';
import { Provider } from 'react-redux';
import { syncHistoryWithStore } from 'react-router-redux'

import Layout from '../layout/Layout';
import Landing from '../containers/Landing';
import NewProfileContainer from '../containers/NewProfileContainer';
import UserContainer from '../containers/UserContainer';

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
        <Route path="/" component={Landing} />
        <Route path="/perfil" component={UserContainer} />
        <Route path="/register" component={NewProfileContainer} />
      </Router>
    </Provider>
  )
}
