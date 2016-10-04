import React, { PropTypes } from 'react';

const EmptyTaskItem = ({ saveTask }) => {
  return (
    <tr>
      <td></td>
      <td className="task-title"><input /></td>
      <td className="task-due-date"><input /></td>
      <td className="task-actions">
        <i className="fa fa-save" aria-hidden="true" onClick={() => saveTask({ fill: 'me in' })}></i>
      </td>
    </tr>
  );
}

EmptyTaskItem.propTypes = {
  saveTask: PropTypes.func.isRequired,
};

export default EmptyTaskItem;
