import * as types from '../actions/action_types';

// will handle list of tasks
// defaults to no tasks
export default function taskReducer(state = [], action) {
  switch (action.type) {
    case types.CREATE_TASK:
      return [...state,
        Object.assign({}, action.task)
      ];

    case types.LOAD_TASKS_SUCCESS:
      return action.tasks;

    default:
      return state;
  }
}
