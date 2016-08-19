export const DISPLAY_FORM = "DISPLAY_FORM";

export function displayForm(formName) {
  return {
    type: DISPLAY_FORM,
    formName,
  };
}
