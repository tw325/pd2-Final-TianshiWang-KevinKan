import java.io.*;
import java.util.*;

 class MyLinkedList<E>{
    
     Node<E> head;
     Node<E> tail;

     MyLinkedList() {
      head = new Node<E>(null);
      tail = head;
    }
        
     void add(E d) { //Add to end
      Node<E> n = new Node<E>(d);
      if (head == null){
        head = new Node<E>(d);
        tail = head;
      }
      else{
        tail.setNext(n);
        tail = n;
      }
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
      head = new Node<E>(null);
      tail = head;
      return s;
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

}

