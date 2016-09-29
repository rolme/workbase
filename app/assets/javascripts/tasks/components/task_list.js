import React, { PropTypes } from 'react';
import TaskItem from './task_item';

const TaskList = ({ tasks }) => {
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
        {tasks.map(task =>
          <TaskItem key={task.slug} task={task} />
        )}
      </tbody>
    </table>
  );
}

TaskList.propTypes = {
  tasks: PropTypes.array.isRequired
};

export default TaskList;
