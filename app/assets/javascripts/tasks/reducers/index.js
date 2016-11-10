import { combineReducers } from 'redux';
import tasks from './task_reducer';
import { editingReducer as editing } from './display_reducer';
import { creatingReducer as creating } from './display_reducer';
import { messageReducer as message } from './display_reducer';
import async_status from './async_status_reducer';

const rootReducer = combineReducers({
  tasks,
  is_loading: async_status,
  is_editing: editing,
  is_creating: creating,
  message,
});

export default rootReducer;
