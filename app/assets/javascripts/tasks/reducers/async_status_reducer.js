import * as types from '../actions/action_types';

// to control a loading indicator
export default function asyncStatusReducer(state = false, action) {
  switch (action.type) {
    case types.LOAD_TASKS_SUCCESS:
      return false;
    case types.LOAD_TASKS_ERROR:
      return false;
    case types.LOADING_TASKS:
      return true;

    default:
      return state;
  }
}
