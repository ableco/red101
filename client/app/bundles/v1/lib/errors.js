class Errors {
  constructor(errors) {
    this.errors = errors;
  }

  for(field) {
    const fieldErrors = this.errors[field];
    return fieldErrors ? fieldErrors[0] : null;
  }
}

export default Errors;
