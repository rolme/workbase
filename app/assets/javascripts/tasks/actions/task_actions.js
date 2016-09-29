import * as types from './action_types';
import TaskApi from '../api/task_api';

// action creator
export function createTask(task) {
  // returns an action
  return { type: types.CREATE_TASK, task };
}

export function loadTasksSuccess(tasks) {
  return { type: types.LOAD_TASKS_SUCCESS, tasks };
}

export function loadTasks() {
  return function(dispatch) {
    return TaskApi.getAllTasks().then(tasks => {
      dispatch(loadTasksSuccess(tasks));
    }).catch(error => {
      throw(error);
    });
  }
}
