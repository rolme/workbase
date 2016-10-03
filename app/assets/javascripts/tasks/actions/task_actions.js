import * as types from './action_types';
import TaskApi from '../api/task_api';

// action creator
export function createTask(task) {
  // returns an action
  return { type: types.CREATE_TASK, task };
}

export function updateTask(task) {
  return { type: types.UPDATE_TASK, task };
}

export function startEditing(task) {
  return { type: types.START_EDITING, task };
}

export function deleteTask(task_) {
  return { type: types.DELETE_TASK, task };
}

export function loadTasksSuccess(tasks) {
  return { type: types.LOAD_TASKS_SUCCESS, tasks };
}

export function toggleCompleted(task, props) {
  return function(dispatch) {
    return TaskApi.updateTask(task, props).then(response => {
      dispatch(updateTask(response.data));
    }).catch(error => {
      throw(error);
    });
  }
}

export function loadTasks() {
  return function(dispatch) {
    return TaskApi.getAllTasks().then(response => {
      dispatch(loadTasksSuccess(response.data));
    }).catch(error => {
      throw(error);
    });
  }
}
