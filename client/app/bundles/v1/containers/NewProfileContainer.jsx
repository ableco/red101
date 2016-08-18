import { connect } from 'react-redux';
import actions from '../actions';
import NewProfileForm from '../components/profiles/NewProfileForm';
import Errors from '../lib/errors';

function mapStateToProps({ newProfileForm }) {
  return Object.assign({}, newProfileForm, {
    errors: new Errors(newProfileForm.errors),
    submitting: newProfileForm.submitting,
  });
}

function mapDispatchToProps(dispatch) {
  return {
    createProfile: () => dispatch(actions.createProfile()),
    updateForm: (key, value) => dispatch(actions.updateProfileForm(key, value)),
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(NewProfileForm);
