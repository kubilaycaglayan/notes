import React from 'react';
import AddTodo from './components/addTodo';
import VisibleTodoList from './components/visibleTodoList';
import Footer from './components/footer';

const TodoApp = () => (
  <div>
    <AddTodo />
    <VisibleTodoList />
    <Footer />
  </div>
)

export default TodoApp;
