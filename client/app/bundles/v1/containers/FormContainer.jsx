import React, {PropTypes} from "react";
import { connect } from 'react-redux';
import actions from '../actions';
import NewProfileForm from '../components/profile/NewProfileForm';
import EditProfile from '../components/profile/EditProfile';
import Errors from '../lib/errors';

function FormContainer(props){
  const { displayNewProfile, displayEditProfile, createProfile, updateForm, errors, formData } = props;
  return (
    <div>
      <NewProfileForm visible={displayNewProfile.isVisible} createProfile={createProfile} updateForm={updateForm} errors={errors} formData={formData} />
      <EditProfile visible={displayEditProfile.isVisible} createProfile={createProfile} updateForm={updateForm} errors={errors} formData={formData} />
    </div>
  );
}

function mapStateToProps({newProfileForm, forms}) {
  return Object.assign({}, forms, newProfileForm, {
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

export default connect(mapStateToProps, mapDispatchToProps)(FormContainer);
