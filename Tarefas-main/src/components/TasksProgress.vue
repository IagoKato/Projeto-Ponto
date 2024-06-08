<script>
export default {
  props: {
    progress: {type: Number, defaout: 0}
  }
}

</script>

<template>
  <div class="task-progress">
    <span class="progress-value">{{ progress }}%</span>
    <div class="progress-bar" :style="{width: progress + '%'}"></div>
  </div>
</template>

<style scoped>
.task-progress {
  position: relative;
  width: 80%;
  border: 1px solid #fff;
  border-radius: 8px;
  margin-bottom: 15px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.progress-bar {
  position: absolute;
  border-radius: 8px;
  height: 100%;
  background-color: #4caf50;
  align-self: flex-start;
}

.progress-value {
  z-index: 1;
  font-size: 1.5rem;
}
</style>