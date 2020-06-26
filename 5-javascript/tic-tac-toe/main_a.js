const NewBoard = (function NewBoard() {
  const board = ['', '', '', '', '', '', '', '', ''];
  return { board };
}());

const GameBoard = (function Board() {
  let turn = 0;
  let board = [...NewBoard.board];
  //const board = [...Array(9).keys()]

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
    let winner;
    winningPositions().forEach((position) => {
      if (position.every((element) => element === 0)) {
        winner = 0;
      }
      if (position.every((element) => element === 1)) {
        winner = 1;
      }
    });
    return winner;
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
    if (checkWin === false && board.every((element) => element === '')) {
      return true;
    }
    return false;
  };

  const moveAndCheck = function moveAndCheck(index) {
    GameBoard.move(index);
    console.log(checkWin());
  };

  return { winningPositions, moveAndCheck };
}());

console.log(GameBoard.getBoard());
GamePlay.moveAndCheck(0);
GamePlay.moveAndCheck(1);
GamePlay.moveAndCheck(2);
GamePlay.moveAndCheck(3);
console.log(NewBoard.board)
GamePlay.moveAndCheck(4);
GamePlay.moveAndCheck(5);
GamePlay.moveAndCheck(6);
console.log(GameBoard.getBoard());
GameBoard.resetBoard();
console.log(GameBoard.getBoard());
GamePlay.moveAndCheck(4);
GamePlay.moveAndCheck(5);
GamePlay.moveAndCheck(6);
console.log(GameBoard.getBoard());


console.log(GamePlay.winningPositions);