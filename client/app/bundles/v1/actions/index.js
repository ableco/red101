import synchronous from './synchronous';
import asynchronous from './asynchronous';

const actions = Object.assign({}, asynchronous, synchronous);

export default actions;
