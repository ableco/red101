import * as actions from '../actions';

export const initialState = {
  formData: {
    first_name: null,
    last_name: null,
    email: null,
    password: null
  },
  errors: {},
  submitting: false
}

export default function newProfileForm(state = initialState, action = null) {
  const { type, profile, error } = action;

  switch (type) {
    case actions.CREATE_PROFILE_START:
      return Object.assign({}, state, { submitting: true });
    case actions.CREATE_PROFILE_SUCCESS:
      return Object.assign({}, state, { submitting: false });
    case actions.CREATE_PROFILE_ERROR:
      return Object.assign({}, state, {
        errors: Object.assign({}, state.errors, action.errors),
        submitting: false,
      });
    default:
      return state;
  }
}
