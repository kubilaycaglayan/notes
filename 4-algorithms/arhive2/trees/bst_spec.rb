require_relative 'bst.rb'

describe 'BST' do
  describe 'root' do
    it 'has a root node initialized with nil value' do
      expect(BST.new.root).to be nil
    end
  end

  describe 'insert' do
    let (:bst_instance) { BST.new() }
    before :each do
      bst_instance.insert Node.new(5)
    end
    it 'assigns the first node as the root' do
      expect(bst_instance.root.data).to be 5
    end

    it 'inserts the node in the right subtree if the val is greater' do
      bst_instance.insert Node.new(6)
      expect(bst_instance.root.right.data).to be 6
    end

    it 'inserts the node in the left subtree if the val is smaller' do
      bst_instance.insert Node.new(4)
      expect(bst_instance.root.left.data).to be 4
    end

    it 'can insert into the subtrees' do
      bst_instance.insert Node.new(4)
      bst_instance.insert Node.new(1)
      bst_instance.insert Node.new(2)
      bst_instance.insert Node.new(3)
      bst_instance.insert Node.new(0)
      expect(bst_instance.root.left.left.data).to be 1
      expect(bst_instance.root.left.left.right.data).to be 2
      expect(bst_instance.root.left.left.right.right.data).to be 3
      expect(bst_instance.root.left.left.left.data).to be 0
    end
  end

  describe 'pre_order' do
    it 'converts the root node into a string in the preorder structure' do
      bst_instance = BST.new
      [8, 3, 10, 1, 6, 14, 4, 7, 13].each { |val| bst_instance.insert(Node.new(val)) }

      expect(bst_instance.pre_order).to match "8 3 1 6 4 7 10 14 13"
    end
  end
end

