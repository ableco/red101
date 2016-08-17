import {DISPLAY_MODAL, CLOSE_MODAL} from "../actions/synchronous/modals";
import {MODAL_LOGIN, MODAL_SUCCESS, MODAL_ERROR} from "../lib/modalsConstants.js";

export const initialState = {
  displayLoginModal: {
    isVisible: false,
    modalName: MODAL_LOGIN,
  },
  displaySuccessModal: {
    isVisible: false,
    modalName: MODAL_SUCCESS,
  },
  errorModal: {
    isVisible: false,
    modalName: MODAL_ERROR,
  },
};

function modals(state = initialState, action) {
  const modalName = action.modalName;
  switch (action.type) {
    case DISPLAY_MODAL:
      return {...state, [modalName]: {...state[modalName], isVisible: true}};
    case CLOSE_MODAL:
      return {...state, [modalName]: {...state[modalName], isVisible: false}};
    default:
      return state;
  }
}

export default modals;
