import EventEmitter from 'events';
import Dispatcher from '../dispatcher/TaskDispatcher';
import Constants from '../constants/TaskConstants';

const CHANGE_EVENT = 'change';
let _store = {
  loading: false,
  tasks: [],
};

class TaskStore extends EventEmitter {
  constructor() {
    super();
  }

  getAll() {
    return _store;
  }

  emitChange() {
    this.emit(CHANGE_EVENT);
  }

  handleActions(action) {
    switch(action.type) {
      case "CREATE_TASK": {
        _store.tasks.push(action.payload);
        this.emitChange();
        break;
      }
      case "RECEIVE_TASKS": {
        _store.tasks = action.payload;
        _store.loading = false;
        this.emitChange();
        break;
      }
      case "DELETE_TASK": {
        // TODO
        // _store.tasks.splice(action.id, 1);
        // this.emitChange();
        break;
      }
      case "FETCH_TASKS": {
        _store.loading = true;
        this.emitChange();
        break;
      }
      case "FETCH_TASKS_ERROR": {
        _store.loading = false;
        this.emitChange();
        break;
      }
      case "INITIAL_STORE": {
        _store = action.payload;
        // do not emit change here
        break;
      }
    }
  }
}

const taskStore = new TaskStore;

Dispatcher.register(taskStore.handleActions.bind(taskStore));

export default taskStore;
