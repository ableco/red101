import xr from 'xr';
import sync from '../../synchronous';
import requestHeaders from '../../../lib/requestHeaders';
import { browserHistory } from 'react-router';

export default function createDevice() {
  return (dispatch, getState) => {
    const { apiUrl } = getState().config;
    const url = `${apiUrl}/devices`;
    const headers = requestHeaders(getState);
    const { formData: device } = getState().newDeviceForm;

    dispatch(sync.createDeviceStart());

    xr.post(url, { device }, { headers }).then(
      ({ data: createdDevice }) => {
        console.log(createdDevice);
        // dispatch(sync.createCompanySuccess(createdCompany));
        // dispatch(fetchCompanies(true));
        // dispatch(sync.closeModal('newCompanyModal'));
        // dispatch(sync.flash('createdCompany', { company: createdCompany }));
        //
        // // This modal can be triggered from both the companies page and the sidebar. I first tried
        // // to make it pass as a param from the action creator but it meant that the
        // // sidebar-triggered new company modal will always redirect, even when being inside
        // // the companies page. This is more correct but also less robust unless we do something
        // // else.
        // //
        // // TODO: Pass the current react-router location object here somehow.
        // if (window.location.pathname !== '/companies') {
        //   browserHistory.push(`/companies/${createdCompany.id}`);
        // }
      },
      (error) => {
        const { status, response } = error;
        if (status === 422) {
          const modelErrors = JSON.parse(response).errors;
          dispatch(sync.createDeviceError(modelErrors));
        } else {
          throw error;
        }
      }
    );
  };
}
