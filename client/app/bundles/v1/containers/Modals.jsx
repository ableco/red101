import React, {PropTypes} from "react";
import {connect} from "react-redux";
import ModalsWrapper from "../components/ModalsWrapper.jsx";
import actions from "../actions/index.js";
import {
  MODAL_LOGIN,
  MODAL_SUCCESS,
  MODAL_ERROR,
} from "../lib/modalsConstants.js";

function Modals(props) {
  const { closeModal, displayLoginModal, displaySuccessModal, errorModal } = props;
  return (
    <div>
      <ModalsWrapper visible={displayLoginModal.isVisible} modalName={MODAL_LOGIN} closeModal={closeModal}/>
    </div>
  );
}

Modals.propTypes = {
  closeModal: PropTypes.func.isRequired,
  displayLoginModal: PropTypes.object.isRequired,
  displaySuccessModal: PropTypes.object.isRequired,
  errorModal: PropTypes.object.isRequired,
};

function mapStateToProps({modals}) {
  return modals;
}

function mapDispatchToProps(dispatch) {
  return {
    closeModal: (modalName) => dispatch(actions.closeModal(modalName)),
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Modals);
