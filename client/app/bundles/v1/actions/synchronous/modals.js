export const DISPLAY_MODAL = "DISPLAY_MODAL";
export const CLOSE_MODAL = "CLOSE_MODAL";

export function displayModal(modalName, data) {
  return {
    type: DISPLAY_MODAL,
    modalName,
  };
}

export function closeModal(modalName) {
  return {
    type: CLOSE_MODAL,
    modalName,
  };
}
