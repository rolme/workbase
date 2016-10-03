import axios from 'axios';

const TaskApi = {
  getAllTasks() {
    return axios("/internal/tasks");
  },
  updateTask(task, props) {
    return axios.put(`/internal/tasks/${task.slug}`, props);
  }
}

export default TaskApi;
