const util = require('util')

const list = [
  ['AA', 'BB', 'CC', 'DD'],
  ['AA', 'CC', 'DD', 'EE'],
  ['CC', 'DD', 'EE', 'AA'],
  ['DD', 'EE', 'AA', 'BB'],
];

const createNode = (name, id, level, nodeIdLevel, nodes = []) => ({
  name,
  id,
  level,
  nodeIdLevel,
  nodes,
});

// const result = [{ name: 'AA' }];
const result = [];

function nameExist(result, name) {
  const exists = result.some((node) => node.name === name);

  return exists;
}

function findNodeByName(result, name) {
	const node = result.find((node) => node.name === name);
	return node;
}

function main() {
	let headNode;
	let nodes = [];
  let id = 0;
  list.forEach((row, row_index) => {
		const exs = nameExist(result, row[0]);

    let level = [];
		let nodeIdLevel = [];
		if(!exs) {
			nodes = [];
			level.push(row[0])
			nodeIdLevel.push(`filter-${id}`)
			headNode = createNode(row[0], `filter-${id}`, [...level], [...nodeIdLevel], nodes)
			result.push(headNode);
		}
    row.forEach((column, col_index) => {
			if ( col_index !== 0) {
				if (!exs) {
					const nodeId = `filter-${id}`;
					level.push(column);
					nodeIdLevel.push(nodeId);
					let new_node = createNode(column, nodeId, [...level], [...nodeIdLevel], []);
					headNode.nodes.push(new_node);

					headNode = headNode.nodes[0];
				} else {
					if (column !== row[0]) {
						const nodeId = `filter-${id}`;
						if (col_index === 1) {
							headNode = findNodeByName(result, row[0])
							level = [...headNode.level]
							nodeIdLevel = [...headNode.nodeIdLevel]
						}
						level.push(column);
						nodeIdLevel.push(nodeId);
						let new_node = createNode(column, nodeId, [...level], [...nodeIdLevel], []);
						headNode.nodes.push(new_node);

						if (col_index === 1) {
							headNode = headNode.nodes[1];
						} else {
							headNode = headNode.nodes[0];
						}
					}
				}
			}
			if (column === row[0] && exs) {
				id -= 1;
			}
			id += 1;
    });
  });
}

main()

console.log(util.inspect(result, {showHidden: false, depth: null}))
