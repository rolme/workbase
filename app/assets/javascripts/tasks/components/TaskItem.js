import React, { Component } from 'react';

export default class TaskItem extends Component {
  constructor() {
    super();
    this.toggleCompleted = this.toggleCompleted.bind(this);
    this.deleteTask = this.deleteTask.bind(this);
    this.editTask = this.editTask.bind(this);
  }

  toggleCompleted() {
    // TODO
    // TaskActions.toggleCompleted();
  }

  deleteTask() {
    // TODO
    // TaskActions.deleteTask();
  }

  editTask() {
    // TODO
    // TaskActions.editTask();
  }

  render() {
    let task = this.props.task;
    let completed = task.completed_at !== null;

    return (
      <tr className={ completed ? "task-completed" : ""}>
        <td><input type="checkbox" checked={completed} value={task.slug} /></td>
        <td className="task-title">{task.title}</td>
        <td className="task-due-date">{task.due_at}</td>
        <td className="task-actions">
          <i className="fa fa-pencil-square-o" aria-hidden="true"></i>
          <i className="fa fa-trash" aria-hidden="true"></i>
        </td>
      </tr>
    );
  }
}
