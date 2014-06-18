import java.io.*;
import java.util.*;

 class MyLinkedList<E> implements Iterable<E> {
    
     Node<E> head;
     Node<E> tail;

     Iterator<E> iterator(){
      MyLinkedListIterator<E> mlli = new MyLinkedListIterator<E>(head);
      return mlli;
    }

     MyLinkedList() {
      head = new Node<E>(null);
      tail = head;
    }
    
    
     void add(E d) { //Add to end
      Node<E> n = new Node<E>(d);
      tail.setNext(n);
      tail = n;
    }


     void add (int i, E s){
      Node<E> temp = new Node<E>(s);
      Node<E> index = head;
      while (i>0){
          index = index.getNext();
          i--;
      }
      temp.setNext(index.getNext());
      index.setNext(temp);
    
      if (temp.getNext() == null)
          tail = temp;
    }

     E get(int i){
      Node<E> temp = head;
      while (i>0){
          temp = temp.getNext();
          i--;
      }
      return temp.getNext().getData();
    }

     E set(int i,E s){
      Node<E> temp = new Node<E>(s);
      Node<E> index = head;
    
      while (i>0){
          index = index.getNext();
          i--;
      }
      temp.setNext(index.getNext().getNext());
            E ans = index.getNext().getData();
      index.setNext(temp);
      return ans;
    }

     E remove(int i){
      Node<E> index = head;
      while (i>0){
          index = index.getNext();
          i--;
      }
            E s = index.getNext().getData();
      index.setNext(index.getNext().getNext());
      return s;
    }
    
     int length(){
      Node<E> index = head;
      int i = 0;
      while (index.getNext() != null){
          i++;
          index = index.getNext();
      }
      return i;
    }
      

     class MyLinkedListIterator<E> implements Iterator<E> {

       Node<E> current;
      
       MyLinkedListIterator(Node<E> n){
          current = n;
      }
      
       boolean hasNext(){
          return (current.getNext() != null);
      }
    
       E next() {
          E next = current.getData();
          current = current.getNext();
          return next;
      }
      
      void remove() {}
      
      
    }

}

