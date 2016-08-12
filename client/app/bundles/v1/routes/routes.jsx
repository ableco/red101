import React from 'react';
import { Route } from 'react-router';

import Layout from '../layout/Layout';
import Landing from '../containers/Landing';
import Register from '../containers/register';
import UserContainer from '../containers/UserContainer';

export default (
  <Route path="/" component={Layout}>
    <Route path="/landing" component={Landing} />
    <Route path="/perfil" component={UserContainer} />
    <Route path="/register" component={Register} />
  </Route>
);
