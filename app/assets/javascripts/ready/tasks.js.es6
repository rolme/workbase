import React from 'react';
import ReactDOM from 'react-dom';
import TaskApp from '../tasks/components/TaskApp';

export default class Tasks {
  index() {
    let tasks = $('#task-app').data('tasks');
    ReactDOM.render(<TaskApp tasks={tasks} />, document.getElementById('task-app'));
  }
}

App.tasks = new Tasks();
