import * as types from '../actions/action_types';

// will handle list of tasks
// defaults to no tasks
export default function taskReducer(state = [], action) {
  switch (action.type) {
    case types.POST_TASK_SUCCESS:
      return [
        ...state,
        Object.assign({}, action.task)
      ];

    case types.LOAD_TASKS_SUCCESS:
      return action.tasks;

    case types.UPDATE_TASK:
      return [
        ...state.filter(task => task.slug !== action.task.slug),
        Object.assign({}, action.task)
      ];

    case types.DELETE_TASK:
      return [
        ...state.filter(task => task.slug !== action.task_slug)
      ];

    default:
      return state;
  }
}
