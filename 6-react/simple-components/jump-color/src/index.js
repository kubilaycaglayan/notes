import React from 'react';
import ReactDOM from 'react-dom';

class Father extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      indexOfColoredDiv: 0,
    }
  }

  clickHandler() {
    const boxCount = document.getElementsByClassName('boxes')[0].children.length;
    let newIndex = this.state.indexOfColoredDiv + 1;
    if (newIndex > boxCount - 1) { newIndex = 0 }
    this.setState({
      indexOfColoredDiv: newIndex,
    })
  }

  styler(index) {
    if (index === this.state.indexOfColoredDiv) {
      return {backgroundColor: 'red'}
    }
  }

  render() {
    const options = {
      styleFather: {
        width: 600,
        textAlign: 'center',
        padding: '3%',
        backgroundColor: 'black',
      },
      styleWrapper: {
        display: 'flex',
        justifyContent: 'space-around',
        alignContent: 'center',
        margin: '3% auto',
      },
    }

    return (
      <div style={options.styleFather}>
        <div className='boxes' style={options.styleWrapper}>
          <Kid style={this.styler(0)}/>
          <Kid style={this.styler(1)}/>
          <Kid style={this.styler(2)}/>
          <Kid style={this.styler(3)}/>
          <Kid style={this.styler(4)}/>
          <Kid style={this.styler(5)}/>
          <Kid style={this.styler(6)}/>
          <Kid style={this.styler(7)}/>
          <Kid style={this.styler(8)}/>
        </div >
        <JumpButton onClick={() => {this.clickHandler()}}/>
      </div>
    )
  }
}

function Kid(props) {
  const options = {
    style: {
      width: 30,
      height: 30,
      backgroundColor: 'lime',
      borderRadius: '50%',
    }
  }

  return (
    <div style={Object.assign(options.style, props.style)}/>
  )
}

function JumpButton(props) {
  const options = {
    style: {
      width: 150,
      height: 80,
      fontWeight: 'bolder',
      margin: '3% auto',
    }

  }
  return (
   <button style={options.style} onClick={props.onClick}>
     Jump color!
   </button>
  )
}

ReactDOM.render(
  <Father />,
  document.getElementById('root')
)