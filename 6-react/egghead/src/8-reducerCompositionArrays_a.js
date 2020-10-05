const deepFreeze = require('deep-freeze');
const expect = require('expect');

const todo = (state, action) => {
  switch (action.type) {
    case 'ADD_TODO':
      return {
          id: action.id,
          text: action.text,
          completed: false,
        }
    case 'TOGGLE_TODO':
      if (action.id !== state.id) {
        return state;
      }

      return {
        ...state,
        completed: !state.completed,
      }
    default:
      return state;
  }
}

const todos = (state, action) => {
  switch (action.type) {
    case 'ADD_TODO':
      return [
        ...state,
        todo(undefined, action)
      ]
    case 'TOGGLE_TODO':
      return state.map(t => todo(t, action))
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