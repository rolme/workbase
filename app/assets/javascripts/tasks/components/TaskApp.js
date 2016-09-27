import React, { Component } from 'react';
import * as TaskActions from '../actions/TaskActions';
import TaskStore from '../stores/TaskStore';

import TaskList from './TaskList';
import TaskForm from './TaskForm';

export default class TaskApp extends Component {
  constructor(props) {
    super(props);

    this.getTasks = this.getTasks.bind(this);
    this.state = {
      loading: false,
      tasks: this.props.tasks,
    };

    TaskActions.setInitialStore(this.state);
  }

  componentWillMount() {
    TaskStore.on("change", this.getTasks);
  }

  componentWillUnmount() {
    TaskStore.removeListener("change", this.getTasks);
  }

  getTasks() {
    this.setState(TaskStore.getAll());
  }

  handleClick() {
    TaskActions.fetchTasks();
  }

  render() {
    let { tasks } = this.state;

    return (
      <div id='TaskList'>
        <h4>
          <button className="btn btn-default pull-right" onClick={this.handleClick}>Refresh List</button>
        </h4>
        <p className="text-muted"><em>Your current tasks are listed below.</em></p>
        <TaskList tasks={tasks} />
        <TaskForm />
      </div>
    );
  }
}
