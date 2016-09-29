import { combineReducers } from 'redux';
import tasks from './task_reducer';

const rootReducer = combineReducers({
  tasks
});

export default rootReducer;
