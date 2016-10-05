import React, { Component, PropTypes } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import * as TaskActions from '../actions/task_actions';

import TaskList from './task_list';

class TaskApp extends Component {
  constructor(props, context) {
    super(props, context);
    this.state = {
      tasks: [],                // initial tasks loaded
      order: 'title',           // default order column
      is_editing: null,         // slug of task being edited
      is_creating: false,       // are we adding a new task
      is_loading: false,
      message: null,            // any status message for the user
      authenticity_token: null, // authenticity token
    }

    this.handleClick = this.handleClick.bind(this);
    this.toggleCompleted = this.toggleCompleted.bind(this);
    this.startEditing = this.startEditing.bind(this);
    this.deleteTask = this.deleteTask.bind(this);
    this.createNew = this.createNew.bind(this);
  }

  componentDidMount() {
    let newState = Object.assign({}, this.state, { authenticity_token: $('meta[name=csrf-token]').attr('content') });
    this.setState(newState);
  }

  handleClick() {
    this.props.actions.loadTasks();
  }

  toggleCompleted(task, checked) {
    this.props.actions.toggleCompleted(task, { completed_at: checked, authenticity_token: this.state.authenticity_token });
  }

  startEditing(task) {
    this.props.actions.startEditing(task);
  }

  createNew() {
    this.props.actions.createNew();
  }

  deleteTask(task) {
    this.props.actions.deleteTask(task, { authenticity_token: this.state.authenticity_token });
  }

  render() {
    const { tasks, is_loading, is_creating, message } = this.props;

    // sort task list
    const sortedTasks = [...tasks].sort((a,b) => {
      let field = this.state.order;
      if (a[field] > b[field]) {
        return 1;
      } else if (a[field] < b[field]) {
        return -1;
      }
      return 0;
    });

    return (
      <div id='TaskList'>
        {message != null
          ? <div className="alert alert-warning" role="alert">{message}</div>
          : ''
        }
        <h4>
          <button className="btn btn-xs btn-success pull-right" onClick={this.createNew}>Add</button>
          <button style={{ width: 120, marginRight: 5 }} className="btn btn-xs btn-default pull-right" onClick={this.handleClick}>
            {is_loading && <i className="fa fa-refresh fa-spin fa-fw"></i>}
            Refresh List
          </button>
        </h4>
        <p className="text-muted"><em>Your current tasks are listed below.</em></p>
        <TaskList
            tasks={sortedTasks}
            toggleCompleted={this.toggleCompleted}
            isCreating={is_creating}
            startEditing={this.startEditing}
            deleteTask={this.deleteTask} />
      </div>
    );
  }
}

TaskApp.propTypes = {
  tasks: PropTypes.array.isRequired,
  actions: PropTypes.object.isRequired,
};

// ownProps are the props passed to the component
function mapStateToProps(state, ownProps) {
  return {
    tasks: state.tasks,
    is_loading: state.is_loading,
    is_editing: state.is_editing,
    is_creating: state.is_creating,
    message: state.message,
  };
}

function mapDispatchToProps(dispatch) {
  return {
    // this maps all actions from task actions to props as well as wraps them in dispatch
    actions: bindActionCreators(TaskActions, dispatch)
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(TaskApp);
