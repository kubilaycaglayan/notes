import React from 'react';
import ReactDOM from 'react-dom';

class Father extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      first: 'red',
      second: 'white',
    }
  }

  clickHandler () {
    const [first, second] = [this.state.second, this.state.first];
    this.setState({
      first: first,
      second: second,
    })
  }

  render() {
    const options = {
      fatherStyle: {
        height: 500,
        width: 500,
        display: 'flex',
        flexDirection: 'column',
        justifyItems: 'space-around',
        alignContent: 'center',
        textAlign: 'center',
        padding: '3%',
        margin: '4% auto',
        backgroundColor: 'black',
      },
      firstKidStyle: {
        backgroundColor: this.state.first
      },
      secondKidStyle: {
        backgroundColor: this.state.second
      }
    }

    return (
      <div style={options.fatherStyle} >
        <Kid style={options.firstKidStyle}/>
        <Kid style={options.secondKidStyle}/>
        <SwitchButton onClick={() => {this.clickHandler()}}/>
      </div>
    )
  }
}

function Kid (props) {
  const options = {
    style: {
      width: 250,
      height: 250,
      margin: '4% auto',
    }
  }

  return (
    <div style={Object.assign(options.style, props.style)}/>
  )
}

function SwitchButton (props) {
  const options = {
    style: {
      margin: '4% auto',
      fontWeight: 'bolder',
    }
  }
  return (
    <button style={options.style} onClick={props.onClick}>
      Switch Colors!
    </button>
  )
}

ReactDOM.render(
  <Father />,
  document.getElementById('root')
);

