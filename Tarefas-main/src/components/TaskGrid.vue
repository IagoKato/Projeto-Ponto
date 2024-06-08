<script>
import Task from "./Task.vue";

export default {
  components: {Task},
  props: {
    tasks: {type: Array, required: true}
  }
}
</script>

<template>
  <div class="task-grid">
    <template v-if="tasks.length > 0">
      <Task v-for="(task, i) in tasks" :key="task.name" @taskDeleted="$emit('taskDeleted', i)"
            @taskStateChanged="$emit('taskStateChanged', i)" :task="task"></Task>
    </template>
    <p v-else class="no-task">Tarefas em dia</p>
  </div>
</template>


<style scoped>
.task-grid {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.task-grid .task {
  margin: 10px;
}

.no-task {
  color: #aaa;
  font-size: 1.7rem;
}

</style>