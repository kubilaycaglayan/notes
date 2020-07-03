const NewBoard = (function NewBoard() {
  const board = ['', '', '', '', '', '', '', '', ''];
  // const board = [...Array(9).keys()]
  /* const board = [0, 1, 0,
                 1, 0, 1,
                 1, '', 1]; */
  /* const board = [0, 1, 0, 1, 0, 1, 0, '', '']; */
  return { board };
}());

const GameBoard = (function Board() {
  let turn = 0;
  let board = [...NewBoard.board];

  const getBoard = function getBoard() {
    return board;
  };

  const nextSign = function nextSign() {
    if (turn % 2 === 0) {
      return 0;
    }
    return 1;
  };

  const update = function update(index) {
    board[index] = nextSign();
    turn += 1;
  };

  const movable = function movable(index) {
    if (board[index] === '') {
      return true;
    }
    return false;
  };

  const move = function move(index) {
    if (movable(index) && index < 9 && index >= 0) {
      update(index);
      return true;
    }
    return false;
  };

  const getTurn = function() {
    return turn;
  };

  const resetTurn = function resetTurn() {
    turn = 0;
  };

  const resetBoard = function resetBoard() {
    board = [...NewBoard.board];
    resetTurn();
  };

  return {
    getBoard,
    move,
    getTurn,
    resetBoard,
  };
}());

const GamePlay = (function GameFlow() {
  const winningPositions = function winningPositions() {
    const board = GameBoard.getBoard();
    return [
      [...board.slice(0, 3)],
      [...board.slice(3, 6)],
      [...board.slice(6, 9)],
      [...board.slice(0, 1), ...board.slice(3, 4), ...board.slice(6, 7)],
      [...board.slice(1, 2), ...board.slice(4, 5), ...board.slice(7, 8)],
      [...board.slice(2, 3), ...board.slice(5, 6), ...board.slice(8, 9)],
      [...board.slice(0, 1), ...board.slice(4, 5), ...board.slice(8, 9)],
      [...board.slice(2, 3), ...board.slice(4, 5), ...board.slice(6, 7)],
    ];
  }

  const whosTurn = function whosTurn() {
    return GameBoard.getTurn() % 2;
  };

  const winningPositionsCheck = function winningPositionsCheck() {
    let winnerAndPosition;
    winningPositions().forEach((position, index) => {
      if (position.every((element) => element === 0)) {
        winnerAndPosition = [];
        winnerAndPosition.push(0);
        winnerAndPosition.push(index);
      }
      if (position.every((element) => element === 1)) {
        winnerAndPosition = [];
        winnerAndPosition.push(1);
        winnerAndPosition.push(index);
      }
    });
    return winnerAndPosition;
  };
  
  const checkWin = function checkWin() {
    const winner = winningPositionsCheck();
    if (winner !== undefined) {
      return winner;
    }
    return false;
  };

  const checkTie = function checkTie() {
    const board = GameBoard.getBoard();
    if (checkWin() === false && board.every((element) => element !== '')) {
      return true;
    }
    return false;
  };

  const moveAndCheck = function moveAndCheck(index) {
    if (GameBoard.move(index)) {
      const winner = checkWin();
      if (winner !== false) {
        return winner;
      }
      if (checkTie()) {
        return ['tie'];
      }
      return true;
    }
    return ['taken'];
  };

  return { moveAndCheck };
}());

// console.log(GamePlay.moveAndCheck(7));
// console.log(GameBoard.getBoard());

const playerFactory = (name) => {
  let winCount = 0;

  const increaseWinCount = function increaseWinCount() {
    winCount += 1;
  };

  const getWinCount = function getWinCount() {
    return winCount;
  };

  return { name, increaseWinCount, getWinCount };
};

/* const kubi = playerFactory('Kubilay');
kubi.increaseWinCount();

const jam = playerFactory('Jamilia');
jam.increaseWinCount();
jam.increaseWinCount();

console.log(jam.getWinCount());
console.log(kubi.getWinCount()); */

const motivationalMessages = (function motivationalMessages() {
  const messages = [
    'Interesting move...',
    'Amazing idea!',
    'That will be great.',
    'Hmm, are you sure?',
    'Yes, yess...',
    'Okay, seems like a nice spot!',
    'Wow!',
    'How did you think that move?',
    'Way to go...',
    'One more step...',
    'Brilliant!',
    'Be careful!',
    'What about the other blank?',
    'Oops!',
    'Yes!',
    'Noooooo...',
  ];

  const randomNumber = function() {
    return Math.floor(Math.random() * messages.length);
  };

  const getRandomMessage = function getRandomMessage() {
    return messages[randomNumber()];
  };

  return {
    getRandomMessage,
  };
}());
