import React from 'react';
import { Link } from 'react-router';

const Layout = ({ children }) => (
  <div className="container">
    {children}
  </div>
);

Layout.propTypes = {
  children: React.PropTypes.object,
};

export default Layout;
