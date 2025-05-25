package com.example.demo.dsa;

import com.example.demo.models.Tutor;

public class MergeSort {

    public static void mergeSort(Tutor[] tutors, int left, int right) {

        if (left < right) { // check if array (sub) onl have one element or not
            int  mid = (left + right) / 2; // to find mid index ,if left is 10 and right is 20 mid is 15;

            mergeSort(tutors, left, mid); // pass the left side of array to mergeSort
            mergeSort(tutors, mid + 1, right);

            // Merge the sorted halves
            merge(tutors, left, mid, right);
        }
    }

    public static void merge(Tutor[] tutors, int left, int mid, int right) {
        int leftArrSize = mid - left + 1; // get the difference between mid index and right index and then add 1 to get size
        int rightArrSize = right - mid;

        Tutor[] leftArr = new Tutor[leftArrSize];
        Tutor[] rightArr = new Tutor[rightArrSize];

        // insert data into leftArr and rightArr
        for (int i=0; i<leftArr.length; i++){
            leftArr[i] = tutors[left+i];
        }

        for (int i=0; i<rightArr.length; i++){
            rightArr[i] = tutors[mid+i + 1]; // start with mid + i + 1, because first is next index of mid
        }

        int leftArrIndex = 0; // to iterate over left Array
        int rightArrIndex = 0; // to iterate over right Array
        int startIndex = left;

        while (leftArrIndex < leftArrSize && rightArrIndex < rightArrSize){
            if (leftArr[leftArrIndex].getSubjectExpertise() <= rightArr[rightArrIndex].getSubjectExpertise()){
                tutors[startIndex] = leftArr[leftArrIndex];
                leftArrIndex++;
            }
            else {
                tutors[startIndex] = rightArr[rightArrIndex];
                rightArrIndex++;
            }
            startIndex ++;
        }

        // If above
        while (leftArrIndex<leftArrSize){
            tutors[startIndex] = leftArr[leftArrIndex];
            startIndex++;
            leftArrIndex++;
        }

        while (rightArrIndex<rightArrSize){
            tutors[startIndex] = rightArr[rightArrIndex];
            startIndex++;
            rightArrIndex++;
        }

    }



}
