import React, { Component } from 'react';
import * as TaskActions from '../actions/TaskActions';

export default class TaskForm extends Component {
  constructor() {
    super();
    this.addTask = this.addTask.bind(this);
  }

  addTask() {
    let taskTitle = this.refs.title.value.trim();
    let taskDueDate = this.refs.due_date.value.trim();
    if (taskTitle === "") return;
    let payload = {
      title: taskTitle,
      due_at: taskDueDate,
      authenticity_token: $('meta[name=csrf-token]').attr('content'),
    }
    TaskActions.createTask(payload);
  }

  render() {
    return (
      <div className="well">
        <form className="form-horizontal">
          <div className="form-group">
            <label className="col-sm-1 control-label">Title:</label>
            <div className="col-sm-11">
              <input className="form-control" name="title" ref="title" placeholder="Add a new task" />
            </div>
          </div>
          <div className="form-group">
            <label className="col-sm-1 control-label">Due:</label>
            <div className="col-sm-11">
              <input className="form-control" name="due_date" ref="due_date" placeholder="MM/DD/YYYY" />
            </div>
          </div>
          <div className="form-group">
            <div className="col-sm-offset-1 col-sm-11">
              <button className="btn btn-default" type="button" onClick={this.addTask} name="add-task">Add</button>
            </div>
          </div>
        </form>
      </div>
    );
  }
}
