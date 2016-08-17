export const UPDATE_PROFILE_FORM    = 'newProfileForm/UPDATE_PROFILE_FORM';
export const CREATE_PROFILE_START   = 'newProfileForm/CREATE_PROFILE_START';
export const CREATE_PROFILE_SUCCESS = 'newProfileForm/CREATE_PROFILE_SUCESS';
export const CREATE_PROFILE_ERROR   = 'newProfileForm/CREATE_PROFILE_ERROR';


export function updateProfileForm(key, value) {
  return { type: UPDATE_PROFILE_FORM, key, value };
}

export function createProfileStart() {
  return { type: CREATE_PROFILE_START };
}

export function createProfileSuccess(profile) {
  return { type: CREATE_PROFILE_SUCCESS, profile };
}

export function createProfileError(errors) {
  return { type: CREATE_PROFILE_ERROR, errors };
}
