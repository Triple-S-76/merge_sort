amount_of_numbers = 100

array = []

amount_of_numbers.times do
  array << rand(10000)
end

p 'Unsorted Array:'
p array

def merge_sort(array, result = [])
  # p "Start: #{array}"
  if array.length == 1
    # p "This is the returned array: #{array}"
    array
  else
    split_amount = array.length / 2 - 1
    left = array[0..split_amount]
    right = array[split_amount + 1..-1]
    # p "This is the left to be sorted: #{left}"
    # p "This is the right to be sorted: #{right}"
    answer_left = merge_sort(left)
    # p "This is the left answer: #{answer_left}"
    answer_right = merge_sort(right)
    # p "This is the right answer: #{answer_right}"
    until answer_left.length.zero? || answer_right.length.zero?
      if answer_left[0] <= answer_right[0]
        # p "LEFT FIRST ELEMENT: #{answer_left[0]} is less than: #{answer_right[0]}"
        to_be_added = answer_left.shift
        # p "This is the element to be added to the result: #{to_be_added}"
        result.push(to_be_added)
        # p "This is the result after the add: #{result}"
        # p "This is the LEFT AFTER the add: #{answer_left}"
      else
        # p "RIGHT FIRST ELEMENT: #{answer_right[0]} is less than: #{answer_left[0]}"
        to_be_added = answer_right.shift
        # p "This is the element to be added to the result: #{to_be_added}"
        result.push(to_be_added)
        # p "This is the result after the add: #{result}"
        # p "This is the RIGHT AFTER the add: #{answer_right}"

      end
    end

    if answer_left.length > 0
      # p "The LEFT has this remaining to add to the result: #{answer_left}"
      result += answer_left
      # p "The RESULT after the LEFT answers have been added is: #{result}"
    else
      # p "The RIGHT has this remaining to add to the result: #{answer_right}"
      result += answer_right
      # p "The RESULT after the RIGHT answers have been added is: #{result}"
    end
    result
  end
end

p 'Sorted Array'

p merge_sort(array)
