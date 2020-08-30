import React from 'react';
import ReactDOM, { render } from 'react-dom';


class NameInput extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      constantName: 'Vera Çağlayan ',
      name: '',
      shadowed: '',
      count: 0,
    }
    this.handleInput = this.handleInput.bind(this)
    window.addEventListener('keydown', () => {this.handleBackspace(event)})
  }

  handleBackspace(event) {
    if (event.key === 'Backspace') {
      let { count } = this.state;
      count -= 2;
      count = count < -1 ? 0 : count;
      this.setState({
        count,
      })
    }
  }

  handleInput (event) {
    let { count, name, constantName } = this.state;
    const last = event.target.value.slice(-1);
    const shadowed = constantName.repeat(5).slice(0, count + 1);
    this.setState({
      name,
      shadowed,
      count: count += 1,
    })
  }

  render() {
    const { shadowed } = this.state;
    return (
      <input onInput={this.handleInput} value={shadowed}/>
    );
  }
}
ReactDOM.render(
  <NameInput />,
  document.getElementById('root')
)