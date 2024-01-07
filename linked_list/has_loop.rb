require_relative './linked_list'

ll = LinkedList.new(1)
ll.append(2)
ll.append(3)
ll.tail.next = ll.head 

# The method should be able to detect if there is a cycle or loop present in the linked list.
def has_loop(head)
  slow = head
  fast = head

  while fast && fast.next
    fast = fast.next.next
    slow = slow.next
    return true if slow == fast
  end

  false
end

p has_loop(ll.head)