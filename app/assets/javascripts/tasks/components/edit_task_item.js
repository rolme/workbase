import React, { Component, PropTypes } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import * as TaskActions from '../actions/task_actions';

class EditTaskItem extends Component {
  constructor(props, context) {
    super(props, context);

    this.state = {
      authenticity_token: null,
    };

    this.updateTask = this.updateTask.bind(this);
    this.stopEditing = this.stopEditing.bind(this);
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

  updateTask() {
    // build the task props from the inputs
    let props = {
      // slug: this.refs.slug.value.trim(),
      title:  this.refs.title.value.trim(),
      due_at: this.refs.due_date.value.trim(),
      authenticity_token: this.state.authenticity_token,
    };

    if (props.title === "") return;

    this.props.actions.updateTask(this.props.task, props);
  }

  stopEditing() {
    this.props.actions.stopEditing();
  }

  render() {
    const { task } = this.props;
    return (
      <tr>
        <td></td>
        <td className="task-title"><input name="title" defaultValue={task.title} ref="title" placeholder="Enter a description" /></td>
        <td className="task-due-date"><input name="due_date" defaultValue={task.due_at} ref="due_date" placeholder="MM/DD/YYYY" /></td>
        <td className="task-actions">
          <input type="hidden" name="slug" defaultValue={task.slug} ref="slug" />
          <i className="fa fa-save" aria-hidden="true" onClick={this.updateTask}></i>
          <i className="fa fa-ban" aria-hidden="true" onClick={this.stopEditing}></i>
        </td>
      </tr>
    );
  }
}

EditTaskItem.propTypes = {
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

export default connect(mapStateToProps, mapDispatchToProps)(EditTaskItem);
