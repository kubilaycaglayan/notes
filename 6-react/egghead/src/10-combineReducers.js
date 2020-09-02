const deepFreeze = require('deep-freeze');
const expect = require('expect');
// const { combineReducers } = require('redux');

const visibilityFilter = (
  state = 'SHOW_ALL',
  action
) => {
  switch (action.type) {
    case 'SET_VISBILITY_FILTER':
      return action.filter;
    default:
      state;
  }
}

const todoApp = (
  state = {},
  action
) => {
  return {
    todos: todos(
      state.todos,
      action
    ),
    visibilityFilter: visibilityFilter(
      state.visibilityFilter,
      action
    )
  }
}

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

const combineReducers = (reducers) => {
 return (state = {}, action) => {
   return Object.keys(reducers).reduce(
     (nextState, key) => {
       nextState[key] = reducers[key](
         state[key],
         action
       );
       return nextState;
     },
     {}
   )
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