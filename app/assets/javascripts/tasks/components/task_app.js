import React, { Component, PropTypes } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import * as TaskActions from '../actions/task_actions';

import TaskList from './task_list';
import TaskForm from './task_form';

class TaskApp extends Component {
  constructor(props, context) {
    super(props, context);
    this.state = {
      order: 'title', // default order column
      editing: null, // slug of task being edited
      authenticity_token: null, // authenticity token
    }

    this.handleClick = this.handleClick.bind(this);
    this.toggleCompleted = this.toggleCompleted.bind(this);
    this.startEditing = this.startEditing.bind(this);
    this.deleteTask = this.deleteTask.bind(this);
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

  deleteTask(task) {
    this.props.actions.deleteTask(task);
  }

  render() {
    const { tasks } = this.props;
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
        <h4>
          <button className="btn btn-default pull-right" onClick={this.handleClick}>Refresh List</button>
        </h4>
        <p className="text-muted"><em>Your current tasks are listed below.</em></p>
        <TaskList tasks={sortedTasks} toggleCompleted={this.toggleCompleted} startEditing={this.startEditing} deleteTask={this.deleteTask}/>
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
    tasks: state.tasks
  };
}

function mapDispatchToProps(dispatch) {
  return {
    // this maps all actions from task actions to props as well as wraps them in dispatch
    actions: bindActionCreators(TaskActions, dispatch)
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(TaskApp);
