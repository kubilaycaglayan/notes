import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

class Father extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      firstKid: 'red',
      secondKid: 'white',
    }
  }

  clickHandler() {
    const [first, second] = [this.state.firstKid, this.state.secondKid]
    this.setState({
      firstKid: second,
      secondKid: first,
    })
  }

  render() {
    return (
      <div className='father'>
        <Kid style={{backgroundColor: this.state.firstKid}}/>
        <Kid style={{backgroundColor: this.state.secondKid}}/>
        <SwitchButton onClick={() => {this.clickHandler()}}/>
      </div>

    )
  }
}

function Kid(props) {
  return (
    <div className='kid' style={props.style}/>
  )
}

function SwitchButton(props) {
  return (
    <button className='my-button' onClick={props.onClick}>
      Switch Colors
    </button>
  )
}

ReactDOM.render (
  <Father />,
  document.getElementById('root')
)