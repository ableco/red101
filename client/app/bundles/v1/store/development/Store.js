import { applyMiddleware, createStore, compose } from 'redux';
import middleware from 'redux-thunk';
import reducers from '../../reducers';

/*
 *  Export a function that takes the props and returns a Redux store
 *  This is used so that 2 components can have the same store.
 */
export default (props, railsContext) => {
  props.railsContext = railsContext;
  return compose(
          applyMiddleware(middleware),
          window.devToolsExtension ? window.devToolsExtension() : f => f
        )(createStore)(reducers, props);
};
