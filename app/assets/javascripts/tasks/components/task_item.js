import React, { PropTypes } from 'react';

const TaskItem = ({ task, toggleCompleted, startEditing, deleteTask }) => {
  const completed = task.completed_at !== null;

  return (
    <tr className={ completed ? "task-completed" : ""}>
      <td><input type="checkbox" defaultChecked={completed} value={task.slug} onChange={(e) => toggleCompleted(task, e.target.checked)} /></td>
      <td className="task-title">{task.title}</td>
      <td className="task-due-date">{task.due_at}</td>
      <td className="task-actions">
        <i className="fa fa-pencil-square-o" onClick={() => startEditing(task)} aria-hidden="true"></i>
        <i className="fa fa-trash" onClick={() => deleteTask(task)} aria-hidden="true"></i>
      </td>
    </tr>
  );
}

TaskItem.propTypes = {
  task: PropTypes.object.isRequired,
  toggleCompleted: PropTypes.func.isRequired,
  startEditing: PropTypes.func.isRequired,
  deleteTask: PropTypes.func.isRequired,
};

export default TaskItem;
