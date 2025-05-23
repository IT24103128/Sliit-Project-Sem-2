package com.example.demo.dsa;

import com.example.demo.models.Tutor;

public class Node {
    public int iData; // data item (used as key value) // Tutor ID
    public Tutor dData; // other data
    public Node leftChild; // left child
    public Node rightChild; // right child

    public void displayNode() {
        System.out.print("{" + iData);
        dData.displayDetails();
    }

}