# Informações dos arquivos dentro do projeto

## Arquivo NewTaks.vue

# Componente de Adição de Tarefas

Este é um componente Vue.js que representa um formulário simples para adicionar novas tarefas.

# Funcionalidades

- Adição de novas tarefas através do formulário.
- Emite um evento 'taskAdded' ao adicionar uma tarefa, transmitindo o nome da tarefa.

## Estrutura do Código
```
Javascript
<script> 
export default {
  data() {
    return {
      name: ''  // Armazena o nome da nova tarefa
    }
  },
  methods: {
    add() {
      // Emite um evento 'taskAdded' com o nome da tarefa quando o botão ou a tecla Enter são pressionados
      this.$emit('taskAdded', { name: this.name })
      
      // Limpa o campo de entrada após adicionar a tarefa
      this.name = ''
    }
  }
}
</script>
```
# data: Inicializa o estado do componente, definindo uma propriedade chamada name que será 
#  para armazenar o nome da nova tarefa.

# methods: Define um método chamado add que é invocado quando o botão é clicado ou a tecla Enter é pressionada. 
# Este método emite um evento chamado 'taskAdded' passando um objeto contendo o nome da tarefa. Após emitir o evento, 
# o campo name é limpo.
```
HMTL
<template> 
  <div class="new-tasks">
    <!-- Campo de entrada para o nome da nova tarefa -->
    <input v-model="name" @keydown.enter="add" type="text" class="form-element" placeholder="Nova tarefa">
    
    <!-- Botão para adicionar a tarefa -->
    <button class="form-element" @click="add">+</button>
  </div>
</template>
```
# <input>: Um campo de entrada de texto vinculado ao estado name usando v-model. 
# O evento @keydown.enter está associado ao método add, o que significa que a função add 
# será chamada quando a tecla Enter for pressionada.

# <button>: Um botão que chama o método add quando é clicado.

***********************************************************************************************************************

## Arquivo Task.vue

# Componente Vue.js - Tarefa

O componente Task.vue representa uma tarefa em um aplicativo Vue.js. 
Cada tarefa tem um nome e pode estar em um estado pendente ou concluído.

# Estrutura do Código

```
HMTL
<template> 
  <div @click="$emit('taskStateChanged', task)"
       class="task" :class="stateClass">
    <!-- Botão para excluir a tarefa -->
    <span @click.stop="$emit('taskDeleted', task)" class="close">X</span>
    <!-- Nome da tarefa -->
    <p>{{ task.name }}</p>
  </div>
</template>
```
# <div>: O contêiner principal da tarefa. Emite um evento taskStateChanged quando clicado, passando a tarefa como parâmetro.

# <span>: Um botão para excluir a tarefa. Emite um evento taskDeleted quando clicado, passando a tarefa como parâmetro.

# <p>: Exibe o nome da tarefa.
```
Javascript
<script>
export default {
  props: {
    task: {type: Object, required: true}
  },
  computed: {
    // Calcula dinamicamente a classe com base no estado da tarefa
    stateClass() {
      return {
        pending: this.task.pending,
        done: !this.task.pending
      }
    }
  }
}
</script>
```
# props: Define uma propriedade chamada task como um objeto obrigatório.

# computed: Calcula dinamicamente a classe da tarefa com base no estado (pending ou done). 
# A classe é utilizada para aplicar estilos diferentes ao componente.

********************************************************************************************************************

## Arquivo TaskGrid.vue

# Componente Vue.js - Grade de Tarefas

O componente `TaskGrid.vue` é responsável por exibir uma grade de tarefas usando o componente `Task`.

## Estrutura do Código

```
Javascript
<script>
import Task from "./Task.vue";

export default {
  components: { Task },
  props: {
    tasks: { type: Array, required: true }
  }
}
</script>
```
# components: Importa o componente Task para ser utilizado dentro do componente TaskGrid.

# props: Define uma propriedade chamada tasks como um array obrigatório. 
# Este array contém as tarefas a serem exibidas na grade.
```
HMTL
<template>
  <div class="task-grid">
    <!-- Verifica se existem tarefas para exibir -->
    <template v-if="tasks.length > 0">
      <!-- Itera sobre as tarefas e renderiza o componente Task para cada uma -->
      <Task v-for="(task, i) in tasks" :key="task.name" @taskDeleted="$emit('taskDeleted', i)"
            @taskStateChanged="$emit('taskStateChanged', i)" :task="task"></Task>
    </template>
    <!-- Exibe mensagem quando não há tarefas -->
    <p v-else class="no-task">Tarefas em dia</p>
  </div>
</template>
```
# <div>: Contêiner principal que exibe a grade de tarefas.

# <template v-if="tasks.length > 0">: Verifica se existem tarefas para exibir.

# <Task>: Componente Task é renderizado para cada tarefa presente no array.

# <p v-else class="no-task">: Exibe uma mensagem quando não há tarefas, indicando que as tarefas estão em dia.

***************************************************************************************************************

## Arquivo TasksProgress.vue

# Componente Vue.js - Barra de Progresso de Tarefas

O componente `TasksProgress.vue` exibe uma barra de progresso para representar o andamento das tarefas.

## Estrutura do Código

```
Javascript
<script>
export default {
  props: {
    progress: { type: Number, default: 0 }
  }
}
</script>
```

# props: Define uma propriedade chamada progress como um número, com o valor padrão de 0. 
# Essa propriedade representa o progresso das tarefas em percentagem.
```
HMTL
<template>
  <div class="task-progress">
    <!-- Exibe o valor do progresso em porcentagem -->
    <span class="progress-value">{{ progress }}%</span>
    <!-- A barra de progresso com largura dinâmica baseada no progresso -->
    <div class="progress-bar" :style="{ width: progress + '%' }"></div>
  </div>
</template>
```
# <div class="task-progress">: Contêiner principal para o componente de barra de progresso.

# <span class="progress-value">: Exibe o valor do progresso em porcentagem.

# <div class="progress-bar": A barra de progresso propriamente dita, com a largura sendo definida 
# dinamicamente com base no valor do progresso.

********************************************************************************************************************

## Arquivo App.vue

# Componente Vue.js - Aplicativo de Tarefas

O arquivo `App.vue` é o componente principal do aplicativo de tarefas, que utiliza outros componentes como 
`TasksProgress`, `NewTasks` e `TaskGrid`.

## Estrutura do Código

```
HTML
<template>
  <div id="app">
    <!-- Título do aplicativo -->
    <h1>Tarefas</h1>
    
    <!-- Componente de barra de progresso de tarefas -->
    <TasksProgress :progress="progress"/>
    
    <!-- Componente de adição de novas tarefas -->
    <NewTasks @taskAdded="addTask"/>
    
    <!-- Componente de grade de tarefas -->
    <TaskGrid :tasks="tasks"
              @taskDeleted="deleteTask" @taskStateChanged="toggleTaskState"/>
  </div>
</template>

```

# <div id="app">: Contêiner principal do aplicativo.

# <h1>: Título do aplicativo.

# <TasksProgress>: Componente de barra de progresso de tarefas.

# <NewTasks>: Componente de adição de novas tarefas.

# <TaskGrid>: Componente de grade de tarefas.

```
Javascript
<script>
import TasksProgress from "./components/TasksProgress.vue";
import NewTasks from "./components/NewTasks.vue";
import TaskGrid from "./components/TaskGrid.vue";

export default {
  components: { TasksProgress, NewTasks, TaskGrid },
  data() {
    return {
      tasks: [
        { name: 'Finalizado', pending: false },
        { name: 'Pendente', pending: true },
      ]
    }
  },
  computed: {
    // Calcula dinamicamente o progresso das tarefas
    progress() {
      const total = this.tasks.length
      const done = this.tasks.filter(t => !t.pending).length
      return Math.round(done / total * 100) || 0
    }
  },
  watch: {
    // Observador de mudanças nas tarefas para salvar no localStorage
    tasks: {
      deep: true,
      handler() {
        localStorage.setItem('tasks', JSON.stringify(this.tasks))
      }
    }
  },
  methods: {
    // Adiciona uma nova tarefa
    addTask(task) {
      const sameName = t => t.name === task.name
      const reallyNew = this.tasks.filter(sameName).length == 0
      if (reallyNew) {
        this.tasks.push({
          name: task.name,
          pending: task.pending || true
        })
      }
    },
    // Deleta uma tarefa
    deleteTask(i) {
      this.tasks.splice(i, 1)
    },
    // Alterna o estado de uma tarefa (pendente/concluída)
    toggleTaskState(i) {
      this.tasks[i].pending = !this.tasks[i].pending
    }
  },
  created() {
    // Carrega as tarefas do localStorage quando o componente é criado
    const json = localStorage.getItem('tasks')
    const array = JSON.parse(json)
    this.tasks = Array.isArray(array) ? array : []
  }
}
</script>
```
# components: Importa e registra os componentes utilizados no aplicativo.

# data: Inicializa o estado do componente, com uma lista inicial de tarefas.

# computed: Calcula dinamicamente o progresso das tarefas com base no número de tarefas concluídas.

# watch: Observa as mudanças nas tarefas para salvá-las no localStorage.

# methods: Define métodos para adicionar, deletar e alterar o estado das tarefas.

# created: Carrega as tarefas do localStorage quando o componente é criado.