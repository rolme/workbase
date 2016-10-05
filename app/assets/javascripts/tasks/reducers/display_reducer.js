import * as types from '../actions/action_types';

// to control when we are editing a task
export function editingReducer(state = null, action) {
  switch (action.type) {
    default:
      return state;
  }
}

// to control when we are adding a new task
export function creatingReducer(state = false, action) {
  switch (action.type) {
    case types.ADD_NEW_TASK_FORM:
      return true;
    case types.POST_TASK_SUCCESS:
      return false;
    default:
      return state;
  }
}

// to control any message for the user
// ex: 'Task created', 'Task deleted'
export function messageReducer(state = null, action) {
  switch (action.type) {
    case types.POST_TASK:
      return 'Saving Task';
    case types.POST_TASK_SUCCESS:
      return 'Task saved';
    case types.POST_TASK_ERROR:
      return 'Task could not be saved';
    default:
      return state;
  }
}
