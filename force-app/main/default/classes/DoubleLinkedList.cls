public class DoubleLinkedList {
    
    public DLLNode head;
    public DLLNode currentNode;
    public Integer length = 0;
    
    public void addFirstNode(Integer data){
        if(head == null){
            head = new DLLNode(data);
            currentNode = head;
            length++;
        }
    }
    public void addNodeAtEnd(Integer data){
        if(head != null){
            currentNode = head;
            while(currentNode.getNext() != null){
                currentNode = currentNode.getNext();
            }
            DLLNode node = new DLLNode(data);
            node.prev = currentNode;
            currentNode.next = node;
            length++;
        }
    }
    public void addNodeAtPosition(Integer data, Integer position){
        if(head != null){
            if(position == 1){
                DLLNode node = new DLLNode(data);
                node.next = head;
                head.prev = node;
                head = node;
                length++;
                return;
            }
            Integer i = 1;
            currentNode = head;
            while(i < position){
                currentNode = currentNode.getNext();
                ++i;
            }
            DLLNode node = new DLLNode(data);
            DLLNode prevNode = currentNode.prev;
            prevNode.next = node;
            node.prev = prevNode;
            node.next = currentNode;
            currentNode.prev = node;
            length++;
        }
    }
    public void removeNodeAtEnd(){
        if(head != null){
            currentNode = head;
            while(currentNode.getNext() != null){
                currentNode = currentNode.getNext();
            }
            DLLNode node = currentNode.prev;
            node.next = null;
            currentNode = null;
            length--;
        }else{
            head = null;
            length--;
        }
    }
    public void removeNodeAtPosition(Integer position){
        if(head != null){
            if(position == 1){
                DLLNode node = head.next;
                node.prev = null;
                head = node;
                length--;
                return;
            }
            currentNode = head;
            Integer i = 1;
            while(i < position){
                currentNode = currentNode.getNext();
                ++i;
            }
            DLLNode prevNode = currentNode.prev;
            DLLNode nextNode = currentNode.next;
            prevNode.next = currentNode.next;
            nextNode.prev = prevNode;
            currentNode = null;
            length--;
        }else{
            head = null;
            length--;
        }
    }

    public void printNodes(){
        String result = '[';
        if(head != null){
            DLLNode temp = head;
            while(temp.getNext() != null){
                result += temp.getData() + ', ';
                temp = temp.getNext();
            }
            result += temp.getData() + ']';
        }else{
            result += ']';
        }
        System.debug(result);
        System.debug(length);
    }

    public class DLLNode {
        Integer data;
        DLLNode prev;
        DLLNode next;
        
        public DLLNode(){}

        public DLLNode(Integer data){
            this.data = data;
        }
        public Integer getData(){
            return data;
        }
        public void setNext(DLLNode next){
            this.next = next;
        }
        public DLLNode getNext(){
            return next;
        }
		public void setPrev(DLLNode next){
            this.prev = prev;
        }
        public DLLNode getPrev(){
            return prev;
        }        
    }
}