require_relative './linked_list'

ll = LinkedList.new(1)
ll.append(2)
ll.append(3)
ll.append(4)
ll.append(5)

def remove_nth_from_end(head, index)
  slow = head
  fast = head

  (0...index).each do |_|
    return nil unless fast
    fast = fast.next
  end

  while fast 
    prev = slow
    slow = slow.next
    fast = fast.next
  end

  if prev
    prev.next = slow.next
  else
    return head.next
  end

  return head
end

p find_kth_from_end(ll.head, 1)
