import { combineReducers } from 'redux';
import newProfileForm, { initialState as newProfileFormState } from './newProfileForm';
import newDeviceForm, { initialState as newDeviceFormState } from './newDeviceForm';
import railsContext, { initialState as railsContextState } from './railsContext';
import modals, { initialState as modalsState } from './modals';
import { routerReducer as routing } from 'react-router-redux'

export default combineReducers({
  newProfileForm,
  newDeviceForm,
  modals,
  railsContext,
  routing,
});

export const initialStates = {
  newProfileFormState,
  newDeviceFormState,
  modalsState,
  railsContextState,
};
