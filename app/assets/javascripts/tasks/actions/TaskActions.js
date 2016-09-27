import TaskDispatcher from '../dispatcher/TaskDispatcher';
import TaskConstants from '../constants/TaskConstants';
import axios from 'axios';

export function setInitialStore(store) {
  // This applies the data that comes from rails on page load to the store
  TaskDispatcher.dispatch({
    type: TaskConstants.INITIAL_STORE,
    payload: store,
  });
}

export function createTask(payload) {
  axios.post("/tasks", payload)
    .then((data) => {
      TaskDispatcher.dispatch({
        type: TaskConstants.CREATE_TASK,
        payload: data.data,
      });
    })
    .catch((err) => {
    });
}

export function updateTask(payload) {
  // TODO
  // let slug = 'xxx';
  // axios.patch("/tasks/" + slug, payload)
  //   .then((data) => {

  //   })
  //   .catch((err) => {

  //   });
}

export function deleteTask(id) {
  // TODO
  // TaskDispatcher.dispatch({
  //   type: TaskConstants.DELETE_TASK,
  //   payload: id,
  // });
}

export function fetchTasks() {
  TaskDispatcher.dispatch({
    type: TaskConstants.FETCH_TASKS,
    payload: null,
  });
  axios("/tasks/as_json").then((payload) => {
    TaskDispatcher.dispatch({
      type: TaskConstants.RECEIVE_TASKS,
      payload: payload.data,
    });
  }).catch((err) => {
    TaskDispatcher.dispatch({
      type: TaskConstants.FETCH_TASKS_ERROR,
      payload: err,
    });
  });
}
