array = ["hi","hello","hey"]
def bubble_sort array
	n = array.length
	n.times do |i|
		(n - 1).times do |j|
			array[j], array[j+1] = array[j+1], array[j] if array[j] > array[j+1]
		end
	end
end

def bubble_sort_by array
	n = array.length
	n.times do |i|
		(n - 1).times do |j|
			if yield(array[j], array[j + 1]) > 0
				array[j], array[j+1] = array[j+1], array[j]
			end
		end
	end
end

bubble_sort_by(array) { |left, right| left.length - right.length }
p array