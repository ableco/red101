import '../stylesheets/application.scss';

import ReactOnRails from 'react-on-rails';
import App from './App';
import Store from './Store'

ReactOnRails.register({ App });
ReactOnRails.registerStore({ Store });
