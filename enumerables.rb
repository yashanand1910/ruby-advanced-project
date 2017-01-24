module Enumerable
	def my_each
		for i in self
			yield i
		end
		self
	end
	def my_each_with_index
		for i in (0...self.length)
			yield i, self[i]
		end
		self
	end
	def my_select
		temp = []
		self.my_each do |i|
			if yield(i)
				temp.push(i)
			end
		end
		temp
	end
	def my_all?
		bool = true
		self.my_each do |i|
			bool = false unless yield i
		end
		bool
	end
	def my_any?
		bool = false
		self.my_each do |i|
			bool = true if yield i
		end
		bool
	end
	def my_none?
		bool = true
		self.my_each do |i|
			bool = false if yield i
		end
		bool
	end
	def my_count *n
		count = 0
		if n
			self.my_each do |i|
				count += 1 if i == n[0] || (yield i)
			end
		else
			self.my_each do |i|
				count += 1
			end
		end
		count
	end
	def my_map &a
		temp = []
		self.my_each do |i|
			temp.push(a.call(i))
		end
		temp
	end
	def my_inject *n
		result = n[0] || result = 0
		self.my_each do |i|
			result = yield(result, i)
		end
		result
	end
end

def multiply_els array
	array.my_inject(1) { |result, i| result * i }
end