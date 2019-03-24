import Node

class Binarie_Tree:

	def __init__(self):
		self.size = 0
		self.root = None

	def insert(self, in_data):
		if (self.root = None):
			self.root = Node(in_data, None, None)
		elif (in_data > self.root.data):
			if(self.root.right == None):
				self.root.right = Node(in_data, None, None)
			else:
				self.root.right.insert(in_data)
		else:
			if(self.root.left == None):
				self.root.left = Node(in_data, None, None)
			else:
				self.root.left.insert(in_data)
		self.size +=1

	def remove(self, in_data):
		if(self.root = None):
			raise Exception('The Tree is empty')
		temp = Node(None, None, None)
		temp.left = self.root
		temp.right = self.root
		self.root.remove(in_data, temp)
		self.root = temp.left
		del temp
		self.size -=1

	def contains(self, in_data):
		if (self.size() == 0):
			raise Exception('This Tree is empty')
		else:
			return self.root.contains(in_data)

	def size(self):
		return self.size

	def pre_order(self, list):
		if (self.size() == 0):
			raise Exception('This Tree is empty')
		else:
			self.root.pre_order(list)

	def in_order(self, list):
		if (self.size() == 0):
			raise Exception('This Tree is empty')
		else:
			self.root.in_order(list)

	def post_order(self, list):
		if (self.size() == 0):
			raise Exception('This Tree is empty')
		else:
			self.root.post_order(list)