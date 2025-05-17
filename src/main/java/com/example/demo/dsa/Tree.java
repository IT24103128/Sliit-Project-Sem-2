package com.example.demo.dsa;

import com.example.demo.models.Tutor;


public class Tree {
    private Node root; // first node of tree

    public Tree() {
        root = null;
    }

    public void insert(int id, Tutor dd) {
        Node newNode = new Node();
        newNode.iData = id;
        newNode.dData = dd;
        if (root == null) {
            root = newNode;
        } else {
            Node current = root;
            Node parent;
            while (true) {
                parent = current;
                if (id < current.iData) {
                    current = current.leftChild;
                    if (current == null) {
                        parent.leftChild = newNode;
                        return;
                    }
                } else {
                    current = current.rightChild;
                    if (current == null) {
                        parent.rightChild = newNode;
                        return;
                    }
                }
            }
        }
    }

    public void remove(int key) {
        root = removeRecursive(root, key);
    }

    private Node removeRecursive(Node root, int key) {
        if (root == null) {
            return null;
        }

        if (key < root.iData) {
            root.leftChild = removeRecursive(root.leftChild, key);
        } else if (key > root.iData) {
            root.rightChild = removeRecursive(root.rightChild, key);
        } else {
            // Node found

            // Case 1: No child
            if (root.leftChild == null && root.rightChild == null) {
                return null;
            }

            // Case 2: One child (left or right)
            if (root.leftChild == null) {
                return root.rightChild;
            } else if (root.rightChild == null) {
                return root.leftChild;
            }

            // Case 3: Two children
            Node successor = findMin(root.rightChild);
            root.iData = successor.iData;
            root.dData = successor.dData;
            root.rightChild = removeRecursive(root.rightChild, successor.iData);
        }
        return root;
    }

    private Node findMin(Node node) {
        while (node.leftChild != null) {
            node = node.leftChild;
        }
        return node;
    }


    public Node find(int key) {
        Node current = root;
        while (current.iData != key)
        {
            if(key < current.iData)
                current = current.leftChild;
            else
                current = current.rightChild;
            if (current == null)
                return null;
        }
        return current;
    }

    private void inOrder(Node localRoot) {
        if (localRoot != null) {
            inOrder(localRoot.leftChild);
            localRoot.displayNode();
            inOrder(localRoot.rightChild);
        }
    }

    private void preOrder(Node localRoot) {
        if (localRoot != null){
            localRoot.displayNode();
            preOrder(localRoot.leftChild);
            preOrder(localRoot.rightChild);
        }
    }

    private void postOrder(Node localRoot){
        if (localRoot != null) {
            postOrder(localRoot.leftChild);
            postOrder(localRoot.rightChild);
            localRoot.displayNode();
        }
    }
}
