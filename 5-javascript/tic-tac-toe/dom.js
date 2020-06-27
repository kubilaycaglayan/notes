const BoardListener = (function BoardListener() {
  const circleShape = '<i class="far fa-circle"></i>';
  const squareShape = '<i class="far fa-square">';
  const xShape = '<i class="fas fa-times"></i>';

  const changeSquare = function changeSquare(index) {
    if (GameBoard.getTurn() % 2 === 0) {
      document.getElementById(index).innerHTML = circleShape;
    } else {
      document.getElementById(index).innerHTML = xShape;
    }
  };

  return { changeSquare };
}());



const PlayOnPage = (function PlayOnPage() {
  let turn = 0;
  let listeners = [];
  let player1;
  let player2;

  const hideElement = function hideElement(element) {
    return element.style.display = 'none';
  };

  const showElement = function showElement(element) {
    element.style.display = 'block';
  };

  const startButton = document.getElementById('start-button');
  const restartButton = document.getElementById('restart-button');
  const form = document.getElementsByTagName('form')[0];
  hideElement(restartButton);

  const resultBox = document.getElementsByClassName('result')[0];

  const getNamesFromForm = function getNamesFromForm() {
    const name1 = document.getElementById('player1').value || 'Kubilay';
    const name2 = document.getElementById('player2').value || 'Jamilia';
    return { name1, name2 };
  };

  const createPlayers = function createPlayers() {
    const names = getNamesFromForm();
    player1 = playerFactory(names.name1);
    player2 = playerFactory(names.name2);
    return { player1, player2 };
  };

  const feedback = function feedback(text) {
    resultBox.innerHTML = text;
  };

  const tie = function tie(index) {
    feedback('this is a tie');
    BoardListener.changeSquare(index);
    deactivateBoard();
  };

  const player1Won = function player1Won(index) {
    feedback(`${player1.name} won! Congratulations...`);
    BoardListener.changeSquare(index);
    deactivateBoard();
  };

  const player2Won = function player2Won(index) {
    feedback(`${player2.name} won! Congratulations...`);
    BoardListener.changeSquare(index);
    deactivateBoard();
  };

  const engine = function engine(index) {
    const result = GamePlay.moveAndCheck(index);
    feedback('');
    switch (result) {
      case 'tie':
        tie(index);
        break;
      case 'taken':
        feedback('that place is taken');
        break;
      case 0:
        player1Won(index);
        break;
      case 1:
        player2Won(index);
        break;
      default:
        feedback(motivationalMessages.getRandomMessage());
        BoardListener.changeSquare(index);
        break;
    }
  };

  const activateBoard = function activateBoard() {
    for (let i = 0; i < 9; i += 1) {
      const square = document.getElementById(i);
      const listener = engine.bind(this, i);
      listeners.push(listener);
      square.addEventListener('click', listener, false);
    }
  };

  const deactivateBoard = function deactivateBoard() {
    listeners.forEach((listener, index) => {
      const square = document.getElementById(index);
      square.removeEventListener('click', listener, false);
    });
  };



  const start = function start() {
    activateBoard();
    createPlayers();
    showElement(restartButton);
    hideElement(startButton);
    hideElement(form);
    feedback('Make your move...');
  };

  const restart = function restart() {
    location.reload();
  };

  startButton.addEventListener('click', start);
  restartButton.addEventListener('click', restart);

  return {
    createPlayers,
  };
}());