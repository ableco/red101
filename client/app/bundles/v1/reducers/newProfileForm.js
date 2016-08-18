import * as actions from '../actions';

export const initialState = {
  formData: {
    first_name: '',
    last_name:  '',
    email:      '',
    password:   ''
  },
  errors: {},
  submitting: false
}

export default function newProfileForm(state = initialState, action = null) {
  const { type, profile, error } = action;

  switch (type) {
    case actions.default.UPDATE_PROFILE_FORM: {
      return Object.assign({}, state, {
        formData: Object.assign({}, state.formData, { [action.key]: action.value }),
        errors:   Object.assign({}, state.errors,   { [action.key]: null }),
      });
    }
    case actions.default.CREATE_PROFILE_START:
      return Object.assign({}, state, { submitting: true });
    case actions.default.CREATE_PROFILE_SUCCESS:
      return Object.assign({}, state, { submitting: false });
    case actions.default.CREATE_PROFILE_ERROR:
      return Object.assign({}, state, {
        errors:     Object.assign({}, state.errors, action.errors),
        submitting: false,
      });
    default:
      return state;
  }
}
