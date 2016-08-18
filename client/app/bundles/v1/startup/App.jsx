import React from 'react';
import { Router, Route, browserHistory, IndexRoute, IndexRedirect } from 'react-router';
import { Provider } from 'react-redux';
import { syncHistoryWithStore } from 'react-router-redux'
import Cookies from 'js-cookie';

import Layout from '../layout/Layout';
import Landing from '../containers/Landing';
import NewProfileContainer from '../containers/NewProfileContainer';
import UserContainer from '../containers/UserContainer';

/*
 *  Export a function that returns a ReactComponent, depending on a store named SharedReduxStore.
 *  This is used for the client rendering hook after the page html is rendered.
 *  React will see that the state is the same and not do anything.
 */

function requireMember(nextState, replace, store) {
  const token = Cookies.get('token');
  if (!token) replace({ pathname: '/bienvenido' });
}

function requireGuest(nextState, replace, store) {
  const token = Cookies.get('token');
  if (token) replace({ pathname: '/perfil' });
}

export default (props) => {
  const store   = ReactOnRails.getStore('Store');
  const history = syncHistoryWithStore(browserHistory, store);

  return (
    <Provider store={store}>
      <Router history={history} {...props}>
        <Route
          path="/"
          component={Layout}

        >
          <IndexRedirect to="/bienvenido" />
          <Route
            path="/bienvenido"
            component={Landing}
            onEnter={(nextState, replace) => requireGuest(nextState, replace, store)}
          />
          <Route
            path="/perfil"
            component={UserContainer}
            onEnter={(nextState, replace) => requireMember(nextState, replace, store)}
          />
          <Route path="/register" component={NewProfileContainer} />
        </Route>
      </Router>
    </Provider>
  )
}
