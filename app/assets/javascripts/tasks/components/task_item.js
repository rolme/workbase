import React, { PropTypes } from 'react';

const TaskItem = ({ task }) => {
  const completed = task.completed_at !== null;

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

TaskItem.propTypes = {
  task: PropTypes.object.isRequired
};

export default TaskItem;
