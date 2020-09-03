let nextTodo = 0;
const addTodo = text => {
  return {
    type: 'ADD_TODO',
    id: nextTodo += 1,
    text,
  }
}

export default addTodo;