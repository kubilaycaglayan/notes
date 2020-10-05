import React from 'react';
import ReactDOM from 'react-dom';
import { createStore, combineReducers } from 'redux';


const todoPage = (() => {
  const visibilityFilter = (
    state = 'SHOW_ALL',
    action
  ) => {
    switch (action.type) {
      case 'SET_VISIBILITY_FILTER':
        return action.filter;
      default:
        return state;
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

  const todos = (state = [], action) => {
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

  const todoApp = combineReducers({
    todos,
    visibilityFilter
  })

  const store = createStore(todoApp)

  const FilterLink = ({
    filter,
    children,
    currentFilter,
  }) => {
    if (filter === currentFilter) {
      return <span>{children}</span>
    }
    return (
      <a
        href='#'
        onClick={e => {
          e.preventDefault();
          store.dispatch({
            type: 'SET_VISIBILITY_FILTER',
            filter
          })
        }}
      >
        {children}
      </a>
    )
  }

  const getVisibleTodos = (
    todos,
    filter,
  ) => {
    switch (filter) {
      case 'SHOW_ALL':
        return todos;
      case 'SHOW_ACTIVE':
        return todos.filter(t => !t.completed)
      case 'SHOW_COMPLETED':
        return todos.filter(t => t.completed)
    }
  }

  let nextTodo = 0;
  class TodoApp extends React.Component {
    render () {
      const {
        todos,
        visibilityFilter
      } = this.props;
      const visibleTodos = getVisibleTodos(
        todos,
        visibilityFilter
      )
      return (
        <div>
          <input ref={node => {this.input = node;}}>
          </input>
          <button
          onClick={() => {
            store.dispatch({
              type: 'ADD_TODO',
              text: `${this.input.value}.${nextTodo}`,
              id: nextTodo += 1
            });
            this.input.value = '';
          }}
          >
            Add Todo
          </button>
          <ul>
            {visibleTodos.map(todo =>
              <li
              key={todo.id}
              onClick={() => {
                store.dispatch({
                  type: 'TOGGLE_TODO',
                  id: todo.id,
                })
              }
              }
              style={{
                textDecoration:
                  todo.completed ?
                  'line-through' :
                  'none'
              }}
              >
                {todo.text}
              </li>
              )}
          </ul>
          <p>
            Show:
            {' '}
            <FilterLink
              filter= 'SHOW_ALL'
              currentFilter={visibilityFilter}
            >
              ALL
            </FilterLink>
            {' '}
            <FilterLink
              filter= 'SHOW_ACTIVE'
              currentFilter={visibilityFilter}
            >
              Active
            </FilterLink>
            {' '}
            <FilterLink
              filter= 'SHOW_COMPLETED'
              currentFilter={visibilityFilter}
            >
              Completed
            </FilterLink>
          </p>
        </div>
      )
    }
  }

  const render = () => {
    ReactDOM.render(
      <TodoApp
        {...store.getState()}
      />,
      document.getElementById('root')
    )
  }

  store.subscribe(render);
  render();
})()

export default todoPage;
