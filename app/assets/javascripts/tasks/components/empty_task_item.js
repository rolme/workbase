import React, { Component, PropTypes } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import * as TaskActions from '../actions/task_actions';

class EmptyTaskItem extends Component {
  constructor(props, context) {
    super(props, context);

    this.state = {
      authenticity_token: null,
    };

    this.saveTask = this.saveTask.bind(this);
  }

  componentDidMount() {
    this.setState(
        Object.assign(
            {},
            this.state,
            { authenticity_token: $('meta[name=csrf-token]').attr('content') }
        )
    );
  }

  saveTask() {
    // build the task props from the inputs
    let props = {
      title:  this.refs.title.value.trim(),
      due_at: this.refs.due_at.value.trim(),
      authenticity_token: this.state.authenticity_token,
    };

    if (props.title === "") return;

    this.props.actions.createTask(props);
  }

  render() {
    return (
      <tr>
        <td></td>
        <td className="task-title"><input name="title" ref="title" placeholder="Enter a description" /></td>
        <td className="task-due-date"><input name="due_at" ref="due_at" placeholder="MM/DD/YYYY" /></td>
        <td className="task-actions">
          <i className="fa fa-save" aria-hidden="true" onClick={this.saveTask}></i>
        </td>
      </tr>
    );
  }
}

EmptyTaskItem.propTypes = {
};

function mapStateToProps(state, ownProps) {
  return {
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(TaskActions, dispatch)
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(EmptyTaskItem);
