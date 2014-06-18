 class Node<E> {

     E data;
     Node<E> next;

     Node(E d) {
      data = d;
      next = null;
    }

     void setData(E d) {
      data = d;
    }
     E getData() {
      return data;
    }
     void setNext(Node<E> n){
      next = n;
    }
     Node<E> getNext() {
      return next;
    }
     String toString() {
      return data.toString();
    }

}
