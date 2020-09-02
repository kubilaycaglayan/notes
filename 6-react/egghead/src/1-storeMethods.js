import { createStore }  from 'redux';


const storeMethods = (() => {
  console.log('Store Methods')
  const INCREMENT = 'INCREMENT';
  const DECREMENT = 'DECREMENT';

  const counter = (state = 0, action) => {
    switch (action.type) {
      case INCREMENT:
        return state + 1;
      case DECREMENT:
        return state - 1;
      default:
        return state;
    }
  }

  const store = createStore(counter);

  console.log(store.getState())
  console.log(store.dispatch({type: INCREMENT}))
  console.log(store.getState())

  const render = () => {
    document.body.innerText = store.getState()
  }
  render()

  store.subscribe(render)

  document.addEventListener('click', () => {
    store.dispatch({type: DECREMENT})
  })
})()

export default storeMethods;
