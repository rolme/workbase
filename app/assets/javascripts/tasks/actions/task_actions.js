import * as types from './action_types';
import TaskApi from '../api/task_api';

// action creator
export function createTask(task) {
  // returns an action
  return { type: types.CREATE_TASK, task };
}

export function createNew() {
  return { type: types.ADD_NEW_TASK_FORM };
}

export function updateTask(task) {
  return { type: types.UPDATE_TASK, task };
}

export function startEditing(task) {
  return { type: types.START_EDITING, task };
}

export function removeTask(task_slug) {
  return { type: types.DELETE_TASK, task_slug };
}

export function loadingTasks() {
  return { type: types.LOADING_TASKS };
}

export function loadTasksSuccess(tasks) {
  return { type: types.LOAD_TASKS_SUCCESS, tasks };
}

export function loadTasksError(error) {
  return { type: types.LOAD_TASKS_ERROR, error };
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
    dispatch(loadingTasks());
    return TaskApi.getAllTasks().then(response => {
      dispatch(loadTasksSuccess(response.data));
    }).catch(error => {
      dispatch(loadTasksError(error));
    });
  }
}

export function deleteTask(task, props) {
  return function(dispatch) {
    return TaskApi.deleteTask(task, props).then(response => {
      dispatch(removeTask(response.data.slug));
    }).catch(error => {
      throw(error);
    });
  }
}
