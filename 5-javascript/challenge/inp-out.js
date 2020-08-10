// this will be the input
let list = [
  ['AA', 'BB', 'CC', 'DD'],
  ['AA', 'CC', 'DD', 'EE'],
  ['CC', 'DD', 'EE', 'AA'],
  ['DD', 'EE', 'AA', 'BB'],
]​
// this will be the output
let expectedResult = [{
    name: 'AA',
    id: 'filter-0',
    level: ['AA'],
    nodeIdLevel: ['filter-0'],
    nodes: [{
        name: 'BB',
        id: 'filter-1',
        level: ['AA', 'BB'],
        nodeIdLevel: ['filter-0', 'filter-1'],
        nodes: [{
          name: 'CC',
          id: 'filter-2',
          level: ['AA', 'BB', 'CC'],
          nodeIdLevel: ['filter-0', 'filter-1', 'filter-2'],
          nodes: [{
            name: 'DD',
            id: 'filter-3',
            level: ['AA', 'BB', 'CC', 'DD'],
            nodeIdLevel: ['filter-0', 'filter-1', 'filter-2', 'filter-3'],
            nodes: [​]
          }]
        }]
      },
      {
        name: 'CC',
        id: 'filter-4',
        level: ['AA', 'CC'],
        nodeIdLevel: ['filter-0', 'filter-4'],
        nodes: [{
          name: 'DD',
          id: 'filter-5',
          level: ['AA', 'CC', 'DD'],
          nodeIdLevel: ['filter-0', 'filter-4', 'filter-5'],
          nodes: [{
            name: 'EE',
            id: 'filter-6',
            level: ['AA', 'CC', 'DD', 'EE'],
            nodeIdLevel: ['filter-0', 'filter-4', 'filter-5', 'filter-6'],
            nodes: [​]
          }]
        }]
      }
    ]
  },
  {
    name: 'CC',
    id: 'filter-7',
    level: ['CC'],
    nodeIdLevel: ['filter-7'],
    nodes: [​{
      name: 'DD',
      id: 'filter-8',
      level: ['CC', 'DD'],
      nodeIdLevel: ['filter-7', 'filter-8'],
      nodes: [​{
        name: 'EE',
        id: 'filter-9',
        level: ['CC', 'DD', 'EE'],
        nodeIdLevel: ['filter-7', 'filter-8', 'filter-9'],
        nodes: [​{
          name: 'AA',
          id: 'filter-10',
          level: ['CC', 'DD', 'EE', 'AA'],
          nodeIdLevel: ['filter-7', 'filter-8', 'filter-9', 'filter-10'],
          nodes: [​]
        }]
      }]
    }]
  },
  {
    name: 'DD',
    id: 'filter-11',
    level: ['DD'],
    nodeIdLevel: ['filter-11'],
    nodes: [​{
      name: 'EE',
      id: 'filter-12',
      level: ['DD', 'EE'],
      nodeIdLevel: ['filter-11', 'filter-12'],
      nodes: [​{
        name: 'AA',
        id: 'filter-13',
        level: ['DD', 'EE', 'AA'],
        nodeIdLevel: ['filter-11', 'filter-12', 'filter-13'],
        nodes: [​{
          name: 'BB',
          id: 'filter-14',
          level: ['DD', 'EE', 'AA', 'BB'],
          nodeIdLevel: ['filter-11', 'filter-12', 'filter-13', 'filter-14'],
          nodes: [​]
        }]
      }]
    }]
  }​
]