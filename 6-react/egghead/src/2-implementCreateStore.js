const implementCreateStore = (() => {
  console.log('implementCreateStore')

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

  const createStore = (reducer) => {
    let state;
    let listeners = [];

    const getState = () => state;
    const dispatch = (action) => {
      state = reducer(state, action);
      console.log(listeners)
      listeners.forEach( listener => listener());
    }

    const subscribe = (listener) => {
      listeners.push(listener);
      return () => {
        listeners = listeners.filter(l => l !== listener)
      }
    }

    dispatch({});

    return {
      getState,
      dispatch,
      subscribe,
      listeners,
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

  const remove = store.subscribe(render)
  console.log(store.listeners)
  remove()
  console.log(store.listeners)


  document.addEventListener('click', () => {
    store.dispatch({type: DECREMENT})
  })
})()

export default implementCreateStore;
