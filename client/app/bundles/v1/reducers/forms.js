import {DISPLAY_FORM} from "../actions/synchronous/forms";
import {FORM_NEW_PROFILE, FORM_EDIT_PROFILE} from "../lib/formsConstants.js";

export const initialState = {
  displayNewProfile: {
    isVisible: false,
    formName: FORM_NEW_PROFILE,
  },
  displayEditProfile: {
    isVisible: false,
    formName: FORM_EDIT_PROFILE,
  },
};

function forms(state = initialState, action) {
  const formName = action.formName;
  switch (action.type) {
    case DISPLAY_FORM:
      return {...state, [formName]: {...state[formName], isVisible: true}};
    default:
      return state;
  }
}

export default forms;
