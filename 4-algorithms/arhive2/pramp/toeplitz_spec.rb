def is_toeplitz?(matrix)
  for i in 0...(matrix.first.size - 1)
    top = matrix[0][i]
    for j in 1...[matrix.size, matrix.first.size - i].min
      return false if top != matrix[j][i + j]
    end
  end

  for i in 1...(matrix.size - 1)
    first = matrix[i][0]
    for j in 1...[matrix.size - i, matrix.first.size].min
      return false if first != matrix[j + i][j]
    end
  end

  true
end

=begin
0 [0, 1, 2, 3, 4]
1 [0, 1, 2, 3, 4]
2 [0, 1, 2, 3, 4]
3 [0, 1, 2, 3, 4]
4 [0, 1, 2, 3, 4]
5 [0, 1, 2, 3, 4]
6 [0, 1, 2, 3, 4]
=end


system('clear')


describe 'is_toeplitz?' do
  let(:matrix) {[[4,0],[9,4]]}
  let(:matrix2) {[[6,4,4]]}
  let(:matrix3) {[[3],[5],[6]]}
  let(:matrix4) {[[3,9],[5,3],[6,5]]}
  let(:matrix5) {[[3,1,7],[4,1,1],[2,4,3]]}
  let(:matrix6) {[[8,8,8,8,8],[8,8,8,8,9],[8,8,8,8,8],[8,8,8,8,8],[8,8,8,8,8]]}
  let(:matrix7) {
    [
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],
    [8,9,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]
  ]
  }

  it 'returns true if the given matrix is a toeplitz matrix' do
    expect(is_toeplitz? matrix).to be true
  end
  it 'returns true if the given matrix is a toeplitz matrix' do
    expect(is_toeplitz? matrix2).to be true
  end
  it 'returns true if the given matrix is a toeplitz matrix' do
    expect(is_toeplitz? matrix3).to be true
  end
  it 'returns true if the given matrix is a toeplitz matrix' do
    expect(is_toeplitz? matrix4).to be true
  end
  it 'returns true if the given matrix is a toeplitz matrix' do
    expect(is_toeplitz? matrix5).to be false
  end
  it 'returns true if the given matrix is a toeplitz matrix' do
    expect(is_toeplitz? matrix6).to be false
  end
  it 'returns true if the given matrix is a toeplitz matrix' do
    expect(is_toeplitz? matrix7).to be false
  end
end