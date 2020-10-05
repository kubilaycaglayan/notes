const deepFreeze = require('deep-freeze');
const expect = require('expect');

const todos = (state, action) => {
  switch (action.type) {
    case 'ADD_TODO':
      return [
        ...state,
        {
          id: action.id,
          text: action.text,
          completed: false,
        }
      ]
    case 'TOGGLE_TODO':
      return state.map(todo => {
        if (action.id !== todo.id) {
          return todo;
        }

        return {
          ...todo,
          completed: !todo.completed,
        }
      })
    default:
      return state;
  }
}

const testAddTodo = (() => {
  const stateBefore = [
    {
      id: 0,
      text: 'Learn Redux',
      completed: false,
    },
    {
      id: 1,
      text: 'Run',
      completed: false,
    }
  ];
  const action = {
    type: 'TOGGLE_TODO',
    id: 1,
  }
  const stateAfter = [
    {
      id: 0,
      text: 'Learn Redux',
      completed: false,
    },
    {
      id: 1,
      text: 'Run',
      completed: true,
    }
  ];

  deepFreeze(stateBefore);
  deepFreeze(action);

  expect(todos(stateBefore, action)).toEqual(stateAfter);
  expect(todos(stateAfter, action)).toEqual(stateBefore);

})();