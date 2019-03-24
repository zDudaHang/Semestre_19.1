class Node:
	def __init__(self, data, left, right):
		self.data = data
		self.left = left
		self.right = right

	def insert(self, in_data):
		if (in_data > self.data):
			if (self.right == None):
				self.right = Node(in_data)
			else:
				self.right.insert(in_data)
		else:
			if (self.left == None):
				self.left = Node(in_data)
			else:
				self.left.insert(in_data)

	def remove(self, in_data, parent):
		if(in_data == self.data):
			# Folha:
			if (self.left == None and self.right == None):
				if (parent.left != None and in_data == parent.left.data):
					parent.left = None
				else:
					parent.right = None
			# Um filho:
			elif (self.left != None or self.right != None):
				if(self.left != None):
					if (parent.left != None and in_data == parent.left.data):
						parent.left = self.left
					else:
						parent.right = self.left
				else:
					if(parent.left != None and in_data == parent.left.data):
						parent.left = self.right
					else:
						parent.right = right
			# 2 filhos:
			else:
				if (in_data > self.data):
					data = self.right.minValue()
					self.right.remove(data, self)
		else:
			if (in_data > self.data):
				self.right.rempve(in_data, self)
			else:
				self.left.rempve(in_data, self)

	def minValue(self):
		if (self.left != None):
			return self.left.minValue()
		else:
			return self.data

	def contains(self, in_data):
		if (in_data == self.data):
			return True
		elif (in_data > self.data):
			if (self.right == None):
				return False
			else:
				return self.right.contains(in_data)
		else:
			if(self.left == None):
				return False
			else:
				return self.left.contains(in_data)

	def pre_order(self, list):
		list.append(self.data)
		if (self.left != None):
			self.left.pre_order(list)
		if (self.right != None):
			self.right.pre_order(list)

	def in_order(self, list):
		if (self.left != None):
			self.left.in_order(list)
		list.append(self.data)
		if (self.right != None):
			self.right.in_order(list)

	def post_order(self, list):
		if (self.left != None):
			self.left.post_order(list)
		if (self.right != None):
			self.right.post_order(list)
		list.append(self.data)