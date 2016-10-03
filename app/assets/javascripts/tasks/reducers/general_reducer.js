import * as types from '../actions/action_types';

// will handle other state of task app
// like: is_loading, editing, etc
export default function generalReducer(state = {}, action) {
  switch (action.type) {
    case types.LOAD_TASKS_SUCCESS:
      return {
        is_loading: false,
        message: 'Tasks loaded',
      };
    case types.LOAD_TASKS_ERROR:
      return {
        is_loading: false,
        message: action.error.message,
      };
    case types.LOADING_TASKS:
      return {
        is_loading: true,
        message: null,
      };

    default:
      return state;
  }
}
