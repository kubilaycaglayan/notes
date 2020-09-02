const deepFreeze = require('deep-freeze');
const expect = require('expect');

const toggleTodo = todo => {
  return {
    ...todo,
    completed: !todo.completed,
  }
}

const testToggleTodo = (() => {
  const todoBefore = {
    id: 0,
    text: 'todo',
    completed: false,
  }
  const todoAfter = {
    id: 0,
    text: 'todo',
    completed: true,
  }

  deepFreeze(todoBefore);

  expect(toggleTodo(todoBefore)).toEqual(todoAfter);
  expect(toggleTodo(todoAfter)).toEqual(todoBefore);
})();