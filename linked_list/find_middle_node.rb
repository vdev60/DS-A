def find_middle_node(head)
  fast = head
  slow = head
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end

  slow
end