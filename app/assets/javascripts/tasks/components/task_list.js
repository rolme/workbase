import React, { PropTypes } from 'react';
import TaskItem from './task_item';
import EmptyTaskItem from './empty_task_item';

const TaskList = ({ tasks, toggleCompleted, isCreating, startEditing, deleteTask }) => {
  return (
    <table className="table table-striped table-hover task-table">
      <thead>
        <tr>
          <th>&nbsp;</th>
          <th>Title</th>
          <th>Due</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {isCreating && <EmptyTaskItem />}
        {tasks.map(task =>
          <TaskItem key={task.slug} task={task} startEditing={startEditing} deleteTask={deleteTask} toggleCompleted={toggleCompleted} />
        )}
      </tbody>
    </table>
  );
}

TaskList.propTypes = {
  tasks: PropTypes.array.isRequired,
  toggleCompleted: PropTypes.func.isRequired,
  isCreating: PropTypes.bool.isRequired,
  startEditing: PropTypes.func.isRequired,
  deleteTask: PropTypes.func.isRequired,
};

export default TaskList;
