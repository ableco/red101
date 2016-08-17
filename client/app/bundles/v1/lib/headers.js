import xr from 'xr';
import Cookies from 'js-cookie';

const token   = Cookies.get('token');
const headers = Object.assign({}, xr.defaults.headers, {
  'Authorization': `Token token=${token}`
});

export default headers;
