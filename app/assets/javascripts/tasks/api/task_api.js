import axios from 'axios';

const TaskApi = {
  getAllTasks() {
    return axios("/api/tasks");
  },
  updateTask(task, props) {
    return axios.put(`/api/tasks/${task.slug}`, props);
  },
  deleteTask(task, props) {
    return axios.delete(`/api/tasks/${task.slug}`, { data: props });
  },
  createTask(task) {
    return axios.post(`/api/tasks`, task);
  }
}

export default TaskApi;
