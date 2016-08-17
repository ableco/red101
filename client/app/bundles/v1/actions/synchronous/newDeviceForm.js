export const CREATE_DEVICE_START = 'newDeviceForm/CREATE_DEVICE_START';
export const CREATE_DEVICE_SUCCESS = 'newDeviceForm/CREATE_DEVICE_SUCESS';
export const CREATE_DEVICE_ERROR = 'newDeviceForm/CREATE_DEVICE_ERROR';

export function createDeviceStart() {
  return { type: CREATE_DEVICE_START };
}

export function createDeviceSuccess(device) {
  return { type: CREATE_DEVICE_SUCCESS, device };
}

export function createDeviceError(errors) {
  return { type: CREATE_DEVICE_ERROR, errors };
}
