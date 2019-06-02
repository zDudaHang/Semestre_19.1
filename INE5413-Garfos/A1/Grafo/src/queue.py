class Queue:
	def __init__(self):
		self.elements = []

	def enqueue(self, data):
		self.elements.append(data)

	def dequeue(self):
		if (not self.empty()):
			return self.elements.pop(0)

	def size(self):
		return len(self.elements)

	def empty(self):
		return (self.size() == 0)
