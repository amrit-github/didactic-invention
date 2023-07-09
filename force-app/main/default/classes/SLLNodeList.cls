public class SLLNodeList{//
    
    public SLLNode head;
    public SLLNode currentNode;
    public Integer length = 0;
    
    public SLLNodeList(){}
    
    public SLLNode addFirstNode(Integer data){
        if(head == null){
            SLLNode node = new SLLNode(data);
            node.setNext(null);
            head = node;
            currentNode = node;
            length++;
            return node;
        }
        return null;
    }
    public SLLNode addNodeAtEnd(Integer data){
        if(head != null){
            currentNode = head;
            while(currentNode.getNext() != null){
                currentNode = currentNode.getNext();
            }
            SLLNode node = new SLLNode(data);
            currentNode.setNext(node);
            node.setNext(null);
            length++;
            return node;
        }
        return null;
    }
    public SLLNode removeNodeAtEnd(){
        if(head != null){
            currentNode = head;
            SLLNode tail = head;
            
            while(currentNode.getNext() != null){
                tail = currentNode;
                currentNode = currentNode.getNext();
            }
            currentNode = null;
            tail.setNext(null);
            length--;
        }else{
            head = null;
        }
        return head;
    }
    public void removeNodeAtPosition(Integer position){
        if(head != null){
            if(position == 1){
                head = head.getNext();
                length--;
                return;
            }
            currentNode = head;
            SLLNode tail = head;
			Integer i = 1;
            
            while(i < position){
                tail = currentNode;
                currentNode = currentNode.getNext();
                ++i;
            }
            tail.setNext(currentNode.getNext());
            currentNode = null;
            length--;
        }else{
            head = null;
            length--;
        }
    }
    public SLLNode addNodeAtPosition(Integer data, Integer position){
        if(head != null){
            if(position == 1){
                SLLNode node = new SLLNode(data);
                node.setNext(head);
                head = node;
                length++;
                return node;
            }
            currentNode = head;
            Integer i = 1;
            while(i < position-1){
                currentNode = currentNode.getNext();
                ++i;
            }
            SLLNode tempNode = currentNode.getNext();
            SLLNode node = new SLLNode(data);
            currentNode.setNext(node);
            node.setNext(tempNode);
            length++;
            return node;
        }
        return null;
    }
    public void printNodes(){
        String result = '[';
        if(head != null){
            SLLNode temp = head;
            while(temp.getNext() != null){
                result += temp.getData() + ', ';
                temp = temp.getNext();
            }
            result += temp.getData() + ']';
        }else{
            result += ']';
        }
        System.debug('Initial Nodes' + result);
        System.debug(length);
    }
    
    public void reverseSLL(SLLNode head){ //10, 15, 20, 30 ,40

        SLLNode currentNode = head;
        SLLNode prev = null;
        while(currentNode != null){
            SLLNode nextNode = currentNode.getNext();
            currentNode.setNext(prev);
            prev = currentNode;
            currentNode = nextNode;
        }
        head = prev;
    }
    
    public class SLLNode {
        Integer data;
        SLLNode next;
        
        public SLLNode(){
            this.data = null;
            this.next = null;
        }
        public SLLNode(Integer data){
            this.data = data;
        }
        
        public void setData(Integer data){
            this.data = data;
        }
        public Integer getData(){
            return data;
        }
        public void setNext(SLLNode next){
            this.next = next;
        }
        public SLLNode getNext(){
            return next;
        }        
    }
}