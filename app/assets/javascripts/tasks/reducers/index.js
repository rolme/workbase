import { combineReducers } from 'redux';
import tasks from './task_reducer';
import general from './general_reducer';

const rootReducer = combineReducers({
  tasks,
  general,
});

export default rootReducer;
