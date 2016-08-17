import xr from 'xr';

export default function requestHeaders(getState) {
  const { token } = getState().railsContext;
  return Object.assign({}, xr.defaults.headers, {
    'Authorization': `Token token=${token}`
  });
}
