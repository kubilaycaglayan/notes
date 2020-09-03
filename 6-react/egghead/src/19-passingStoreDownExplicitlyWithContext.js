import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { createStore, combineReducers } from 'redux';
import PropTypes from 'prop-types';


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

  const Link = ({
    active,
    children,
    onClick,
  }) => {
    if (active) {
      return <span>{children}</span>
    }
    return (
      <a
        href='#'
        onClick={e => {
          e.preventDefault();
          onClick();
        }}
      >
        {children}
      </a>
    )
  }

  class FilterLink extends Component {
    componentDidMount() {
      const { store } = this.context;
      this.unsubscribe = store.subscribe(() =>
        this.forceUpdate()
      );
    }

    componentWillUnmount() {
      this.unsubscribe();
    }

    render () {
      const props = this.props;
      const { store } = this.context;
      const state = store.getState();

      return (
        <Link
          active={
            props.filter ===
            state.visibilityFilter
          }
          onClick={() =>
            store.dispatch({
              type: 'SET_VISIBILITY_FILTER',
              filter: props.filter,
            })
          }
        >
          {props.children}
        </Link>
      )
    }
  }

  FilterLink.contextTypes = {
    store: PropTypes.object,
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

  const Todo = ({
    onClick,
    completed,
    text,
    key,
  }) => (
    <li
      key={key}
      onClick={onClick}
      style={{
        textDecoration:
          completed ?
          'line-through' :
          'none'
      }}
    >
      {text}
    </li>
  )

  const TodoList = ({
    todos,
    onTodoClick
  }) => (
    <ul>
      {todos.map(todo =>
        <Todo
          key={todo.id}
          {...todo}
          onClick={() => onTodoClick(todo.id)}
        />
        )}
    </ul>
  )

  const AddTodo = (props, { store }) => {
    let input;

    return (
      <div>
        <input ref={node => {input = node;}}>
        </input>
        <button
        onClick={() => {
          store.dispatch({
            type: 'ADD_TODO',
            id: nextTodo += 1,
            text: input.value,
          })
          input.value = '';
        }}
        >
          Add Todo
        </button>
      </div>
    )
  }

  AddTodo.contextTypes = {
    store: PropTypes.object,
  }

  const Footer = () => (
    <p>
      Show:
      {' '}
      <FilterLink
        filter= 'SHOW_ALL'
      >
        ALL
      </FilterLink>
      {' '}
      <FilterLink
        filter= 'SHOW_ACTIVE'
      >
        Active
      </FilterLink>
      {' '}
      <FilterLink
        filter= 'SHOW_COMPLETED'
      >
        Completed
      </FilterLink>
    </p>
  )

  class VisibleTodoList extends Component {
    componentDidMount() {
      const { store } = this.context;
      this.unsubscribe = store.subscribe(() =>
        this.forceUpdate()
      );
    }

    componentWillUnmount() {
      this.unsubscribe();
    }

    render () {
      const props = this.props;
      const { store } = this.context;
      const state = store.getState();

      return (
        <TodoList
          todos={
            getVisibleTodos(
              state.todos,
              state.visibilityFilter
            )
          }
          onTodoClick={id =>
            store.dispatch({
              type: 'TOGGLE_TODO',
              id,
            })
          }
        />
      )
    }
  }

  VisibleTodoList.contextTypes = {
    store: PropTypes.object,
  }

  let nextTodo = 0;
  const TodoApp = () => (
    <div>
      <AddTodo />
      <VisibleTodoList />
      <Footer />
    </div>
  )

  class Provider extends Component {
    getChildContext() {
      return {
        store: this.props.store
      }
    }

    render () {
      return this.props.children;
    }
  }

  Provider.childContextTypes = {
    store: PropTypes.object,
  }

  ReactDOM.render(
    <Provider store ={createStore(todoApp)} >
      <TodoApp />
    </Provider>,
    document.getElementById('root')
  )
})()

export default todoPage;
