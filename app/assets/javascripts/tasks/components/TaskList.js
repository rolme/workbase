import React, { Component } from 'react';
import TaskItem from './TaskItem';

export default class TaskList extends Component {
  render() {
    let tasks = this.props.tasks;
    let taskItems = tasks.map((task) => {
      return <TaskItem key={task.slug} task={task} />
    });

    return (
      <table className="table table-striped table-hover task-table">
        <thead>
          <tr>
            <th></th>
            <th>Title</th>
            <th>Due</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {taskItems}
        </tbody>
      </table>
    );
  }
}
