import * as types from './action_types';
import TaskApi from '../api/task_api';


////////////////////////////////////////////////////////////////  Create Actions


// action creator
export function createNew() {
  // returns an action
  return { type: types.ADD_NEW_TASK_FORM };
}

export function createTask(task) {
  return function(dispatch) {
    dispatch(postingTask());
    return TaskApi.createTask(task).then(response => {
      dispatch(postTaskSuccess(response.data));
    }).catch(error => {
      dispatch(postTaskError(error.message));
    });
  }
}

export function postingTask() {
  return { type: types.POST_TASK };
}

export function postTaskSuccess(task) {
  return { type: types.POST_TASK_SUCCESS, task };
}

export function postTaskError(message) {
  return { type: types.POST_TASK_ERROR, message };
}


//////////////////////////////////////////////////////////////////  Edit Actions


export function startEditing(task) {
  return { type: types.START_EDITING, task };
}

export function stopEditing() {
  return { type: types.STOP_EDITING };
}

export function putTaskSuccess(task) {
  return { type: types.PUT_TASK_SUCCESS, task };
}

export function putTaskError(message) {
  return { type: types.PUT_TASK_ERROR, message };
}

export function updateTask(task, props) {
  return function(dispatch) {
    return TaskApi.updateTask(task, props).then(response => {
      dispatch(putTaskSuccess(response.data));
      dispatch(stopEditing());
    }).catch(error => {
      dispatch(putTaskError(error.message))
    });
  }
  return { type: types.UPDATE_TASK, task };
}

export function toggleCompleted(task, props) {
  return function(dispatch) {
    return TaskApi.updateTask(task, props).then(response => {
      dispatch(putTaskSuccess(response.data));
    }).catch(error => {
      dispatch(putTaskError(error.message))
    });
  }
}


////////////////////////////////////////////////////////////////  Delete Actions


export function removeTask(task_slug) {
  return { type: types.DELETE_TASK, task_slug };
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


/////////////////////////////////////////////////////////////////  Fetch Actions


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

export function loadingTasks() {
  return { type: types.LOADING_TASKS };
}

export function loadTasksSuccess(tasks) {
  return { type: types.LOAD_TASKS_SUCCESS, tasks };
}

export function loadTasksError(error) {
  return { type: types.LOAD_TASKS_ERROR, error };
}
