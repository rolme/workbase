import React from 'react';
import { render } from 'react-dom';
import { Provider } from 'react-redux';
import ConfigureStore from '../tasks/store/configure_store';
import TaskApp from '../tasks/components/task_app';

class Tasks {
  index() {
    let tasks = $('#task-app').data('tasks');
    const store = ConfigureStore({ tasks }); // this provides default state

    render(
      <Provider store={store}>
        <TaskApp tasks={tasks} />
      </Provider>,
      document.getElementById('task-app')
    );
  }
}

App.tasks = new Tasks();
