import React from 'react';
import { Router, Route, hashHistory, IndexRoute } from 'react-router';

import Layout from '../layout/Layout';
import Landing from '../containers/Landing';
import Register from '../containers/Register';
import UserContainer from '../containers/UserContainer';

export default (
  <Router history={hashHistory}>
    <Route path="/" component={Layout}>
      <IndexRoute component={Landing} />
      <Route path="/perfil" component={UserContainer} />
      <Route path="/register" component={Register} />
    </Route>
  </Router>
);
