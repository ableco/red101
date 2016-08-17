import xr from 'xr';
import Cookies from 'js-cookie';

export default function headers() {
  const token = Cookies.get('token');
  return Object.assign({}, xr.defaults.headers, {
    'Authorization': `Token token=${token}`
  });
}
