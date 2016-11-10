import axios from 'axios';

const token = '9Pwk2FbhBgy8CHfMmNKryiSu'; // TODO: Find a way to pass this in.

const api = axios.create({
    baseURL: "/api/tasks", // TODO: Should we consider passing this in as well?
    timeout: 1000,
    headers: {"Authorization": `Token token=${token}`}
});

const TaskApi = {
  getAllTasks() {
    return api.get();
  },
  updateTask(task, props) {
    return api.put(task.slug, props);
  },
  deleteTask(task, props) {
    return api.delete(task.slug, { data: props });
  },
  createTask(task) {
    return api.post("", task);
  }
}

export default TaskApi;
