class Queue:
    def __init__(self):
        self.elements = []

    def __del__(self):
		while(!self.empty()):
			self.dequeue()

    def enqueue(self, data):
        self.elements.append(data)

    def dequeue(self):
		if (!self.empty()):
	        	return self.elements.pop(0)
		else:
			raise Exception('The queue is empty')

    def size(self):
        return len(self.elements)

    def empty(self):
		return (self.size() == 0)

    def head(self):
		if (!self.empty()):
			return self.elements[0]
		else:
			raise Exception('The queue is empty')
    
    def tail(self):
		if (!self.empty()):
			return self.elements[self.size() - 1]
		else:
			raise Exception('The queue is empty')
