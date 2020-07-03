import _ from 'lodash';
import myName from './myName';
import './style.css';
import Icon from './icon.jpg';
import Data from './data.xml';

function component() {
  const element = document.createElement('div');

  // Lodash, currently included via a script, is required for this line to work
  // Lodash is now imported by this script
  element.innerHTML = _.join(['Hello', 'webpack '], ' ');
  element.innerHTML += myName('Kubilay');
  element.classList.add('hello');
  element.classList.add('img');

  // Add the image to our existing div
  const myIcon = new Image();
  myIcon.src = Icon;

  element.appendChild(myIcon);

  console.log(Data);

  console.log(Data.note.body);

  return element;
}

document.body.appendChild(component());
