import todos from './todos';
import visibilityFilter from './visibilityFilter';
import { combineReducers } from 'redux';

export default combineReducers({
  todos,
  visibilityFilter
});
