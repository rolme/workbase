import * as types from '../actions/action_types';

// to control when we are editing a task
export function editingReducer(state = null, action) {
  switch (action.type) {
    case types.START_EDITING:
      return action.task.slug;
    case types.STOP_EDITING:
      return null;
    case types.PUT_TASK_SUCCESS:
      return null;
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
    case types.PUT_TASK:
      return 'Saving Task';
    case types.POST_TASK_SUCCESS:
    case types.PUT_TASK_SUCCESS:
      return 'Task saved';
    case types.POST_TASK_ERROR:
    case types.PUT_TASK_ERROR:
      return 'Task could not be saved';
    case types.CLEAR_MESSAGE:
      return null;
    default:
      return state;
  }
}
