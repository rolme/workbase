import axios from 'axios';

const TaskApi = {
  getAllTasks() {
    return axios("/internal/tasks");
  },
  updateTask(task, props) {
    return axios.put(`/internal/tasks/${task.slug}`, props);
  },
  deleteTask(task, props) {
    return axios.delete(`/internal/tasks/${task.slug}`, { data: props });
  }
}

export default TaskApi;
