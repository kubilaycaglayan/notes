import React from 'react';
import ReactDOM from 'react-dom';
import reducer from './reducers/index';
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import TodoApp from "./todoApp";

const store = createStore(reducer)

ReactDOM.render(
  <Provider store={store} >
    <TodoApp />
  </Provider>,
  document.getElementById('root')
)