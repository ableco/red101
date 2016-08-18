import xr from 'xr';
import Cookies from 'js-cookie';
import { browserHistory } from 'react-router';
import { push } from 'react-router-redux';
import sync from '../../synchronous';
import headers from '../../../lib/headers';

export default function createProfile() {
  return (dispatch, getState) => {
    const { API_URL } = getState().railsContext;
    const url = `${API_URL}/profile`;
    const { formData: profile } = getState().newProfileForm;

    dispatch(sync.createProfileStart());

    xr.post(url, { profile }, { headers }).then(
      ({ data: createdProfile }) => {
        dispatch(sync.createProfileSuccess(createdProfile));

        Cookies.set('token', createdProfile.token);

        dispatch(push('/profile'));
      },
      (error) => {
        const { status, response } = error;
        if (status === 422) {
          const modelErrors = JSON.parse(response).errors;
          dispatch(sync.createProfileError(modelErrors));
        } else {
          throw error;
        }
      }
    );
  };
}
