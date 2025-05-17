package com.example.demo.dsa;

import com.example.demo.models.Tutor;

import java.util.List;

public class MergeSort {
    public static void mergeSort(List<Tutor> tutors) {
        if (tutors == null || tutors.size() <= 1) {
            return; // Already sorted
        }
        mergeSortHelper(tutors, 0, tutors.size() - 1);
    }

    private static void mergeSortHelper(List<Tutor> tutors, int left, int right) {
        if (left < right) {
            int mid = left + (right - left) / 2;

            mergeSortHelper(tutors, left, mid);
            mergeSortHelper(tutors, mid + 1, right);
            merge(tutors, left, mid, right);
        }
    }

    private static void merge(List<Tutor> tutors, int left, int mid, int right) {
        int leftSize = mid - left + 1;
        int rightSize = right - mid;

        Tutor[] leftArray = new Tutor[leftSize];
        Tutor[] rightArray = new Tutor[rightSize];

        for (int i = 0; i < leftSize; i++)
            leftArray[i] = tutors.get(left + i);
        for (int j = 0; j < rightSize; j++)
            rightArray[j] = tutors.get(mid + 1 + j);

        int i = 0, j = 0, k = left;

        while (i < leftSize && j < rightSize) {
            if (leftArray[i].getSubjectExpertise() <= rightArray[j].getSubjectExpertise()) {
                tutors.set(k, leftArray[i]);
                i++;
            } else {
                tutors.set(k, rightArray[j]);
                j++;
            }
            k++;
        }

        while (i < leftSize) {
            tutors.set(k, leftArray[i]);
            i++;
            k++;
        }

        while (j < rightSize) {
            tutors.set(k, rightArray[j]);
            j++;
            k++;
        }
    }
}
