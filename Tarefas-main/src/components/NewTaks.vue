<script>
export default {
  data() {
    return {
      name: ''
    }
  },
  methods: {
    add() {
      this.$emit('taskAdded', {name: this.name})
      this.name = ''
    }
  }
}

</script>

<template>
  <div class="new-taks">
    <input v-model="name" @keydown.enter="add" type="text"
    class="form-element" placeholder="Nova tarefa">
    <button class="form-element" @click="add">+</button>
  </div>
</template>

<style scoped>
  .form-element{
    outline: none;
    font-size: 2rem;
    border: 1px solid #fff;
    padding: 5px 10px 8px;
    color: #000;
  }

  .new-taks {
    margin: 35px;
  }

  .input form-element{
    width: 500px;
    background: #fff2;
    border-top-left-radius: 8px;
    border-bottom-left-radius: 8px;
  }

  button.form-element {
    color: #fff;
    border-left: none;
    background-color: #2196f3;
    border-top-right-radius: 8px;
    border-bottom-right-radius: 8px;
  }
</style>