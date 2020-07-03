/* const myHeading = document.querySelector('h1');
myHeading.textContent = 'Hello world! I am JavaScript!';

document.querySelector('h1').onclick = function() {
  if (myHeading.textContent == 'Hello world! I am JavaScript!') {
    myHeading.textContent = 'What do you want?';
  } else {
    myHeading.textContent = 'Hello world! I am JavaScript!';
  }
} */

const myButton = document.querySelector('button');
const myHeading = document.querySelector('h1');

function setUserName() {
  const myName = prompt('Please enter your name.');
  localStorage.setItem('name', myName);
  myHeading.textContent = `Mozilla is cool, ${myName}`;
}

if (!localStorage.getItem('name')) {
  setUserName();
} else {
  const storedName = localStorage.getItem('name');
  myHeading.textContent = `Mozilla is cool, ${storedName}`;
}

myButton.onclick = function asd() {
  setUserName();
};