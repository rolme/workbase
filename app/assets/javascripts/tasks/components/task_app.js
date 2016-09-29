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
      loading: false,
      tasks: [],
    };

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.props.actions.loadTasks();
  }

  render() {
    const { tasks } = this.props;
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
