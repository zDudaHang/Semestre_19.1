class Stack:
    def __init__(self):
        self.elements = []

    def __del__(self):
    	while(!self.empty()):
    		self.pop()

    def push(self, data):	
	   self.elements.append(data)

    def pop(self):
    	if (!self.empty()):
            	return self.elements.pop()
    	else:
    		raise Exception('The stack is empty')

    def top(self):
        if (!self.empty() == 0):
            raise Exception('The stack is empty')
        else:
            return self.elements[self.size()-1]

    def size(self):
        return len(self.elements)

    def empty(self):
        return (self.size() == 0)

