import React from 'react';
import { connect } from 'react-redux';
import addTodo from '../actions/addTodo';

let AddTodo = ({ dispatch }) => {
  let input;

  return (
    <div>
      <input ref={node => {input = node;}}>
      </input>
      <button
      onClick={() => {
        dispatch(addTodo(input.value))
        input.value = '';
      }}
      >
        Add Todo
      </button>
    </div>
  )
}

export default connect()(AddTodo);
