const BoardListener = (function BoardListener() {
  const circleShape = '<i class="far fa-circle text-warning"></i>';
  const xShape = '<i class="fas fa-times text-primary"></i>';

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
  const turnBox = document.getElementsByClassName('turn')[0];
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
    feedback('Nobody wins, a tie.');
    BoardListener.changeSquare(index);
    deactivateBoard();
    hideElement(turnBox);
  };

  const winningPosition = function winningPosition(index) {
    let value;
    switch (index) {
      case 0:
        value = [0, 1, 2];
        break;
      case 1:
        value = [3, 4, 5];
        break;
      case 2:
        value = [6, 7, 8];
        break;
      case 3:
        value = [0, 3, 6];
        break;
      case 4:
        value = [1, 4, 7];
        break;
      case 5:
        value = [2, 5, 8];
        break;
      case 6:
        value = [0, 4, 8];
        break;
      case 7:
        value = [2, 4, 6];
        break;
      default:
        value = [];
    }
    return value;
  };

  const painter = function painter(winningPosition) {
    winningPosition.forEach((index) => {
      const element = document.getElementById(index).firstChild;
      element.className += ' text-danger';
    });
  };

  const player1Won = function player1Won(index, winPositionIndex) {
    feedback(`${player1.name} won! Congratulations...`);
    BoardListener.changeSquare(index);
    deactivateBoard();
    hideElement(turnBox);
    painter(winningPosition(winPositionIndex));
  };

  const player2Won = function player2Won(index, winPositionIndex) {
    feedback(`${player2.name} won! Congratulations...`);
    BoardListener.changeSquare(index);
    deactivateBoard();
    hideElement(turnBox);
    painter(winningPosition(winPositionIndex));
  };

  const engine = function engine(index) {
    const result = GamePlay.moveAndCheck(index);
    feedback('');
    switch (result[0]) {
      case 'tie':
        tie(index);
        break;
      case 'taken':
        feedback('that place is taken');
        break;
      case 0:
        player1Won(index, result[1]);
        break;
      case 1:
        player2Won(index, result[1]);
        break;
      default:
        feedback(motivationalMessages.getRandomMessage());
        setTurnBox();
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
  
  const setTurnBox = function setTurnBox() {
    if (GameBoard.getTurn() % 2 === 0) {
      turnBox.innerHTML = player1.name + '! It is your turn...';
    } else {
      turnBox.innerHTML = player2.name + '! It is your turn...';
    };
  };

  const start = function start() {
    activateBoard();
    createPlayers();
    showElement(restartButton);
    hideElement(startButton);
    hideElement(form);
    feedback('Make your move...');
    setTurnBox();
    showElement(turnBox);
    showElement(resultBox);
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