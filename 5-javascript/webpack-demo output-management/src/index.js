import _ from 'lodash';
import myName from './myName';
import printMe from './print.js';

function component() {
  const element = document.createElement('div');
  const button = document.createElement('button');

  element.innerHTML = _.join(['Hellos', 'webpack '], ' ');
  element.innerHTML += myName('Kubilay');

  button.innerHTML = 'Click me and check the console!';
  button.onclick = printMe;

  element.appendChild(button);

  return element;
}

document.body.appendChild(component());
