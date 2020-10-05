import React from 'react';
import ReactDOM from 'react-dom';

class Father extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      firstKidBGColor: 'red',
      secondKidBGColor: 'white',
    }
  }

  clickHandler() {
    const [first, second] = [this.state.firstKidBGColor, this.state.secondKidBGColor];
    this.setState({
      firstKidBGColor: second,
      secondKidBGColor: first,
    })
  }

  render() {
    const options = {
      parentStyle: {
        backgroundColor: 'black',
        display: 'flex',
        flexDirection: 'column',
        justifyItems: 'space-around',
        alignContent: 'center',
        height: 500,
        textAlign: 'center',
        width: 500,
      },
      firstKidStyle: {
        backgroundColor: this.state.firstKidBGColor,
      },
      secondKidStyle: {
        backgroundColor: this.state.secondKidBGColor,
      }
    }

    return (
      <div style={options.parentStyle} >
        <Kid style={options.firstKidStyle} />
        <Kid style={options.secondKidStyle} />
        <SwitchButton onClick={() => {this.clickHandler()}} />
      </div>
    )
  }
}

function Kid(props) {
  const options = {
    kidStyle: {
      margin: '3% auto',
      width: 250,
      height: 250,
    }
  }

  return (
    <div style={Object.assign(options.kidStyle, props.style)} />
  )
}

function SwitchButton (props) {
  const options = {
    style: {
      height: 50,
      margin: '0 auto',
      width: 150,
    }
  }

  return (
    <button style={options.style} onClick={props.onClick} >
      Switch Colors!
    </button>
  )
}

ReactDOM.render(
  <Father />,
  document.getElementById('root')
)