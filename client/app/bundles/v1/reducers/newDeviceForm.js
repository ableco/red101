import * as actions from '../actions';

export const initialState = {
  formData: {
    email: null,
    password: null
  },
  errors: {},
  submitting: false
}

export default function newDeviceForm(state = initialState, action = null) {
  const { type, device, error } = action;

  switch (type) {
    case actions.CREATE_DEVICE_START:
      return Object.assign({}, state, { submitting: true });
    case actions.CREATE_DEVICE_SUCCESS:
      return Object.assign({}, state, { submitting: false });
    case actions.CREATE_DEVICE_ERROR:
      return Object.assign({}, state, {
        errors: Object.assign({}, state.errors, action.errors),
        submitting: false,
      });
    default:
      return state;
  }
}
